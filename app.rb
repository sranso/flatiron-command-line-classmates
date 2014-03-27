#allows us to interface with stuff scraped

require 'launchy'
require './lib/scraper.rb'
require './lib/student.rb'

class App
  attr_reader :names, :blogs, :twitters

  def initialize
    student_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
    @names = student_scraper.get_names #array
    @blogs = student_scraper.get_blogs #array
    @twitters = student_scraper.get_twitters #array
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
      if each_student.name.upcase.start_with?(student_name)
        Launchy.open("#{each_student.blog}")
      end
    end
  end

  def get_specific_twitter(student_name)
    generate_class.each do |each_student|
      if each_student.name.upcase.start_with?(student_name)
        Launchy.open("www.twitter.com/#{each_student.twitter[1..-1]}")
      end
    end
  end

  def ask_user
    puts "Hey beautiful person, below are your options. Type the number of the one you want to do."
    puts "1. Open a random blog".rjust(27, ' ')
    puts "2. Open a random twitter".rjust(30, ' ')
    puts "3. Find a specific blog".rjust(29, ' ')
    puts "4. Find a specific twitter".rjust(32, ' ')
    puts "5. See the whole class' information".rjust(41, ' ')
    ans = gets.chomp
    while (%w[1 2 3 4 5].include? ans) == false
      ans = gets.chomp
    end
      if ans == "1"; get_rando_blog
      elsif ans == "2"; get_rando_twitter
      elsif ans == "3"
        puts "Whose?"
        name = gets.chomp.upcase
        get_specific_blog
      elsif ans == "4"
        puts "Whose?"
        name = gets.chomp.upcase
        get_specific_twitter(name)
      elsif ans == "5"
        puts_class
      end
    
  end

end

test = App.new
test.ask_user
