store = Hash.new{|hash, key| hash[key] = []};

Dir.glob("#{ARGV[0]}/**/*.*") do |homeworks|

	name = homeworks.split("/").last
	name = name.split(".").first.split("_")
	firstname = name[0]
	lastname = name[1]
	exercise = name[2]

	if firstname == '' || lastname == '' || exercise == ''
	elsif name.length == 3	
		if exercise.to_i > 1 && exercise.to_i < 19
	
			store["#{firstname.capitalize} #{lastname.capitalize}"] << exercise.to_i
	
		end
	end
	
end
store.sort.each do  |key, value|
	sum = 0
	value = value.sort.uniq
	value.each do |x|
	sum += x.to_i
	end
	puts "#{key},#{value.join(",")},#{sum.to_s}"
end 