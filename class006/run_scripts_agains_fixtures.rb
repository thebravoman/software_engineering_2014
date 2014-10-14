require 'csv'

def remove_new_lines string
	string.delete "\n"
end

results = Hash.new

count =0
Dir.glob(ARGV[0]+"*2.rb").each do |script_file|
	results[script_file] = Hash.new
 Dir.glob(ARGV[1]+"*").each do |fixture|
			expected_file = fixture+"/expected_results2.csv"
			if File.exists?(expected_file) 
				output = `ruby #{script_file} #{fixture}`
				file_content = File.read(expected_file)
				
				file_content = remove_new_lines file_content
				output = remove_new_lines output
				
				fixture_to_result = results[script_file]
				if (output <=> file_content) == 0
					count +=1
					fixture_to_result[fixture] = 1
				else
					count -=1
					fixture_to_result[fixture] = 0
				end
			end
	end
end
=begin
hash_map = -> THIS ONE WORKS
		{
			key:student1
			value: {F1:1,F2:0,F3:1,F4:0}	
		}
=end
CSV.open("results.csv", "w") do |csv|
	results.each_key do |key|
		csv << [key,results[key].values].flatten
	end
end


