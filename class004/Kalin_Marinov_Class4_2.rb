person = Hash.new

def check_if_valid_name(name)
	return false if name.split('.').length != 2 || (name.split('.').last =~ /[^a-z ^A-Z]/)
	temp_name = name.split('.').first.split('_')	
	return false if temp_name[0] == "" || temp_name[1] == ""
	if temp_name.length != 3 || temp_name[2]=~ /\D/ || temp_name[0]+temp_name[1] =~ /[^a-z ^A-Z ^_ ^\d]/ || !((2..18) === temp_name[2].to_i)
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

	next if person[short_name].include?(","+task)

	person[short_name] += ",#{ task.to_i }"

end

person.sort.each do |name, info|
	sum = 0
	print name
	numbers = Array.new
	person[name].split(',', 2).last.split(',').each { |num| numbers << num.to_i }
	numbers.sort.each do |number|
		print(",#{ number.to_i }")
		sum += number.to_i
	end
	puts ",#{ sum }"
end
