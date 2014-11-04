require 'csv'
results = Hash.new
count = 0

Dir.glob(ARGV[0]+"*2.rb").each do |script_file|
	commit_time = `git log --until=Sep--29--2014--20:00:00 #{script_file}`
	if !commit_time.empty?
		results[script_file] = Hash.new
		count += 1	
		Dir.glob(ARGV[1]+"*").each do |fixture|
			fixture_value = fixture.split("/").last.split(".").first
			expected_file = fixture+"/expected_results2.csv"
			if File.exists?(expected_file) 
				output = `ruby #{script_file} #{fixture}`
				file_content = File.read(expected_file)		
				if (output <=> file_content) == 0
					results[script_file][fixture_value] = 1
				else
					results[script_file][fixture_value] = 0
				end	
			end	
		end
	end
end

CSV.open("results.csv","w") do |csv|
	if count != 0
		csv << ["Program name", results.first.last.keys].flatten
	end
	results.keys.each do |key|
		csv << [key.split("/").last.split(".").first, results[key].values].flatten
	end
end