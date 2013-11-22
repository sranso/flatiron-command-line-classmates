#allows to interface with stuff scraped. 

# require_relative '../lib/*'
require './lib/scraper.rb'
require './lib/student.rb'

# 1. make a new scraper
student_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")

# 2. get the student names from scraper
names = student_scraper.get_students_names

# 3. get blogs
blogs = student_scraper.get_students_blogs

# 4. get twitters
twitters = student_scraper.get_students_twitter_usernames

# 5. make a new student object for each person
#this is what we are doing for each: Sarah_Ransohoff = Student.new()
students = []
28.times do |i|
    students << Student.new(names[i], blogs[i], twitters[i])
end

students.each do |person|
    puts person.twitter
end