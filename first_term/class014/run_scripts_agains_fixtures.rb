require_relative "csv_writer.rb"

count =0
error = 0
results = Hash.new

Dir.glob(ARGV[0]+"*1.rb").each do |script_file|
	short_script_file = script_file.split(/\//).last
	results[short_script_file] = Hash.new
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

writer = CSVWriter.new
writer.write results

puts count
