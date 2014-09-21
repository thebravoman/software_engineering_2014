path = '*'
taskStart = 1
taskEnd = 19

tasks = Array.new

#nullify to prevent errors
for i in taskStart..taskEnd do
	tasks[i] = 0
end

Dir.glob(path + "/**/*\.*") do |fn|
	str = fn[/[A-Z][A-Z a-z _]*\d+\..*/]
	#matches paths beginning with A-Z followed by A-Z/a-z/_
	#and ending with 0-9.anything -> Name_Surname_X.foo is matched
	
	next if str == nil		#skip iteration if regex returns nil
	str = str[/\d+/]		#gets only the number matched
	str = str.to_i			#converts the number to integer
	next if str < taskStart or str > taskEnd	#skip iteration if file name is wrong
	
	tasks[str] = tasks[str] + 1
end

for i in taskStart..taskEnd do
	puts "#{i},#{tasks[i]}"
end

$end
