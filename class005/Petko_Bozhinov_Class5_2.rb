# Class 4 - 11. grade, ELSYS 2014/2015
# Petko '3phase' Bozhinov
# Task 5

require 'csv'
Dir.glob(ARGV[0] + "*.rb") do |script_file|
  Dir.glob(ARGV[1] + "*") do |fixture|
	student_grade = script_file.split('/').last.split('.').first.split('_').last.to_i
	if student_grade == 2
		output = %x{ruby #{script_file} #{fixture}}
		if output.end_with? "\n"
			output = output[0..-2]
		end
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