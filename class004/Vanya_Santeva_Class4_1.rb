ary = Array.new(20, 0)
directory = ARGV.first

if directory[-1] == '/' then
	directory = directory.chop
end

Dir.glob("#{directory}/**/*.*") do |string|
	task = string.scan(/\d+\./).last.to_i
	ary[task] += 1
end

for i in 2..17
	print "#{i},"
end

puts 18

for i in 2..18
	print "#{ary[i]},"
end