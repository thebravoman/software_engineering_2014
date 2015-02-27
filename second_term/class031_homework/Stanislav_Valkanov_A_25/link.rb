puts "Enter path to html files"
path = gets.chomp
names = Hash.new

Dir.glob("#{path}/**.html") do |path|
	split_name = path.split("/").last
	names["#{split_name}"] = nil
end

Dir.chdir("#{path}")
names.each{ |key, value|
		text = File.read("#{path}/#{key}")
		test_key = key
		names.each{|key, value|
				if (key != test_key)
					key1 = key.split(".").first
					key2 = key1.capitalize
					key3 = key1+"s"
					key4 = key2+"s"
					text.gsub! /#{key1}/, "<a href=\"#{key}\">#{key1}</a>"
					text.gsub! /#{key2}/, "<a href=\"#{key}\">#{key2}</a>"
					text.gsub! /#{key3}/, "<a href=\"#{key}\">#{key3}</a>"
					text.gsub! /#{key4}/, "<a href=\"#{key}\">#{key4}</a>"
				end
		}
		File.open("#{path}/#{key}", 'w') do |file|
			file.write "#{text}"
		end
	}