require 'csv'
count =0
results = Hash.new

Dir.glob(ARGV[0]+"*2.rb").each do |script_file|	

	git_log = `git log  --until=29.09.2014:20:00:00 #{script_file}`
	script_file_value = script_file.split("/").last.reverse.split("_", 3).last.reverse.gsub("_"," ")


		if !git_log.empty?
			results[script_file_value] = Hash.new
			count += 1
	
Dir.glob(ARGV[1]+"*").each do |fixture|
	
	fixture_file_value = fixture.split('/').last.split('.').first
	expected_file = fixture+"/expected_results.csv"
		
		if File.exists?(expected_file)
			output = `ruby #{script_file} #{fixture}`
			file_content = File.read(expected_file)
				if (output <=> file_content) == 0
					results[script_file_value][fixture_file_value] = 1
				else
					results[script_file_value][fixture_file_value] = 0
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
end
