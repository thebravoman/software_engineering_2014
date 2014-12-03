# Petko '3phase' Bozhinov
# JustCrew

start_time = Time.now

require 'csv'
require "./csv_writer.rb"
require "./xml_writer.rb"
require "./json_writer.rb"
require "./html_writer.rb"
require "./svg_writer.rb"

entry_level_count_in_folder = 0

tasks = Hash.new{|hash, key| hash[key] = []}			# Tasks and deadlines
grades = Hash.new{|hash, key| hash[key] = [0]}			# Final grades
@reports_list = Hash.new{|hash, key| hash[key] = []}	# List with people with reports
add_coefficient = 0										# Add coefficient (for flog and flay)
@break_program = 0										# Breaker

def check_grades grades, repo, deadline, array_index

	path = "#{ARGV[0]}#{repo}"
	if repo == "class009_homework/*.pdf"
		repo_path = path.split("*.pdf").first
		reports_list = check_reports_get_teams repo_path
		check_reports grades, path, deadline, reports_list
	end

	if array_index >= 1 and array_index <= 3
		first_add_coefficient = 8
		second_add_coefficient = 15
	elsif array_index >= 5 and array_index <= 8
		first_add_coefficient = 7
		second_add_coefficient = 14
	end

	Dir.glob("#{path}") do |checked_file|
		name = generate_name checked_file if repo != "class009_homework/*.pdf"
		if name == nil
			next
		end
		grades["#{name}"][array_index] = 2
		entry_count = check_entry checked_file if repo == "vhodno_nivo/*_*_*/"
		if entry_count.to_i >= 3
			grades["#{name}"][0] = 2
		end
		git_check = check_git_submit checked_file, deadline
		if git_check != 1
			grades["#{name}"][array_index] = 1
			next
		end
		flog_check grades, name, checked_file, array_index, first_add_coefficient if repo != "vhodno_nivo/**/*_*_*.*" and repo != "class009_homework/*.pdf"
		flay_check grades, name, path, name.split(' ').first, array_index, second_add_coefficient if repo != "vhodno_nivo/**/*_*_*.*" and repo != "class009_homework/*.pdf"
		replace_with_zero grades, name
	end
end

def check_entry entr_level
	entry_level_count_in_folder = 0
	Dir.glob("#{entr_level}/*.*") do |file|
	  entry_level_count_in_folder += 1
	end
	return entry_level_count_in_folder 
end

def check_git_submit file, deadline
	log = `git log --until=#{deadline} #{file}`
	if log == ""
		return 0
	else 
		return 1
	end
end

def check_reports grades, repo_loc, deadline, list_with_reports
	Dir.glob("#{repo_loc}") do |task9|
		team = task9.split('/').last.split('.').first
		task9 = task9.gsub("'", "")
		git_check = check_git_submit task9, deadline
		if list_with_reports.has_key?("#{team}")
			list_with_reports["#{team}"] = list_with_reports["#{team}"].uniq
			list_with_reports["#{team}"].each do |name|
				name = name.split(' ')
				name = "#{name[0].capitalize} #{name[1].capitalize}"
				if git_check == 0
					grades["#{name}"][4] = 1
				elsif git_check == 1
					grades["#{name}"][4] =  2
				end
			end
		end
	end
end

def check_reports_get_teams path_to_folder
	expected_file = "#{path_to_folder}project_to_names.csv"
	if File.exists?(expected_file) 
		file_content = File.read(expected_file)
		file_content = file_content.gsub(/\n/,";")
		file_content = file_content.split(";")
		file_content.each do |element|
			@reports_list["#{element.split(',').first}"].insert(-1, element.split(',').last)
		end
	end
	return @reports_list
end

def capitalize_name first_name, last_name
	if first_name and last_name
		first_name = first_name.capitalize
		last_name = last_name.capitalize
	end
	return "#{first_name} #{last_name}"
end

def generate_name path_to_get_name_from
	name = path_to_get_name_from.split('/').last.split('_')
	first_name = name[0]
	last_name = name[1]
	name = capitalize_name first_name, last_name
	return name
end

def replace_with_zero grades, key
	for k in 0..8
		if grades["#{key}"][k] == nil
			grades["#{key}"][k] = 0
		end
	end
end

def flog_check grades, name, file_to_check, array_index, add_coefficient
	flog = `flog #{file_to_check}`
	if flog != ""
		flog = flog.split(':').first
		if flog
			grades["#{name}"][array_index+add_coefficient] = flog
		end
	end
end

def flay_check grades, name, path_to_folder, name_to_check, array_index, add_coefficient
	flay = `flay #{path_to_folder} | grep #{name_to_check} | wc -l`
	if flay.to_i != nil
		flay = flay.to_i
	else 
		flay = -1
	end
	grades["#{name}"][array_index+add_coefficient] = flay
end

def initialize_csv grades, tasks 
	i = 0
	File.open("config.csv", "r") do |csv|
		@file_ct = csv.read
	end
	@file_ct = @file_ct.split(/\n/)
	@file_ct.each do |element|
		element = element.split(',')
		tasks["#{element[0]}"][0] = element[1]				# location
		tasks["#{element[0]}"][1] = element[2]				# deadline
	end
	tasks.keys.each do |key|
		check_grades grades, tasks[key][0], tasks[key][1], i
		i+=1
	end
end

def write_out grades, running_time, tasks
	switcher = ARGV[2]
	bitchAssLoop = case switcher
		when "csv" 
			writer = CSVWriter.new
			writer.write grades, running_time, tasks
		when "xml"
			writer = XMLWriter.new
			writer.write grades, running_time
		when "json"
			writer = JSONWriter.new
			writer.write grades, running_time
		when "html"
			writer = HTMLWriter.new
			writer.write grades, running_time
		when "svg"
			writer = SVGDrawer.new
			writer.write grades, running_time
		else puts "Please, pass one of the following values as third argument: \n  - csv\n  - xml\n  - json\n  - html\n  - svg"
	end
end

initialize_csv grades, tasks
 
running_time = Time.now - start_time

if ARGV[1] == "-o" 
	write_out grades, running_time, tasks
end