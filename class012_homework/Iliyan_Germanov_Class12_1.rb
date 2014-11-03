require 'csv'

count = 0
results = Hash.new
notOnTime = Array.new

def onTime(targetPath)
	logLines = Array.new
	log = `git log #{targetPath}`

	log.split("\n").each do |line|
		if line.include?("Date: ")
			logLines = line.split(" ")
		end
	end

	month = logLines[2]
	date = logLines[3].to_i
	time = logLines[4].split(":").first.to_i
	
	if month != "Sep" then return false end
	if date > 29 then return false end
	if date == 29 && time >= 20 then return false end
	
	return true
end	


Dir.glob(ARGV[0]+"*1.rb").each do |script_file|
	if onTime(script_file)
		short_script_file = script_file.split("/").last
		results[short_script_file] = Hash.new
		Dir.glob(ARGV[1]+"*").each do |fixture|
				short_expected_file = fixture.split("/").last
				expected_file = fixture+"/expected_results.csv"
				if File.exists?(expected_file) 
					output = `ruby #{script_file} #{fixture}`
					file_content = File.read(expected_file)
				
					if (output.gsub("\n", '') <=> file_content.gsub("\n", '')) == 0
						count += 1
						results[short_script_file][short_expected_file] = 1
					else
						results[short_script_file][short_expected_file] = 0
						count -= 1
					end 
				end
		end
	else
		notOnTime << script_file.split("/").last	
	end
end

CSV.open("results.csv","w") do |csv|
	csv << ["Name",results.first[1].keys].flatten
	results.keys.each do |key|
		csv << [key,results[key].values].flatten	
	end
	csv << ["Not on time:"]
	notOnTime.each do |student|
		csv << [student]
	end
end

puts count


