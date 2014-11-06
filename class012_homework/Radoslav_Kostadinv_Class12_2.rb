require 'csv'
results = Hash.new

def commitedOnTime(targetPath)
	splittedLog = Array.new
	log = `git log #{targetPath}`
if !log.empty?
	log.split("\n").each do |line|
		if line.include?("Date")
			splittedLog = line.split(" ")
		end
	end
end

	month = splittedLog[2]
	date = splittedLog[3].to_i
	time = splittedLog[4].split(":").first.to_i
	
	if month != "Sep" 
		return false 
	end
	if date > 29 
		return false 
	end
	if date == 29 && time >= 20 
		return false 
	end
	
	return true
end

Dir.glob(ARGV[0]+"*2.rb").each do |script_file|
	if commitedOnTime(script_file)
		script_file_name = script_file.split("/").last.reverse.split("_",3).last.reverse.gsub("_", " ")
		results[script_file_name] = Hash.new
		 	Dir.glob(ARGV[1]+"*").each do |fixture|
	 			fixture_value = fixture.split("/").last.split(".").first.gsub("_", " ")
	 			expected_file = fixture+"/expected_results2.csv"
	  			if File.exists?(expected_file) 
	 				output = `ruby #{script_file} #{fixture}`
	 				expected_results = File.read(expected_file)
	 				if (output <=> expected_results) == 0
	 					results[script_file_name][fixture_value] = 1
	 				else
	 					results[script_file_name][fixture_value] = 0
	 				end
	 			end
			end
		end 
	end

CSV.open("results.csv","w") do |csv|
	 	csv << ["Program name", results.first[1].keys].flatten

	results.keys.each do |key|
 		csv << [key,results[key].values].flatten
 	end
end
