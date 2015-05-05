i = 0
array = Array.new

Dir.glob("#{ARGV.first}/vhodno_nivo/**/*.*") do |my_text_file|
  
	split_first = my_text_file.split(/_/)
	split_second = split_first.last.split(/\./).first
	split_final = split_second.first.split(/([a-zA-z]+)/).last
	split_final.to_i
	array[i] = split_final
	i = i + 1
end

for i in 1..19
	puts "#{i},#{array.count("#{i}")}"
end
