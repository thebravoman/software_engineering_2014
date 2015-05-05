require 'csv'
result = Hash.new
Dir.glob(ARGV[0] + "*.rb").each do |first|
	name1 = first.split("/").last.capitalize
	first_name = name1.split("_").first.capitalize
	last_name = name1.split("_",2).last.split('_').first.capitalize
	Dir.glob(ARGV[1]+"*.rb").each do |second|
		name2 = second.split("/").last.capitalize
		if (name1 == name2)
			puts name1
			puts name2
			result.compare_by_identity
			result[first_name] = last_name
		end
end
end
CSV.open("result.csv", "w") do |csv|
	result.sort_by{|k, v| k}.each do |element|
		csv << element
		end
	end

