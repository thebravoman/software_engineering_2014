i = 0
a = Array.new

Dir.glob("/path/software_engineering_2014/vhodno_nivo/**/*.*") do |my_text_file|
  
  
	s = my_text_file.split(/_/)
	d = s.last.split(/\./).first
	f = d.first.split(/([a-zA-z]+)/).last
	f.to_i
	a[i] = f
	i = i + 1
end

for i in 1..19
	puts "#{i}, #{a.count("#{i}")}"
end
