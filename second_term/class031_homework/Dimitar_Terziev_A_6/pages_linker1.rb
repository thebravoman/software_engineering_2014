qrequire 'treat'
include Treat::Core::DSL

prse = ""

Dir.glob("#{ARGV[0]}/*").each do |file| 
	prse << file.split('/').last.split('.').first << " "
end

puts prse

Dir.glob("#{ARGV[0]}/*").each do |file| 
	str = File.read(file)
	curr_name = file.split('/').last.split('.').first
	d = section str
	d.apply(:chunk, :segment, :tokenize)

	phra = phrase prse
	phra.apply :tokenize

	changes = Hash.new
	d.words.each do |word|
		phra.words.each do |link|
			if link.stem.casecmp(word.stem)==0 && (link.to_s!=word.to_s || curr_name!=link.to_s)
				changes[word.to_s] = link.to_s
				break
			end
		end
	end

	str = d.to_s
	str.gsub!(/[^a-zA-Z]#{curr_name}[^a-zA-Z]/, "<a href = \"#{curr_name}.html\"> #{curr_name} </a>")

	changes.each_key do |key|
		str.gsub!(key, "<a href = \"#{changes[key]}.html\"> #{key} </a>")
	end

	open("#{file.split('/').last.split('.').first}.html", 'w') do |f|
		f.puts str
	end
end
