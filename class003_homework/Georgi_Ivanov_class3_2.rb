store = Hash.new("");
Dir.glob("#{ARGV[0]}/*/*") do |homeworks|
	name = homeworks.split(/\//)
	firstname = name.last.split(/_/).first
	family_name = homeworks.split(/_/, 5)
	lastname=family_name.last.split(/_/).first
	programs = homeworks.split(/_/)
	exercise = programs.last.split(/\./).first

	store[firstname + " " + lastname] += exercise + ","
end

store.each do  |key, value|
	sum = 0
	value.split(",").each do |x|
	sum += x.to_i
	end
	puts key + "," + value + sum.to_s
end 
