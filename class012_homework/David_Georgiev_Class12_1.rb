require 'csv'
results = Hash.new
count =0
error = 0

Dir.glob("#{ARGV[0]}/*1.rb").each do |script_file|
file_name = script_file.split(/\//).last#.split("_Class4_1.rb").first
git_log = `git log --after="25.09.2014:11:10:00" --until=29.09.2014:20:00:00 #{script_file}`
if !git_log.empty?
results[file_name] = Hash.new
count += 1
	Dir.glob("#{ARGV[1]}/*").each do |fixture|
	fixture_name = fixture.split(/\//).last
	expected_file = fixture+"/expected_results.csv"
		if File.exists?(expected_file)
			output = `ruby #{script_file} #{fixture}`
			file_content = File.read(expected_file)
			if ((output <=> file_content) == 0)
				#p "#{file_name} = #{fixture_name}"
				results[file_name][fixture_name] = 1
			else
				results[file_name][fixture_name] = 0
			end 
		end
	end
end
end
CSV.open("results.csv","w") do |csv|
	csv << ["Name",results.first[1].keys].flatten
	results.keys.each do |key|
		csv << [key,results[key].values].flatten	
	end
end
