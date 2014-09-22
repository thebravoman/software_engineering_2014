hw = Array.new(20,0)
Dir.glob("home/*.*") do |my_text_file|
	short_name = my_text_file.split('/').last
	i = split('.').first.split("_")
	hw[i] += 1
end

for i in 0..20 do
	puts "#{i}, #{hw[i]}"
end
