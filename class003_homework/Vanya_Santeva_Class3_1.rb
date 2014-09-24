all_files = Dir.glob("#{ARGV.first}**/*.*")

ary = Array.new(20, 0)

all_files.each do |string|
	task = string.scan(/\d+\./).last.to_i
	ary[task] += 1
end

for i in 1..19
	puts "#{i},#{ary[i]}"
end
