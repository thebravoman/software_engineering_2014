hash = Hash.new
sum = []
i = 0
sum[i] = 0
Dir.glob("C:/Users/Lubomir/Documents/GitHub/software_engineering_2014/vhodno_nivo/**/*.*") do |myFile|
	short_name = myFile.split('/').last
	name = short_name.split('.').first.split('_')
	task = short_name.split('.').first.split('_').last
	student = name.collect{|x| "#{name[0]}"+" #{name[1]}"}
	student_name = "#{student[0]}"
	taskint = task.to_i
	if hash[student_name] != nil					#Ako sushtestvuva v hasha go updatevame ako ne create i update i taka za vseki fail
		currentUserFiles = hash[student_name]
		currentUserFiles << task
		sum[i]+=taskint
	else 
		i+=1
		sum[i] = 0
		hash[student_name] = []
		currentUserFiles = hash[student_name]
		currentUserFiles << task
		sum[i]+=taskint
		hash[student_name]=currentUserFiles
	end

end

i = 0

hash.each do |student_name, value| 
			puts "#{student_name} #{value} #{sum[i+1]}"
			i+=1
			end