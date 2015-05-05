tasks = Array.new(20, 0)

Dir.glob("*.*") do |f|

	tn = f.split(/_/).last.split(/\./).first.to_i

	if File.extname(f) != ".class" && !f.include?("~") then
		tasks[tn] += 1
	end

end

for i in 1..19 do
	puts "#{i},#{tasks[i]}"
end
