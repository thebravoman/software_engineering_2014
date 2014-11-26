files = Dir.glob("#{ARGV[0]}/*/generate.rb").to_a
p files
numbers = (1..58333).to_a
numbers = numbers.shuffle
while files.size>0
	params = numbers.pop(3)
	params = params.map(&:inspect).join(' ')
	files=files.shuffle
	file = files.pop
	dir= File.dirname(file)
	file = file.split('/')[file.split('/').size-1]
	p "cd #{dir} && ruby #{file} #{params}"
	`cd #{dir} && ruby #{file} #{params}`
end
