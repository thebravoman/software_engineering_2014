allowed_extensions=["c" , "cpp" , "cc" , "java" , "rb" , "py" , "html" , "pas" , "php" , "js" , "cs"]
data = Hash.new{|name, tasks| name[tasks] = Array.new}
array=Array.new

Directory = ARGV[0]
Dir.glob("#{Directory}/**/*") do |file_name|

	user_data = file_name.split("/").last.split('.').first.split('_')
	user_extension=file_name.split(".").last	
	user_name = "#{user_data[0].capitalize} #{user_data[1]}"
	task = user_data[2]
	
	if user_data.length == 3 and allowed_extensions.include?(user_extension)
 if !((user_data[0] == "" || user_data[0] == " ") || (user_data[1] == "" || user_data[1] == " ")) 
	
		if (task.to_i >1) && (task.to_i < 19)
		data["#{user_name}"] << task.to_i
		
	        end
		end
	
	end
end
	data.sort.each do |name,tasks|
	print "#{name}"
	total=0
	tasks.sort!.uniq.each do |i|
	print ",#{i}"
	total +=i
end
puts ",#{total}"
end

	




