i = 0
array = Array.new

for i in 0..19
	array[i] = 0
end

Dir.glob("#{ARGV.first}/*.*") do |my_text_file|
 # puts "working on: #{my_text_file}..."
  
  s = my_text_file.split(/_/)
  s = s.last.split(/\./).first
  s = s.to_i
  if (2..18).include? s 
	  arrayCount = s - 1 
	  array[arrayCount] += 1
  end
	
end

for i in 2..18
	
	print "#{i}"
	if i < 18
		print","
	end
end

puts ""

for i in 1..17
	print "#{array[i]}"
	if i < 17
		print ","
	end
end



