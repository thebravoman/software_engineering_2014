require 'csv'
results = Hash.new
count = 0

Dir.glob(ARGV[0]+"*/*").each do |script_file|
 script_file_name = script_file.split("/").last.reverse.split("_",3).last.reverse.gsub("_", " ")
	commit_time = `git log --until=Sep--29--2014--20:00:00 #{script_file}`
	# puts commit_time
 if !commit_time.empty?
 	results[script_file_name] = Hash.new
 	count += 1
 	fixture_value = script_file.split("/").last.split(".").first.gsub("_", " ")
 	expected_file = script_file+"/expected_results2.csv"
   
  if File.exists?(expected_file) 

 	output = `ruby #{script_file}`
 	file_content = File.read(expected_file)
   
 	if (output <=> file_content) == 0
 	results[script_file_name][fixture_value] = 1
 	else
 	results[script_file_name][fixture_value] = 0
 	end
   
 	end
   
 	end
   
  end 


CSV.open("results_Borislav_Rusinov_A_1.csv","w") do |csv|
   
 if count != 0
 	csv << ["Program name", results.first.last.keys].flatten

 end
   
 results.keys.each do |key|
 	csv << [key.split("/").last.split(".").first, results[key].values].flatten
 	end

end
