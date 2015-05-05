student = Hash.new{ |name, programs| name[programs] = []}
directory = ARGV[0]

Dir.glob("#{directory}/**/*") do |my_repository|
        name_dir = my_repository.split("/").last
        name = name_dir.split("_").first.capitalize
        sir_name_dir = name_dir.split("_", 2).last
        sir_name = sir_name_dir.split("_").first.capitalize
        program_dir = my_repository.split("_").last
        program = program_dir.split(".").first

	if name_dir.include? "_" then counter = name_dir.count "_" end
	i = 2
	bool = false
	2.upto(18) {  
		if program.to_i == i then bool = true end 
		i += 1
	}
	student["#{name} #{sir_name}"] << program.to_i if ((bool == true) && (counter == 2) && (name != "") && (name != " ") && (sir_name != "") && (sir_name != " "))
end

student.sort.each do |name, programs|
	sum_pr = 0
       	print "#{name},"
	programs.uniq.sort.each do |pr| 
		print "#{pr},"
		sum_pr += pr
	end
        puts sum_pr
end
