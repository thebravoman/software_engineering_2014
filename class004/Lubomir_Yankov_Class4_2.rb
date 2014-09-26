hash = Hash.new
extensions = [".c", ".html", ".cc", ".cpp", ".py", ".java", ".rb"]
exercise = ["2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18"]
sum = Hash.new
i = 0
k = 0
sum[0] = 0
Dir.glob("#{ARGV[0]}/**/*.*") do |myFile|
	short_name = myFile.split('/').last
	full_name = myFile.split('/').last.split('.').first.split('_')
	name = short_name.split('.').first.split('_')
	name[0] = name[0].capitalize
	task = short_name.split('.').first.split('_').last
	student = name.collect{|x| "#{name[0]}"+" #{name[1]}"}
	student_extension = myFile.split('/').last.split('.').last
	student_name = "#{student[0]}"
	if full_name.length > 2
	if exercise.include? "#{task}"
		if extensions.include? (".#{student_extension}")
			
			if hash[student_name] != nil					
				currentUserFiles = hash[student_name]
				currentUserFiles << task.to_i
				sum[student_name]+=task.to_i
			else 
				sum[student_name] = 0
				hash[student_name] = []
				currentUserFiles = hash[student_name]
				currentUserFiles << task.to_i
				sum[student_name]+=task.to_i
				hash[student_name]=currentUserFiles
			end
		
		end
	end
	end
end
sorted_hash = hash.sort_by {|student_name, value| student_name}
#hash.sort_by {|student_name, value| student_name }

	sorted_hash.each do |student_name, value| 
		value.each do |e|
			value[k].to_i
			k+=1
		end
		value = value.sort
		puts "#{student_name},#{value.join(",")},#{sum[student_name]}"
		#i+=1
end
