
require 'csv'
results = Hash.new
count = 0

Dir.glob(ARGV[0]+"*2.rb").each do |script_file|
 script_name = script_file.split("/").last.reverse.split("_",3).last.reverse.gsub("_", " ")


 commitTime = `git log --until=Sep--29--2014--20:00:00 #{script_file}`

 if !commitTime.empty?
 	results[script_name] = Hash.new
 	count += 1

 	Dir.glob(ARGV[1]+"*").each do |fixture|
   
 	fixtureValue = fixture.split("/").last.split(".").first.gsub("_", " ")
 	expectedValue = fixture+"/expected_results2.csv"
   
  if File.exists?(expectedValue) 

 	output = `ruby #{script_file} #{fixture}`
 	fileContent = File.read(expectedValue)
   
 	if (output <=> fileContent) == 0
 	results[script_name][fixtureValue] = 1
 	else
 	results[script_name][fixtureValue] = 0
 	end
   
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
