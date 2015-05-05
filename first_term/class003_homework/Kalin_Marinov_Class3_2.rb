person = Hash.new

def check_if_valid_name(name)
	return false if name.split('.').length != 2 || (name.split('.').last =~ /[^a-z ^A-Z]/)
	temp_name = name.split('.').first.split('_')	
	if temp_name.length != 3 || temp_name[2]=~ /\D/ || temp_name[0]+temp_name[1] =~ /[^a-z ^A-Z ^_]/
		return false
	end

	return true

end

Dir.glob(ARGV[0] + "/**/*") do |name|
	name = name.split('/').last

	next if !check_if_valid_name(name)
	
	short_name = name.split('_').first + " " + name.split('_')[1]
	task = name.split('_').last.split('.').first
	if person[short_name] == nil
		person[short_name] = ""
	end

	person[short_name] += ",#{ task }"

end

person.each do |name, info|
	sum = 0
	print name, info
	(0..person[name].split(',').length).each do |i|
		sum += person[name].split(',')[i].to_i
	end
	puts ",#{ sum }"

end
