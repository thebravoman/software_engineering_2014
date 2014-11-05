# Petko '3phase' Bozhinov
# JustCrew

require 'csv'
results = Hash.new

Dir.glob(ARGV[0]+"*2.rb").each do |script_file|
	 short_script_file = script_file.split(/\//).last
	 results[short_script_file] = Hash.new
	 Dir.glob(ARGV[1]+"*").each do |fixture|
			short_expected_file = fixture.split(/\//).last
			expected_file = fixture+"/expected_results2.csv"
			if File.exists?(expected_file) 
				output = `ruby #{script_file} #{fixture}`
				output = output.gsub(/\n/,'')
				file_content = File.read(expected_file)
				file_content = file_content.gsub(/\n/,'')
				log = `git log --after=29.Sep.2014--20:00:00 #{script_file}`
				
				if (output <=> file_content) == 0
					results[short_script_file][short_expected_file] = 1
				else
					results[short_script_file][short_expected_file] = 0
				end 
				if log != ""
					results[short_script_file][short_expected_file] = nil
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