storage_array = Array.new(19) {|i| i = 0}
directory = ARGV.first	#taking directory directory
directory = directory.chop if directory[-1,1] == "/"	#check for /
Dir.glob(
"#{directory}/**/*.*") do |my_text_file|	#checking homeworks
s = my_text_file.split(/_/)
work_num = s.last.split(/\./).first
m = work_num.to_i
storage_array[m] += 1 if m != nil and m <19
end
i = 2	#printing results
while i < 19
print "#{i}," if i <= 17
print "#{i}" if i == 18
i += 1
end
i = 2
puts "\n"
while i < 19
print "#{storage_array[i]}," if i <= 17
print "#{storage_array[i]}" if i == 18
i += 1
end
