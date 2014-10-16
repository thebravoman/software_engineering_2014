# ruby run_scripts_agains_fixtures.rb "folder with results" "folder with expects" "folder with fixtures" "folder with tasks"
require 'csv'

results = Hash.new
count =0
Dir.glob(ARGV[0]+"*.rb").each do |script_file|
	p "++++++++++++++++++++++++++++++++++++++++++++++++++="
	results[script_file] = Hash.new
	args = [ARGV[2]+"fixture1",ARGV[2]+"fixture2",4]
	
	`ruby #{script_file} #{args[0]} #{args[1]} #{args[2]}`
	fixture_to_result = results[script_file]

	begin
		hex = script_file.split("/").last.split('_')[3].split('.')[0]
		number = script_file.split("/").last.split('_')[2]
		p "Script file is"
		p script_file
		p "Hex is"
		p hex
		if hex != nil
			fixture_to_result[:expected] = File.read(ARGV[1]+hex+".csv")
			fixture_to_result[:task] = File.read(ARGV[3]+number+"_"+hex+".txt")
		end	
	rescue Exception=>ex
		fixture_to_result[:expected] = "Can not be determined since the hex is #{hex}. Check file name format"
		fixture_to_result[:task] = "Can not be determined because of hex #{hex} and number #{number}"
	end
	p "Expected content is"
	p fixture_to_result[:expected]	
	begin 
		fixture_to_result[:output] = File.read("result.csv")
		`rm -f result.csv`
	rescue Exception=>ex
		fixture_to_result[:output] = "No result.csv file was found"
	end 
	p "output is"
	p fixture_to_result[:output]

	if (fixture_to_result[:output] <=> fixture_to_result[:expected]) == 0
		fixture_to_result[:result] = 1
	else
		fixture_to_result[:result] = 0
	end
	p "---------------------------------------------------"
end

CSV.open("official_results.csv", "w") do |csv|
	csv << ["Name","Result","Task","Expected","Output"]
	results.each_key do |key|
		ftr = results[key]
		csv << [key,ftr[:result],ftr[:task],ftr[:expected],ftr[:output]]
	end
end
