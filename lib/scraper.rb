require 'open-uri' #open the file on the internet
require 'nokogiri' #line10: Nokogiri is a class, HTML is a method, download is the parameter

class Scraper
  
  attr_reader :html

  def initialize(url)
      download = open(url)
      @html = Nokogiri::HTML(download)
  end

  def get_names
      all_the_h3s = html.search("h3")
      # new_names = all_the_h3s.text.split(/(?<=[a-z.])(?=[A-Z])/)
      # all_the_h3s.text --> calls .text on an entire array
      all_the_h3s.collect do |h3| # --> calls .text on each item in an array
          h3.text # -->gets the text from each item in array
      end
  end

  def get_blogs

      #==code v3 --> doesn't account for those w/o blogs
      #html.search("a.blog").collect { |anchor| anchor["href"] }
      #html.search("a.blog @href").collect { |anchor| anchor.text } --> also works
      
      #==code v2 --> accounts for those w/o blogs
      html.search(".back").collect do |back_side| #every ul w/ the class social
          if back_side.search("a.blog").text == "Blog"
              back_side.search("a.blog")[0]["href"]
          else
              "none"
          end
      end

      #==code v1
      # blogs = []
      # num_of_blogs = html.search("li .blog").length
      # num_of_blogs.times do |i|
      #     blogs << html.search("li .blog")[i]["href"]
      # end
      # blogs
  end

  def get_twitters
      # mixed_twitters = html.search("li:first-child a").text.split(" ")
      # twitter_array = mixed_twitters.select { |name| name[0] = "@" }
      twitters = []
      html.search(".back").each do |back_side|
        if back_side.search(".twitter").text.split[0].nil?
          twitters << "none"
        else
          twitters << back_side.search(".twitter").text.split[0]
        end
      end
      twitters
  end
end

my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
# puts my_scraper.get_names
# p my_scraper.get_twitters #show twitter name
# puts my_scraper.get_blogs.size #show blogs

