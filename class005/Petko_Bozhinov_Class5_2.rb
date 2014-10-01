# Class 4 - 11. grade, ELSYS 2014/2015
# Petko '3phase' Bozhinov
# Task 5

require 'csv'
DEFAULT_PATH = 'D:/GitClone/software_engineering_2014'
Dir.glob("#{DEFAULT_PATH}/" + ARGV[0] + "*.rb") do |script_file|
  Dir.glob("#{DEFAULT_PATH}/" + ARGV[1] + "*") do |fixture|
	student_grade = script_file.split('/').last.split('.').first.split('_').last.to_i
	if student_grade == 2
		output = %x{ruby #{script_file} #{fixture}}
	  	if File.exists?("#{fixture}/expected_results2.csv")
	  		file = File.open("#{fixture}/expected_results2.csv","r")
	  		contents = file.read
			script_file_name = script_file.split('/').last.split('.').first.split('_')
			fixture_name = fixture.split('/').last.split('_')
			if output == contents
				puts "#{script_file_name[0]} #{script_file_name[1]}'s program VS #{fixture_name[0]}'s fixture: TRUE"
			else
				puts "#{script_file_name[0]} #{script_file_name[1]}'s program VS #{fixture_name[0]}'s fixture: FALSE"
			end
			file.close
		else
			next
		end
	end
  end
end