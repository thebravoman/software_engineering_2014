# encoding: utf-8
require 'csv'

softeng = ARGV.first	#taking directory of software_engineering_2014
if softeng[-1] != "/"
	softeng += "/"
end

directories = [["vhodno_nivo/**/*.*", [17, 9, 20]],
				["class002_homework/**/*.rb", [22, 9, 20]],
				["class003_homework/**/*.rb", [24, 9, 20]],
				["class004/**/*.rb", [29, 9, 20]],
				["class009_homework/**/*.pdf", [27, 10, 20]],
				["class012_homework/**/*.rb", [10, 11, 20]]]

results = Hash.new{|hash,key| hash[key] = Array.new(directories.size) {0}}
vhodno = Hash.new{|hash,key| hash[key] = [0,0]}
class009 = Hash.new{|hash,key| hash[key] = []}

File.open("#{softeng}class009_homework/project_to_names.csv", "r").each_line{ |line|
	class009[line.chomp.split(",")[0]] << line.chomp.split(",")[1]
}
class009.delete("Progect Name")

i = -1

directories.each do |directory, deadline|
	i += 1
	Dir.glob("#{softeng}#{directory}").each do |script_file|
		if script_file.split(/\//).last.include? "_" or i == 4
			a = script_file.gsub(/(?=[ -'])/, '\\')
			file = `git log --format="format:%ci" --reverse #{a}`
			file = file.split(/\n/).first
			if file =~ /\A\d+-\d+-\d+ \d+:\d+:\d+ .\d+\z/				#2014-09-29 16:56:39 +0300

				date_day = file.split('-')[2].to_i													#29
				date_month = file.split('-')[1].to_i												#9
				date_time = file.split(' ')[1].split(':').first.to_i									#16
				first_name = script_file.split(/\//).last.split("_").first.capitalize
				last_name = script_file.split(/\//).last.split("_",2).last.split("_").first.capitalize
				name = "#{first_name} #{last_name}"
				if i == 4
					name = script_file.split(/\//).last.split(/\./).first
				end

				if (date_day<deadline[0] && date_month<=deadline[1]) || (date_day==deadline[0] && date_month==deadline[1] && date_time<deadline[2]) then
					if i == 0
						vhodno["#{name}"][0] += 1
						if vhodno["#{name}"][0] != 3
							next
						end
					end
					if i == 4
						class009["#{name}"].each do |student|
							results["#{student}"][i] = 2
						end
						next
					end

					results["#{name}"][i] = 2
				else
					if i == 0
						vhodno["#{name}"][1] += 1
						if vhodno["#{name}"][1] + vhodno["#{name}"][0] != 3
							next
						end
					end
					if i == 4
						class009["#{name}"].each do |student|
							results["#{student}"][i] = 1
						end
						next
					end

					results["#{name}"][i] = 1
				end				
			end
		end
	end
end

CSV.open("results_Iosyf_Saleh_B_18.csv", "w") do |csv|
	csv << [" ", " ", "VN", "002", "003", "004", "009", "012"].flatten
	results.sort.each do |student, result|
		csv << [student.split(' ')[0], student.split(' ')[1], result].flatten
	end
end
