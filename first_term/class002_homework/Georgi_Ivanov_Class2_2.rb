Hash = Hash.new("")

Dir.glob("C:/Users/Georgi Ivanov/Desktop/software_engineering_2014-master/vhodno_nivo/**/*.*") do |domashni|
	fileonly = domashni.split("/").last
	name = fileonly.split(".").first.split("_")
	exercise = name[2]
		
	puts "#{name[0]} #{name[1]} #{name[2]} "
	
end

gets
