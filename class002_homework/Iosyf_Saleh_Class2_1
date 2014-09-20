arr=Array.new(100,0)
Dir.glob("*_*") do |my_text_file|
	s = my_text_file.split(/_/)
	i= s.last.split(/\./).first.to_i
	arr[i]+=1
end

for i in 0..20 do
	puts "#{i},#{arr[i]}"
end
