hash = Hash.new("")
Dir.glob("/home/rkostadinov/Desktop/software_engineering_2014/vhodno_nivo/*/*") do |my_text_file| 
	s = my_text_file.split(/\//)
	first_name = s.last.split("_").first
	last_name1  = s.last.split("_",2)
	last_name2  = last_name1.last.split("_").first
	number = s.last.split("_").last.split(".").first

	hash["#{first_name} #{last_name2}"] += number + ","
	end
	
	hash.each do |name, task|
		sum = 0
		task.split(",").each do |j|
			sum += j.to_i	
			end
		puts "#{name}" + "," + task + sum.to_s
		end
