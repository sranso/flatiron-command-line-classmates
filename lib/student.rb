#TO DO
#WRITE TESTS FOR STUDENT CLASSES

#will hold information scraped from the website

class Student

    attr_accessor :name, :blog, :twitter

    def initialize(name, blog, twitter)
        @name = name
        @blog = blog
        @twitter = twitter
    end

end