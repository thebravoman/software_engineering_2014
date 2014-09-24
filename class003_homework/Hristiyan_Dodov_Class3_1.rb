path = ARGV[0]
taskStart = ARGV[1].to_i
taskEnd = ARGV[2].to_i
tasks = Array.new

#if no values are given, set default ones
if path == nil; path = '*';			puts "Path not specified."; end
if taskStart == 0; taskStart = 2;	puts "Start task number not specified."; end
if taskEnd == 0; taskEnd = 18;		puts "End task number not specified."; end

#nullify to prevent errors
for i in taskStart..taskEnd do tasks[i] = 0; end

Dir.glob(path + "/**/*\.*") do |fn|
	str = fn[/[A-Z][A-Z a-z _]*\d+\..*/]
	#matches paths beginning with A-Z followed by A-Z/a-z/_
	#and ending with 0-9.anything -> Name_Surname_X.foo is matched
	
	next if str == nil		#skip iteration if regex returns nil
	str = str[/\d+\./]		#gets only the last number (for cases like Foo_Bar_11_1.foo)
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
