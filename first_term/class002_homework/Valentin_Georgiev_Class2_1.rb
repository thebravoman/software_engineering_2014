ary = Array.new(20, 0)

Dir.glob("/home/valio/Documents/tp/vhodno_nivo/*.*") do |my_text_file|

	s = my_text_file.split(/_/)
	s = s.last.split(/\./).first
	s = s.to_i

	begin
 		ary[s] +=1
	end while s < 0 && s > 20

end

for i in 1..19 do
	puts "#{i},#{ary[i]}"
end
