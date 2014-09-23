hash = Hash.new("");
dir = ARGV[0]

Dir.glob("#{dir}*/*") do |my_text_file| 

first_name = my_text_file.split(/\//).last.split(/_/).first	
last_name = my_text_file.split(/\//).last.split(/_/, 2).last.split("_").first
number = my_text_file.split(/\//).last.split("_").last.split(".").first

hash[first_name + " " + last_name] += number + ","


end

hash.each do |key, value|
	sum = 0
	value.split(",").each do |x|
	sum += x.to_i
end
	puts key + "," + value + sum.to_s
end

