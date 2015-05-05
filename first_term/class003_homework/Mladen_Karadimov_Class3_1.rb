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
	arrayCount = s - 1 

  array[arrayCount] += 1
	
end

for i in 2..18
	print "#{i},"
end
puts ""
for i in 2..18
	print "#{array[i]},"
end



