require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))


    #binding.pry
  end

  def get_courses
    get_page.css(".post").each do |course|
      course_instance = Course.new
      course_instance.title = course.css("h2").text
      course_instance.schedule = course.css(".date").text
      course_instance.description = course.css("p").text
    end


  end

  def make_courses

  end
end

#Scraper.new.get_page
