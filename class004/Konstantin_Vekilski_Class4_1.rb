hw = Array.new(20,0)
Dir.glob("#{ARGV.first}/**/*.*") do|a|
	s = a.split(/_/)
	i = s.last.split(/\./).first.to_i
	hw[i] += 1
end 

for i in 2..20-3 do
	print "#{i},"
end
puts "#{i+1}"

for i in 2..20-3 do
	print "#{hw[i]},"
end
puts "#{hw[i+1]}"
