require 'active_support/inflector'

path = ARGV[0]
allWords = Hash.new

def find_words path
	i = 0
	words = Array.new
	Dir.glob("#{path}*.html") do |file|
		words[i] = file.split('/').last.split('.html').first
		i+=1
	end
	words
end

def prepear array
	plurals = Hash.new
	array.each do |word|
		words = Array.new
		words[0] = word
		words[1] = word.pluralize
		words[2] = word.capitalize
		words[3] = words[1].capitalize
		words[4] = word.upcase
		words[5] = words[1].upcase
		plurals[word] = words
	end
	plurals
end

allWords = prepear(find_words path)
content = String.new()
Dir.glob("#{path}*.html") do |file|
	content = File.read("#{file}")
	allWords.each {|key, value|
		value.each do |word|
			content.sub! " #{word} ", (" <a href=\"#{key}.html\">#{word}</a> ")
		end
	}
	File.write("#{file}", content)
end