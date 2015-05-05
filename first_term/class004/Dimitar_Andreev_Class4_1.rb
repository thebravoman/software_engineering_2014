d=Array.new(19,0)

Dir.glob("#{ARGV.first}/*.*") do |my_text_file|
  s = my_text_file.split(/_/)
  b= s.last.split(/\./).first.to_i
  if (2..18).include? b
		d[b] += 1
  end
end

for i in 2..18
  print "#{i}"
  if i < 18
		print ","
	end
	if i == 18
		puts
	end;
end

for i in 1..17
  print "#{d[i]}"
	if i != 17
		print ","
	end
end
