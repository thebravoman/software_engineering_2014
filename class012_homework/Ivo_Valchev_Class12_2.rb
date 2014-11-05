require 'csv'

count =0
error = 0
results = Hash.new

Dir.glob(ARGV[0]+"*2.rb").each do |script_file|
	script_file_value = script_file.split('/').last.split('.').first
	results[script_file_value] = Hash.new
	git_log = `git log --until=Sep--29--2014--20:00:00 #{script_file}`
	if !git_log.empty?
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
end
CSV.open("results.csv","w") do |csv|
	csv << ["Program name", results.first.last.keys].flatten
	results.keys.each do |key|
		csv << [key,results[key].values].flatten
	end
end
puts count


