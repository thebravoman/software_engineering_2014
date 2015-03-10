require 'treat'
include Treat::Core::DSL

prse = ""

Dir.glob("#{ARGV[0]}/*").each do |file| 
	prse << file.split('/').last.split('.').first << " "
end

puts prse

Dir.glob("#{ARGV[0]}/*").each do |file| 
	str = File.read(file).split('<body>').last.split('</body>').first
	d = section str
	d.apply(:chunk, :segment, :tokenize)

	phra = phrase prse
	phra.apply :tokenize

	changes = Hash.new
	d.words.each do |word|
		phra.words.each do |link|
			if link.stem.casecmp(word.stem)==0
				changes[word.to_s] = link.to_s
				break
			end
		end
	end

	str = str.split(' ').map do |word|
		actual_word = word.scan(/\w+/).first
		punctuation = word.split(actual_word).last
		changes[actual_word] ? "<a href = \"#{changes[actual_word]}.html\"> #{actual_word} </a>#{punctuation}" : "#{word}"
	end.join(' ')

	File.open("#{file.split('/').last.split('.').first}.html", 'w') do |f|
		f.puts <<-HTML
<html>
<head><meta charset="UTF8"></head>
<body>
HTML
		f.puts str
		f.puts <<-HTML
</body>
</html>
HTML
	end
end
