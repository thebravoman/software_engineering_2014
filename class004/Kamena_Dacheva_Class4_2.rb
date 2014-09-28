student = Hash.new{ |name, programs| name[programs] = []}
sum_pr = 0
directory = ARGV[0]

Dir.glob("#{directory}/**/*") do |my_repository|

        name_dir = my_repository.split("/")
        name = name_dir.last.split("_").first
        sir_name_dir = name_dir.last.split("_", 2)
        sir_name = sir_name_dir.last.split("_").first
        program_dir = my_repository.split("_")
        program = program_dir.last.split(".").first

	word_list = name_dir.last
	counter = 0
	if word_list.include? "_"
		counter = word_list.count "\\_"
	end
	
	i = 2
	boolean = 0
	while (i <= 18) do
		if program.to_i == i
			boolean = 1
		end	
		i += 1
	end

	if ((name == "" || name == " ") || (sir_name == "" || sir_name == " ")) 
	else
		if (boolean == 1) && (counter == 2)
			student["#{name} #{sir_name}"] << program.to_i
		end
	end
end

student.sort.each do |name, programs|

       	print "#{name},"
	programs.uniq.sort.each do |pr| 
		print pr
		print ","
		sum_pr += pr
	end

        print sum_pr
	puts
        sum_pr = 0
end
