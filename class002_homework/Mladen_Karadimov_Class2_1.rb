i = 0
array = Array.new

for i in 0..19
	array[i] = 0
end

Dir.glob("/home/mladen/Desktop/software_engineering_2014/vhodno_nivo/*.*") do |my_text_file|
 # puts "working on: #{my_text_file}..."
  
  s = my_text_file.split(/_/)
  s = s.last.split(/\./).first
  s = s.to_i
	arrayCount = s - 1 

  array[arrayCount] += 1
	
end

for i in 1..19
	puts "#{i} , #{array[i]}"
end
