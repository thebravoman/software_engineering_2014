hash = Hash.new
sum = []
i = 0
sum[i] = 0
Dir.glob("#{ARGV[0]}/**/*.*") do |myFile|
	short_name = myFile.split('/').last
	name = short_name.split('.').first.split('_')
	task = short_name.split('.').first.split('_').last
	student = name.collect{|x| "#{name[0]}"+" #{name[1]}"}
	student_name = "#{student[0]}"
	taskint = task.to_i
	if hash[student_name] != nil					
		currentUserFiles = hash[student_name]
		currentUserFiles << taskint
		sum[i]+=taskint
	else 
		i+=1
		sum[i] = 0
		hash[student_name] = []
		currentUserFiles = hash[student_name]
		currentUserFiles << taskint
		sum[i]+=taskint
		hash[student_name]=currentUserFiles
	end

end

i = 1
hash.each do |student_name, value| 
			puts "#{student_name},#{value.join(",")},#{sum[i]}"
			i+=1
end