d=Array.new(21,0)
Dir.glob("*_*") do |my_text_file|
	s = my_text_file.split(/_/)
	d[i]= s.last.split(/\./).first.to_i
	i+=1
end

for i in 0..20 do
	puts "#{i},#{d[i]}"
end
