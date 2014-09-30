Dir.glob(ARGV[0] + "*.rb") do |script_file|
	Dir.glob(ARGV[1] + "**") do |fixture|
		p2_compare = ""
		p1_compare = ""
		name = script_file.split("/").last.split(".").first.split("_")
		fix_name = fixture.split("/").last.split("_")
		if name[3] == "1"
		next
		else
			if File.exist? "#{fixture}/expected_results2.csv" 
				program_output = `ruby #{script_file} #{fixture}`
	
				file2 = File.open("#{fixture}/expected_results2.csv", "r")
		
				file2.each do |line|
					p2_compare << line
    			end
    		
    			p2_out = program_output.gsub("\n", '')
    			p2_out2 = p2_compare.gsub("\n", '')
    		
    			if p2_out == p2_out2
    				puts "#{name[0]} #{name[1]}'s program VS #{fix_name[0]} #{fix_name[2]}'s fixture - WORK"
    				puts
    			else
    				puts "#{name[0]} #{name[1]}'s program VS #{fix_name[0]} #{fix_name[1]}'s fixture - DOES NOT WORK"
    				puts
    			end
    			
    			file2.close
			end
		end
	end
end

