hash = Hash.new
exercise = ["2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18"]
i = 0
k = 0
sum = 0
Dir.glob("#{ARGV[0]}/**/*.*") do |myFile|
	short_name = myFile.split('/').last
	full_name = myFile.split('/').last.split('.').first.split('_')
	name = short_name.split('.').first.split('_')
	task = short_name.split('.').first.split('_').last
	student = name.collect{|x| "#{name[0].capitalize}"+" #{name[1]}"}
	student_extension = myFile.split('/').last.split('.').last
	student_name = "#{student[0]}"
	if name[0] == '' || name[1] == '' || name[2] == '' 
	elsif full_name.length == 3
			if exercise.include? "#{task}"	
				if hash[student_name] != nil					
					currentUserFiles = hash[student_name]
					currentUserFiles << task.to_i
				else 
					hash[student_name] = []
					currentUserFiles = hash[student_name]
					currentUserFiles << task.to_i
					hash[student_name]=currentUserFiles
				end
			end
		end
	end
sorted_hash = hash.sort_by {|student_name, value| student_name}
	sorted_hash.each do |student_name, value| 
		value = value.sort.uniq
		value.each do |e|
		sum += e.to_i
		end
		puts "#{student_name},#{value.join(",")},#{sum}"
		sum = 0
	end
