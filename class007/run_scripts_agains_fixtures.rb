require 'csv'

count =0
error = 0
results = Hash.new

Dir.glob(ARGV[0]+"*1.rb").each do |script_file|
	results[script_file] = Hash.new
 Dir.glob(ARGV[1]+"*").each do |fixture|
			expected_file = fixture+"/expected_results.csv"
			if File.exists?(expected_file) 
				output = `ruby #{script_file} #{fixture}`
				file_content = File.read(expected_file)
				
				if (output <=> file_content) == 0
					results[script_file][fixture] = 1
				else
					results[script_file][fixture] = 0
				end 
			end
	end
end
CSV.open("results.csv","w") do |csv|
	results.keys.each do |key|
		csv << results[key]
	end
end
puts count


