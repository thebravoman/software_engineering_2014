homeworks = Array.new(17,0)

directory = ARGV[0]
if ARGV[0].split(//).last(1).to_s == "/"
	directory += "**/*.*"
else
	directory += "/**/*.*"
end


Dir.glob(directory) do |my_text_file|

	s = my_text_file.split(/_/)
	number = s.last.split(/\./).first


	if number.to_i >= 2 and number.to_i <= 18
		homeworks[number.to_i - 2] += 1				
	end
	

end

puts "2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18"
print "#{homeworks[0]}"

for i in 1..16
	print ",#{homeworks[i]}"
end
