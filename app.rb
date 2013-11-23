#allows to interface with stuff scraped. 

# require_relative '../lib/*'
require 'launchy'
require './lib/scraper.rb'
require './lib/student.rb'

class App
  attr_reader :names, :blogs, :twitters

  def initialize
    student_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
    @names = student_scraper.get_students_names #array
    @blogs = student_scraper.get_students_blogs #array
    @twitters = student_scraper.get_students_twitter_usernames #array
  end
  
  def generate_class
    students = []
    28.times do |i|
        students << Student.new(names[i], blogs[i], twitters[i]) #instance of class Student, referring to initialized variables (which are arrays)
    end
    students #array of student objects
  end

  def puts_class
    generate_class.each do |classmate|
      puts "Name: #{classmate.name}, Blog: #{classmate.blog}, Twitter: #{classmate.twitter}"
    end
  end

  def get_rando_blog
    Launchy.open("#{blogs.sample}")
  end

  def get_rando_twitter
    Launchy.open("www.twitter.com/#{twitters.sample[1..-1]}")
  end

  def get_specific_blog(student_name)
    generate_class.each do |each_student|
      if each_student.name.start_with?(student_name)
        Launchy.open("#{each_student.blog}")
      end
    end
  end

  def get_specific_twitter(student_name)
    generate_class.each do |each_student|
      if each_student.name.start_with?(student_name)
        Launchy.open("www.twitter.com/#{each_student.twitter[1..-1]}")
      end
    end
  end

end

test = App.new

# test.get_specific_twitter("Sarah Ransohoff")
