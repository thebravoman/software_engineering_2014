require 'csv'
results = Hash.new

Dir.glob(ARGV[0]+"*2.rb").each do |script_file|
	commit = `git log #{script_file}`
	if (commit==(`git log --until=Sep--29--2014--20:00:00 #{script_file}`))
		file_name = script_file.split('/').last.split('.').first
		results[file_name] = Hash.new
	Dir.glob(ARGV[1]+"*").each do |fixture|
		fixture_file_value = fixture.split('/').last.split('.').first
		expected_file = fixture+"/expected_results2.csv"
		if File.exists?(expected_file)
		output = `ruby #{script_file} #{fixture}`
		file_content = File.read(expected_file)
		if (output <=> file_content) == 0
		results[file_name][fixture_file_value] = 1
	else
		results[file_name][fixture_file_value] = 0
end
end
end
end
end	
CSV.open("results.csv","w") do |csv|
	csv << ["Name", results.first.last.keys].flatten
	results.keys.each do |key|
	csv << [key,results[key].values].flatten
end
end
