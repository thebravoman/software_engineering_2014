HM_Cheker = Hash.new
p=0
num=""
	Dir.glob("/home/moni/Documents/*.*") do |my_text_file|
		full_name = my_text_file.split('/').last.split('.').first
		name = full_name.split("_")[0]+"_"+full_name.split("_")[1]
sum=0
	Dir.glob("/home/moni/Documents/#{name}*.*") do |info|	
		num = num +" "+ info.split('_').last.split('.').first 
		p = info.split('_').last.split('.').first
		sum = sum + p.to_i		
	end
	HM_Cheker["#{name}"] = sum
	sum = 0
	end
HM_Cheker.each {|student_name,value| puts "#{student_name} #{value}" }
