require 'open-uri' #open the file on the internet
require 'nokogiri' #line10: Nokogiri is a class, HTML is a method, download is the parameter

class Scraper
    
    attr_reader :html

    def initialize(url)
        download = open(url)
        @html = Nokogiri::HTML(download)
    end

    def get_students_names
        all_the_h3s = html.search("h3")
        new_names = all_the_h3s.text.split(/(?<=[a-z.])(?=[A-Z])/)
    end

    def get_students_blogs
        blogs = []
        # num_of_blogs = html.search("ul .social").length
        html.search("ul .social").each do |social_div|
            if social_div.search("a.blog").text == "Blog"
                blogs << social_div.search("a.blog")[0]["href"]
            else
                blogs << "none"
            end
        end
        blogs
        #==older code
        # blogs = []
        # num_of_blogs = html.search("li .blog").length
        # num_of_blogs.times do |i|
        #     blogs << html.search("li .blog")[i]["href"]
        # end
        # blogs
    end

    def get_students_twitter_usernames
        # mixed_twitters = html.search("li:first-child a").text.split(" ")
        # twitter_array = mixed_twitters.select { |name| name[0] = "@" }
        # ==experimental code
        twitters = []
        # num_of_twitters = html.search("li:first-child a").length
        html.search("li:first-child a").text.split(" ").each do |li_first|
            if li_first[0] == "@"
                twitters << li_first
            else
                twitters << "none"
            end
        end
        twitters
    end
end

#these are the things you'll wanna do in your test
my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
# puts my_scraper.get_students_names
# puts my_scraper.html #show all text
puts my_scraper.get_students_twitter_usernames #show twitter name
# puts my_scraper.get_students_blogs #show blogs

#get blogs-- in a tag and href attribute, get twitter urls

#what should a studnet do: respond to name. 