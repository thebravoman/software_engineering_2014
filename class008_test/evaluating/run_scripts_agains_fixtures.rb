# ruby run_scripts_agains_fixtures.rb# ruby run_scripts_agains_fixtures.rb "folder with results" "folder with expects" "folder with fixtures"
require 'csv'

results = Hash.new
count =0
Dir.glob(ARGV[0]+"*.rb").each do |script_file|
	results[script_file] = Hash.new
	args = [ARGV[2]+"fixture1",ARGV[2]+"fixture2",4]

	`ruby #{script_file} #{args[0]} #{args[1]} #{args[2]}`
	fixture_to_result = results[script_file]

	begin
		hex = script_file.split("/").last.split('_')[3].split('.')[0]
		if hex != nil
				fixture_to_result[:expected] = expected_content = File.read(ARGV[1]+hex+".csv")
		end
	rescue Exception=>ex
		fixture_to_result[:expected] = "Can not be determined since the hex is #{hex}. Check file name format"
	end

	begin
		output = File.read("result.csv")
		fixture_to_result[:output] = output
		`rm -f result.csv`
	rescue Exception=>ex
		fixture_to_result[:output] = "No result.csv file was found"
	end

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


