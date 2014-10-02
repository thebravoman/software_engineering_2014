Dir.glob(ARGV[0] + "*.rb") do |script_file|
Dir.glob(ARGV[1] + "*") do |fixture|

exp_output= ""
script=script_file.split("/").last
fix=fixture.split("/").last
second_class=script_file.split("/").last.split(".").first.split("_").last

	if second_class == '2'
	if File.exist?("#{fixture}/expected_results2.csv")

		script_output=`ruby #{script_file} #{fixture}`
		exp_results=File.open("#{fixture}/expected_results2.csv", "r")
		
		exp_results.each do |line|
			exp_output << line
	end
	
	if script_output.gsub("\n", '') == exp_output.gsub("\n", '')
		puts "#{script}'s against #{fix}'s is TRUE"
		puts
	else
		puts "#{script}'s against #{fix}'s is FALSE" 
		puts
	end
		exp_results.close
	end
	end
		
end
end

