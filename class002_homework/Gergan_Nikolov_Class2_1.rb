#Variables
i = 1; #Counter for documents
documents = Array.new(19)
count = Array.new(19)

while i <= 19 do
	documents[i] = i
	i = i + 1
end #Add all elements names.

i = 1

while i <= 19 do
	count[i] = 0
	i = i + 1
end 

puts "Insert path :"
path = gets.chomp

Dir.glob(path) do |my_text_file|
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

i = 1

while i <= 19 do
	puts "#{i}, #{count[i]}"
	i = i + 1
end
