Dir.glob(ARGV[0] + "*.rb") do |script_file| 
	Dir.glob(ARGV[1] + "*") do |fixture| 
		p "#{script_file} #{fixture}" 
		system("ruby #{script_file} #{fixture}")
 
		bool = false 
		file = File.open("#{ARGV[1]}" + "/*/expected_results2.csv", "r") do |f1| 			
			while line = f1.gets  
    				puts line  
 			end 
		
			expected_results = file.read()
		end

		if (system == expected_results) 
			bool = true 
			puts bool 
		end
		file.close
=begin
		file = File.open ('#{fixture}/expected_results2.csv','r')
			expected_results = file.read()
		file.close()
=end		
	end
end
