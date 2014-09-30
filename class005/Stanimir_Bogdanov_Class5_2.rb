Dir.glob(ARGV[0] + "*.rb") do |program|
  Dir.glob(ARGV[1] + "*") do |fixture|
    if program.split('/').last.split('.').first.split('_').last == '2'
	  if File.exist?("#{fixture}/expected_results2.csv")
	    program_output = `ruby #{program} #{fixture}`
	    expected_result_file = File.open("#{fixture}/expected_results2.csv", "r")
	    expected_result_content = IO.read(expected_result_file)
	    if program_output.gsub(/\s/, '') == expected_result_content.gsub(/\s/, '')
	   	  puts "#{program.split('/').last} WORKS WITH #{fixture.split('/').last}"
	    else
	      puts "#{program.split('/').last} DOES NOT WORK WITH #{fixture.split('/').last}"
	    end

	    expected_result_file.close
	  end
    end
  end
end