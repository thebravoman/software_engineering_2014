startTime = Time.now
require 'yaml'
require_relative 'csv_writer.rb'
require_relative 'json_writer.rb'
require_relative 'html_writer.rb'
require_relative 'xml_writer.rb'
require_relative 'svg_writer.rb'

# ruby Atanaska_Ivancheva_B_1.rb Repository -o FileFormat -n Number(optional)

@currentDirectory = Dir.getwd
@results = Hash.new

@classes = YAML.load_file("config.yml")
@teamms = YAML.load_file("st_config.yml")["teams&mmbs"]

def if_set_student(st_name)
	if @results[st_name] == nil then
		@results[st_name] = YAML.load_file("st_config.yml")["student_configuration"]
	end
end

def split(st_name)
	if st_name.split('_').length >= 2 then
		new_st_name = st_name.split("_")[0].capitalize + "_" + st_name.split("_")[1].capitalize
		return new_st_name
	end
end

def check_vh(hw, st_name)
		all = Array.new
		all = Dir.entries("#{ARGV[0]}/vhodno_nivo/")
		all.uniq!
		all.delete_if {|s| File.extname(s) == ".html" || File.extname(s) == "" || File.extname(s) == ".pdf" || File.extname(s) == ".txt" || File.extname(s) == ".md" || s.include?("~") || !s.include?("_")}
		all.sort!

		count = Hash.new(0)
		all.each { |stt| count[st_name] += 1 }
		count.each { |l, m| if m > 2 then @results[st_name][hw] = 1 end }
end

def time_check(file, hw, st_name)
	Dir.chdir("#{File.dirname("#{file}")}")
	time = `git log --until=#{@classes[hw].last} -- #{file}`

	if !time.empty? then
		@results[st_name][hw] = 2
	end
	Dir.chdir("#{@currentDirectory}")
end

def check_nine(file, hw)
	file_name = file.split('/').last.split('.').first
	@teamms.each do |student, team|
		if team == file_name
			if_set_student(student)
			@results[student][hw] = 1
			time_check(file, hw, student)
		end
	end
end

if "#{ARGV[3]}" == "-n" then
	if ARGV[4] then toCheck = ARGV[4] else toCheck = 60 end
end

checkStart = 0


$stderr.reopen("/dev/null", "w")

@classes.keys.each do |homework|
	check = checkStart
	puts "Working on homework #{homework}..."
	Dir.glob("#{ARGV[0]}#{@classes[homework].first}").each do |file|		

		check += 1
		short_file_name = file.split('/').last.split('.').first
		st_name = split(short_file_name)
			case homework
				when "VH"
					if short_file_name.split("_").length >= 2 then
						if_set_student(st_name)
						check_vh(homework, st_name)					
						if @results[st_name][homework] == 1 then
							time_check(file, homework, st_name)
						end
					end
				when "009"
					check_nine(file, homework)
				else
					if_set_student(st_name)
					@results[st_name][homework] = 1
					time_check(file, homework, st_name)
					if homework == "017x1" then
						@results[st_name]["g17x1"] = `flog #{file}`.split(':').first.to_i
						@results[st_name]["y17x1"] = `flay #{File.dirname("#{file}")}| grep #{st_name} | wc -l`.to_i
					elsif homework == "017x2"
						@results[st_name]["g17x2"] = `flog #{File.dirname("#{file}")}`.split(':').first.to_i
						@results[st_name]["y17x2"] = `flay #{File.dirname("#{file}")} | grep #{st_name} | wc -l`.to_i
					elsif homework.to_i < 4 || homework == "012"
						@results[st_name]["g#{homework.to_i}"] = `flog #{file}`.split(':').first.to_i
						@results[st_name]["y#{homework.to_i}"] = `flay #{File.dirname("#{file}")} | grep #{st_name} | wc -l`.to_i
					else
						@results[st_name]["g#{homework.to_i}"] = `flog #{File.dirname("#{file}")}`.split(':').first.to_i
						@results[st_name]["y#{homework.to_i}"] = `flay #{File.dirname("#{file}")} | grep #{st_name} | wc -l`.to_i
					end
			end
			if check - checkStart == toCheck.to_i then break end
		end
		print "\r" + ("\e[A\e[K")
		puts "Homework #{homework} checked."
end

time = Time.now - startTime

if "#{ARGV[1]}" == "-o" then
	if ARGV[2] then
		case ARGV[2]
			when "csv"
				writer = CSVWriter.new
				writer.write(@results, time)
			when "json"
				writer = JSONWriter.new
				writer.write(@results)
			when "html"
				writer = HTMLWriter.new
				writer.write(@results)
			when "xml"
				writer = XMLWriter.new
				writer.write(@results)
			when "svg"
				writer = SVGWriter.new
				writer.write(@results)
			else
				puts "ERROR."
		end
	end
end
