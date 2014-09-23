Hash = Hash.new("");
Directory = ARGV[0]
Dir.glob("#{Directory}*/*.*") do |file_name|
 
	short_name = file_name.split("/")
	first = short_name.last.split("_").first

	last_name = file_name.split("_", 5)	
	second=last_name.last.split("_").first

	number=file_name.split("_")	
	task=number.last.split(".").first

	Hash[first + " " +second] +=task + ","

end
 	
Hash.each do |names,tasks|
	total=0
	tasks.split(",").each do |i|
	total +=i.to_i
end
puts names + " ," + tasks + total.to_s
end
	





