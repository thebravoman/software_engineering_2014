require 'csv'

names = Hash.new

Dir.glob(ARGV[0] + "/*2.rb") do |program_name|
	short_name = program_name.split('/').last.split("_").first(2).join(" ")
	names[short_name] = Hash.new
	uploaded_on_time = `git log --format=%at #{ program_name }` < "1412020800" ? true : false 
	Dir.glob(ARGV[1] + "/*/") do |fixture_name|
		next unless File.exist?(fixture_name + "expected_results2.csv")
		output = `ruby #{ program_name } #{ fixture_name }`
		expected_output = File.read(fixture_name + "expected_results2.csv")
		if uploaded_on_time && expected_output == output
			names[short_name]["#{ fixture_name.split('/').last.gsub('_', ' ') }"] = 1
		else
			names[short_name]["#{ fixture_name.split('/').last.gsub('_', ' ') }"] = 0
		end		
	end
end

CSV.open("temp.csv", "w") do |csv|
	csv << [" "] + names.first.last.keys
	names.sort_by{ |key, value| key }.each do |key, value| 	
		csv << [key] + value.values
	end
end

#false if uploaded after Mon, 29 Sep 2014 20:00:00
#./class004/ ./class004_homework/
