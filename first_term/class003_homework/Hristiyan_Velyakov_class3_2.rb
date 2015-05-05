Check = Hash.new("");
Folder = ARGV[0]
	Dir.glob("#{Folder}*/*.*")  do |names|

  short_name = names.split("/") 
 first_name = short_name.last.split("_").first	
last_name = names.split("_") 
	second_name=last_name.last.split("_").first 
num=names.split("_")	
	task=num.last.split(".").first
Check[first_name + " " + second_name] +=task + ";"
	end
Check.each do |key,value|
sum=0
value.split(",").each do |counter|
("#{sum +=counter.to_i}")
	end
puts ("#{key + " " + value + sum.to_s}")
	end
