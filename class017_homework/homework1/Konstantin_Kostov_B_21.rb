result=Hash.new
require_relative "html_Konstantin_Kostov_21_B_writer.rb"
require 'csv'
Dir.glob("#{ARGV.first}/**/*.*") do |file|
short_file = file.split(/\//).last
if short_file.include? ("_")
first_name = short_file.split(/_/).first.capitalize
last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
s = file.split(/_/)
work_num = s.last.split(/\./).first
name = first_name + ',' + last_name
result[name]=' '+ "1"
end
puts result
end
writer = HTMLWriter.new
writer.write(result)
