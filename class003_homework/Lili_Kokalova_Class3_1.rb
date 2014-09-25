arr = Array.new
i=0
Dir.glob("#{ARGV.first}/**/*.*") do |my_text_file|
	s = my_text_file.split(/_/)
	s = s.last.split(/\./).first.to_i
	arr[i] = s
	i += 1
end

arr.uniq.each do |num|
	print "#{num},"
end

puts

arr.uniq.each do |elem|
  print "#{arr.count(elem)},"
end
