Dir.glob ("#{ARGV[0]}*.rb") do |script_file|
	Dir.glob("#{ARGV[1]}*") do |fixture|
	program_result = `ruby #{script_file} #{fixture}`
	if File.exist?("#{fixture}/expected_results2.csv")
		fixture_result_file = File.open("#{fixture}/expected_results2.csv")
		fixture_result = IO.read(fixture_result_file)
		if program_result == fixture_result
			puts "\n\n\n#{script_file} : #{fixture}\n\n\n"
		end
	end
	end
end
