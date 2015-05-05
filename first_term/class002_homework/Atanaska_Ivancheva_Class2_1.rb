array=Array.new(19,0)  

Dir.glob("/home/hriso/Desktop/hris/*.*") do |my_text_file|
	#puts "Working on: #{my_text_file}..."
	
	s=my_text_file.split(/_/) 
	num=s.last.split(/\./).first
	num=num.to_i
	
		if num>=1 && num<=19
		array[num-1] += 1
		end
end
	
counter=0
while counter < array.length 
	puts "#{counter+1},#{array[counter]}"
	counter += 1
end
