ary = Array.new(20, 0)

Dir.glob("#{ARGV.first}**/*.*") do |string|
	task = string.scan(/\d+\./).last.to_i
	ary[task] += 1
end

for i in 2..17
	print "#{i},"
end

puts 18

for i in 2..17
	print "#{ary[i]},"
end

puts ary[18]