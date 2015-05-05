require 'builder'

dir_given = ARGV[0]
hash = Hash.new { |hash, key| hash[key] = 0 }

Dir.glob("#{dir_given}/**/*.*") do |file|
	file_content = IO.read(file)
	file = file.split('/').last
	cur_hash = Hash.new { |hash, key| hash[key] = 0 }
	file_content.each_line do |line|
		line.split(' ').each do |word|
			cur_hash[word] += 1 if word.length == 10
		end
	end
	hash[file] = cur_hash.length
end 

File.open("result.xml", "w") do |f|
	f.puts "<results>"
	hash.sort_by { |file, num_words| num_words }.each do |file, num_words|
		f.write("<#{file}>#{num_words}</#{file}>\n")
	end
	f.puts "</results>"
end