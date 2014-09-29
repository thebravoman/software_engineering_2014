tasks = Array.new(20, 0)

Dir.glob("#{ARGV[0]}/**/*.*") do |f|

	tn = f.split(/_/).last.split(/\./).first.to_i

	if File.extname(f) != ".class" && !f.include?("~") then
		tasks[tn] += 1
	end

end

for i in 2..18 do
	if i == 18 then
		print "#{i}"
		puts""
	else	
		print "#{i},"
	end
end

for i in 2..18 do
	if i == 18 then
		print "#{tasks[i]}"
		puts ""
	else	
		print "#{tasks[i]},"
	end
end
