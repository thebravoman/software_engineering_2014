hash = Hash.new("")
Folder = ARGV[0]

Dir.glob("#{Folder}*.*") do |my_text_file|
  
  Name = my_text_file.split("\").last.split("_").first
  Last_Name = my_text_file.split("_",2).last.split("_").first
  Task_Number = my_text_file.last.split("_").last.split(".").first
  
  hash[Name + " " +Last_Name] +=Task_Number + ","
  
end

hash.each do |name, tasks|
	sum = 0
	tasks.split(",").each do |x|
	sum += x.to_i
	
	end
puts name + "," + tasks + sum.to_s

end	