grades = Hash.new {|name, index|}
Dir.glob("/home/user/Desktop/software_engineering_2014-master/vhodno_nivo/*/*.*") do |file|
	
	name = file.split("/").last.split(".").first.split("_")
	grades["#{name[0]} #{name[1]}"] = name[2]

end

grades.each do |name, value| 
	puts "#{name} : #{value},"

end
