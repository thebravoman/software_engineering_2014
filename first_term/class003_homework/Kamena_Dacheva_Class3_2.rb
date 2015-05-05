student = Hash.new("")
sum_pr = 0
directory = ARGV[0]

Dir.glob("#{directory}*/*") do |my_repository|
        name_dir = my_repository.split("/")
        name = name_dir.last.split("_").first
        sir_name_dir = name_dir.last.split("_", 2)
        sir_name = sir_name_dir.last.split("_").first
        program_dir = my_repository.split("_")
        program = program_dir.last.split(".").first

        student[name + " " + sir_name] += program + ","	
end

student.each do |name, programs|
        print "#{name}" + ","
        programs.split(",").each { |pr| sum_pr += pr.to_i }	
        puts programs + sum_pr.to_s
        sum_pr = 0
end
