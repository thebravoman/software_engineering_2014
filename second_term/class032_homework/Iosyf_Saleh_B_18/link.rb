def make_link(word)
	puts "\n\n.#{word}.\n\n"
	return "<a href=" + word + ".html>" + word + "</a>"	
end

all_files = Dir.entries(ARGV[0])

i=0

puts "i - filename - allfiles\n"
Dir.glob(ARGV[0] + '/*.html') do |word_to_link|
	if (all_files[i] == ".") || (all_files[i] == "..")
		i+=1
	end
	puts "#{i} - #{word_to_link} - #{all_files[i]}\n"
	filename = File.basename(all_files[i], '.html')
	text = File.read(word_to_link)
	puts text
	all_files.each do |word|
		word = File.basename(word, '.html')
		if ((word == ".") || (word == ".."))
			next
		else
			puts "..#{make_link(word)}..#{word}.."
			text = text.gsub(word, make_link(word))
		end
	end
	File.write(word_to_link, text)
	i += 1
	#puts "#{i} - #{filename} - #{all_files[i]}\n\n"
end
