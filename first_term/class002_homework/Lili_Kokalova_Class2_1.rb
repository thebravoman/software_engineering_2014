arr = Array.new
i=0

Dir.glob("*.*") do |my_text_file|
	s = my_text_file.split(/_/)
	s = s.last.split(/\./).first.to_i
	arr[i] = s
	i += 1
end

arr.uniq.each do |elem|
  puts "#{elem},#{arr.count(elem)}"
end
