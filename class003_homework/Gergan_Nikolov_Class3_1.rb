#Variables
i = 2; #Counter for documents
documents = Array.new(18)
count = Array.new(18)

while i <= 18 do
	documents[i] = i
	i = i + 1
end #Add all elements names.

i = 2

while i <= 18 do
	count[i] = 0
	i = i + 1
end 

Dir.glob("#{ARGV.first}/**/*.*") do |my_text_file|
	#puts "Working on: #{my_text_file}..."

	first_pick = my_text_file.split(/_/)
	#puts s.last

	second_pick = first_pick.last.split(/\./)
	#puts second_pick.first

	if documents.include?(second_pick.first.to_i) == true
		#puts "#{second_pick.first}"		
		val = count[second_pick.first.to_i]
		val = val + 1
		count[second_pick.first.to_i] = val
	end

end

i = 2

while i <= 18 do
	print "#{i}"

	if i < 18 
		print ", "
	end

	i = i + 1
end

puts ""
i = 2

while i <= 18 do
	print "#{count[i]}"
	
	if i < 18 
		print ", "
	end

	i = i + 1
end

puts ""
