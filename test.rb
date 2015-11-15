require 'watir-webdriver'
require 'headless'

puts "driving now"

headless = Headless.new
headless.start
b = Watir::Browser.new
b.goto 'http://www.google.com'
puts b.title
b.close
headless.destroy
