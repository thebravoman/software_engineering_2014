path = ARGV[0]
taskStart = ARGV[1].to_i
taskEnd = ARGV[2].to_i
tasks = Array.new

#if no values are given, set default ones
if path == nil; path = '*'; end
if taskStart == 0; taskStart = 2; end
if taskEnd == 0; taskEnd = 18; end

#nullify to prevent errors
for i in taskStart..taskEnd do tasks[i] = 0; end

Dir.glob(path + "/**/*\.*") do |fn|
	str = fn[/[A-Z a-z]+_[A-Z a-z]+_\d+\.[^~]+$/]
	#matches multipleLetters_multipleLetters_number.extension(~ excluded)
	
	next if str == nil		#skip iteration if regex returns nil
	str = str[/\d+\./]		#gets only the number
	str = str.to_i			#converts the number to integer
	next if str < taskStart or str > taskEnd	#skip iteration if file name is wrong
	
	tasks[str] = tasks[str] + 1
end

for i in taskStart..taskEnd do
	if i == taskStart; print "#{i}"; else print ",#{i}"; end
end
puts

for i in taskStart..taskEnd do
	if i == taskStart; print "#{tasks[i]}"; else print ",#{tasks[i]}"; end
end
puts

$end
