#Team FlowerpotCode

require 'csv'

count =0
error = 0
results = Hash.new
deadline = Time.new(2014, 9, 29, 20, 0, 0, "+03:00")

Dir.glob(ARGV[0]+"*2.rb").each do |script_file|
	script_file_value = script_file.split('/').last.split('.').first
	results[script_file_value] = Hash.new
	commitedON = `git log #{script_file}`.split(":   ").last.split("\n").first
	date = Time.new(commitedON.split(' ')[4], commitedON.split(' ')[1], commitedON.split(' ')[2], commitedON.split(' ')[3].split(':')[0], commitedON.split(' ')[3].split(':')[1], commitedON.split(' ')[3].split(':')[2].to_i, "+03:00")
 Dir.glob(ARGV[1]+"*").each do |fixture|
		fixture_file_value = fixture.split('/').last.split('.').first
			expected_file = fixture+"/expected_results.csv"
			if File.exists?(expected_file) 
				output = `ruby #{script_file} #{fixture}`
				file_content = File.read(expected_file)
				if (output <=> file_content) == 0 and date <= deadline
					results[script_file_value][fixture_file_value] = 1
				else
					results[script_file_value][fixture_file_value] = 0
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