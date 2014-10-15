# ruby run_scripts_agains_fixtures.rb ../generating/from_students/ ../generating/expects/
require 'csv'

results = Hash.new
count =0
Dir.glob(ARGV[0]+"*.rb").each do |script_file|
	results[script_file] = Hash.new
	args = ["fixture1","fixture2",4]
	
	output = `ruby #{script_file} #{args[0]} #{args[1]} #{args[2]}`
	fixture_to_result = results[script_file]
	begin
		hex = script_file.split("/").last.split('_')[3].split('.')[0]
	rescue Expection=>ex
		fixture_to_result[:expected] = "Can not be determined since the hex is null. Check file name format"
	end
	if hex != nil
		expected_content = File.read(ARGV[1]+hex+".csv")
		fixture_to_result[:expected] = expected_content
	end
	fixture_to_result[:output] = output
	if (output <=> expected_content) == 0
		fixture_to_result[:result] = 1
	else
		fixture_to_result[:result] = 0
	end
end

CSV.open("results.csv", "w") do |csv|
	results.each_key do |key|
		csv << [key,results[key].values].flatten
	end
end


