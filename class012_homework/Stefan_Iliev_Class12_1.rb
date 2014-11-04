require 'csv'
count =0
error = 0
results = Hash.new

#ARGV[0] = scripts; ARGV[1] = fixtures; ARGV[2] = chktime path; ARGV[3] = until_time_limit; ARGV[4] = point penalty; ARGV[5] = -x || help ||; -x accumulates (stacks) point penalty for each late commit. 
#example ... scripts_path fixtures_path <path>/Stefan_Iliev_Class12_chktime YEAR:MM:DD:HH:MM 0.25 -x

Dir.glob(ARGV[0]+"/*1.rb").each do |script_file|
	short_script_file = script_file.split(/\//).last
	results[short_script_file] = Hash.new
 Dir.glob(ARGV[1]+"/*").each do |fixture|
			short_expected_file = fixture.split(/\//).last
			expected_file = fixture+"/expected_results.csv"
			if File.exists?(expected_file) 
				output = `ruby #{script_file} #{fixture}`
				file_content = File.read(expected_file)
				
				if (output <=> file_content) == 0
					time = `ruby #{ARGV[2] || "Stefan_Iliev_Class12_chktime.rb"} #{script_file} #{ARGV[3] || "2014:09:29:20:00"} #{ARGV[4] || "1"} #{ARGV[5] || ""} `.to_f
					if time == 1 then time = time.to_i end
					results[short_script_file][short_expected_file] = 1*time
					#if time == 0 then p short_script_file end
				else
					results[short_script_file][short_expected_file] = 0
				end 
			end
	end
end
CSV.open("results.csv","w") do |csv|
	csv << ["Name",results.first[1].keys].flatten
	results.keys.each do |key|
		csv << [key,results[key].values].flatten	
	end
end
puts count


