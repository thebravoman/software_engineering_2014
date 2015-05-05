require 'csv'
require 'xml_writer'
entry_point = Dir.getwd
names_to_result =  Hash.new([0,0,0,0,0,0])
names_to_team = Hash.new

=begin
VH 
002 = 22.09.2014:20:00:00
003 = 24.09.2014:20:00:00
004 = 27.10.2014:20:00:00
009 = 29.09.2014:20:00:00
012 = 10.11.2014:20:00:00
=end

file = File.open(ARGV[0] + "class009_homework/project_to_names.csv", "r")
file.each do |line|
    names = line.split(/\,/).last.split(/\s/).first.chomp + "_" + line.split(/\,/).last.split(/\s/).last.chomp
    names_to_team[names] = line.split(/\,/).first
    names_to_result[names] = [0,0,0,0,0,0]
end
#deletes the newly formated first row of the loaded csv (Project Name | Student Name)
names_to_team.delete("Student_Name")
names_to_result.delete("Student_Name")  

#1Check entry submissions
Dir.chdir(ARGV[0] + "vhodno_nivo/")
Dir.glob(ARGV[0] + "vhodno_nivo/**/*.*") do |filename|
    names_to_team.keys.each do |key|
        if filename.include?(key) || filename.include?(key.downcase)
            var = `git log --until="22.09.2014.20:00" -- #{filename}`
            if !var.empty?
                names_to_result[key][0] = 2 if names_to_result[key][0] == 0
            else
                names_to_result[key][0] = 1 if names_to_result[key][0] == 0
            end
        end
    end
end

#2Check class002 submission
Dir.chdir(ARGV[0] + "class002_homework/")
Dir.glob(ARGV[0] + "class002_homework/**/*.rb") do |filename|
    names_to_team.keys.each do |key|
        if filename.include?(key) || filename.include?(key.downcase)
            var = `git log --until="22.09.2014.20:00" -- #{filename}`
            if !var.empty?
                names_to_result[key][1] = 2 if names_to_result[key][1] == 0
            else
                names_to_result[key][1] = 1 if names_to_result[key][1] == 0
            end
        end
    end
end

#3Check class003 submission
Dir.chdir(ARGV[0] + "class003_homework/")
Dir.glob(ARGV[0] + "class003_homework/**/*.rb") do |filename|
    names_to_team.keys.each do |key|
        if filename.include?(key) || filename.include?(key.downcase)
            var = `git log --until="24.09.2014:20:00:00" -- #{filename}`
            if !var.empty?
                names_to_result[key][2] = 2 if names_to_result[key][2] == 0
            else
                names_to_result[key][2] = 1 if names_to_result[key][2] == 0
            end
        end
    end
end

#4Check class004 submission
Dir.chdir(ARGV[0] + "class004/")
Dir.glob(ARGV[0] + "class004/**/*.rb") do |filename|
    names_to_team.keys.each do |key|
        if filename.include?(key) || filename.include?(key.downcase)
            var = `git log --until="29.09.2014:20:00:00" -- #{filename}`
            if !var.empty?
                names_to_result[key][3] = 2 if names_to_result[key][3] == 0
            else
                names_to_result[key][3] = 1 if names_to_result[key][3] == 0
            end
        end
    end
end

#5Check class009 submission
Dir.chdir(ARGV[0] + "class009_homework/")
Dir.glob(ARGV[0] + "class009_homework/**/*.pdf") do |filename|
    names_to_team.each_pair do |name, team|
        expected_file = team + ".pdf"
        if File.exists?(expected_file)
            var = `git log --until="10.11.2014:20:00:00" -- #{filename}`
            names_to_result.each_pair do |name2, result|
                if(name <=> name2) == 0
                    if !var.empty?
                        names_to_result[name][4] = 2 if names_to_result[name][4] == 0
                    else
                        names_to_result[name][4] = 1 if names_to_result[name][4] == 0
                    end
                end    
            end
        end
    end
end

#6Check class012 submission
Dir.chdir(ARGV[0] + "class012_homework/")
Dir.glob(ARGV[0] + "class012_homework/**/*.rb") do |filename|
    names_to_team.keys.each do |key|
        if filename.include?(key) || filename.include?(key.downcase)
            var = `git log --until="10.11.2014:20:00:00" -- #{filename}`
            if !var.empty?
                names_to_result[key][5] = 2 if names_to_result[key][5] == 0
            else
                names_to_result[key][5] = 1 if names_to_result[key][5] == 0
            end
        end
    end
end

#7 Write to CSV
Dir.chdir(entry_point)
writer = XMLWriter.new
writer.output_result(names_to_result)
=begin
CSV.open("results_Velislav_Kostov_B_7.csv", "w") do |csv|
    csv << ["", "", "VH", "002", "003", "004", "009", "012"]
    
    names_to_result.each_pair do |name, result|
        csv << [name.split(/\_/).first, name.split(/\_/).last, result[0], result[1], result[2], result[3], result[4], result[5]]
    end
end
=end
