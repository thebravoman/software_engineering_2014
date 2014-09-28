arr=Array.new(100,0)
Dir.glob("*_*") do |my_text_file|
	s = my_text_file.split(/_/)
	i= s.last.split(/\./).first.to_i
	arr[i]+=1
end
for i in 2..18
	print "#{i}"
	if i != 18
		print ","
	end
end
i=0
print ("\n")
while i < 19
	print "#{arr[i+2]}"
	i += 1
	print "," if i != 19
end
