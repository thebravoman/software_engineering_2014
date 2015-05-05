ary = Array.new(19, 0)
directory = ARGV.first

if directory[-1] == '/' then
	directory = directory.chop
end

Dir.glob("#{directory}/**/*.*") do |string|
	task = string.scan(/\d+\./).last.to_i
	if (2..18).include?(task)
		ary[task] += 1
	end
end

for i in 2..17
	print "#{i},"
end

puts 18

for i in 2..17
	print "#{ary[i]},"
end

print ary[18]