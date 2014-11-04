require 'csv'

count =0
error = 0
results = Hash.new

Dir.glob(ARGV[0]+"*1.rb").each do |script_file|
	short_script_file = script_file.split(/\//).last
	log = `git log --format=%cd #{script_file}`
	log = log.split("\n")
	log = log[-1].split(" ")
	date = log[2].to_i
	hour = log[3].to_i
	if date < 29 
		results[short_script_file] = Hash.new
	elsif date == 29
		if hour < 20
			results[short_script_file] = Hash.new
		end
	else
		puts "#{short_script_file} didn't commit on time"
	end
 Dir.glob(ARGV[1]+"*").each do |fixture|
			short_expected_file = fixture.split(/\//).last
			expected_file = fixture+"/expected_results.csv"
			if File.exists?(expected_file) 
				output = `ruby #{script_file} #{fixture}`
				file_content = File.read(expected_file)
				
				
				if (output <=> file_content) == 0
					results[short_script_file][short_expected_file] = 1
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
