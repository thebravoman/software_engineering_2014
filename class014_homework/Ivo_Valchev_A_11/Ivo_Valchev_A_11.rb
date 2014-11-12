require 'csv'
require 'json'
require_relative "csv_writer"
require_relative "html_writer"
require_relative "xml_writer"
require_relative "json_writer"
require_relative "svg_writer"

repo_folder = ARGV[0]

def check_entry_level(folder_path)
	acceptable_extensions = [ '.c', '.cpp', '.cc', '.rb', '.py', '.java', '.html', '.js', '.pas' ]
	hash = Hash.new { |hash, key| hash[key] = Array.new }

	Dir.glob("#{folder_path}**/*.*") do |file|
	  extension = file.split('/').last.split('.').last
	  fields = file.split('/').last.split('.').first.split('_')
	  if acceptable_extensions.include?('.' + extension)
	    if fields.length == 3 
	      first_name = fields[0]
	      last_name = fields[1]
	      problem_num = fields[2]
	      unless first_name.empty? || last_name.empty? || problem_num.empty? 
		if problem_num.to_i.to_s == problem_num && 
		  problem_num.to_i > 1 && problem_num.to_i < 19 
		    unless hash[first_name+'_'+last_name].include? problem_num.to_i
		      hash[first_name+'_'+last_name].push problem_num.to_i
		    end
		end
	      end
	    end
	  end 
	end

	hash
end

data = Hash.new { |hash, key| hash[key] = Array.new }
current_path = Dir.pwd
Dir.chdir repo_folder

system("git checkout master -q")
entry_level_hash = check_entry_level(ARGV[0] + 'vhodno_nivo/')
entry_level_hash.each { |name, problems| problems.size >= 3 ? data[name][0] = 1 : data[name][0] = 0 }
system('git checkout `git rev-list -1 --before="Sep 17 2014 20:00" master` -q')
entry_level_hash = check_entry_level(ARGV[0] + 'vhodno_nivo/')
entry_level_hash.each { |name, problems| problems.size >= 3 ? data[name][0] = 2 : data[name][0] = 0 }

def check_folder(folder_path, hash, folder_number, filename_format, value_to_write)
	Dir.glob("#{folder_path}**/*.*") do |file|
	  if file.split('/').last =~ filename_format
		first_name = file.split('/').last.split('_')[0]
		last_name = file.split('/').last.split('_')[1]
		hash[first_name+'_'+last_name][folder_number] = value_to_write
	end
	end
end

# --- CLASS 002

data.each { |key, value| data[key][1] = nil }

system("git checkout master -q")
check_folder(ARGV[0] + 'class002_homework/', data, 1, /^[a-zA-Z0-9]+_[a-zA-Z0-9]+_Class2_[12].rb$/, 1)
system('git checkout `git rev-list -1 --before="Sep 22 2014 20:00" master` -q')
check_folder(ARGV[0] + 'class002_homework/', data, 1, /^[a-zA-Z0-9]+_[a-zA-Z0-9]+_Class2_[12].rb$/, 2)

# --- CLASS 003 

data.each { |key, value| data[key][2] = nil }

system("git checkout master -q")
check_folder(ARGV[0] + 'class003_homework/', data, 2, /^[a-zA-Z0-9]+_[a-zA-Z0-9]+_Class3_[12].rb$/, 1)
system('git checkout `git rev-list -1 --before="Sep 24 2014 20:00" master` -q')
check_folder(ARGV[0] + 'class003_homework/', data, 2, /^[a-zA-Z0-9]+_[a-zA-Z0-9]+_Class3_[12].rb$/, 2)

# --- CLASS 004 

data.each { |key, value| data[key][3] = nil }

system("git checkout master -q")
check_folder(ARGV[0] + 'class004/', data, 3, /^[a-zA-Z0-9]+_[a-zA-Z0-9]+_Class4_[12].rb$/, 1)
system('git checkout `git rev-list -1 --before="Sep 29 2014 20:00" master` -q')
check_folder(ARGV[0] + 'class004/', data, 3, /^[a-zA-Z0-9]+_[a-zA-Z0-9]+_Class4_[12].rb$/, 2)

# --- CLASS 009

data.each { |key, value| data[key][4] = nil }
system("git checkout master -q")

student_to_team = Hash.new

CSV.foreach("#{ARGV[0]}class009_homework/project_to_names.csv") do |entry|
	team_name = entry.first
	student_name = entry.last.gsub(' ', '_')
	student_to_team[student_name] = team_name
end

data.each do |key, value|
	if student_to_team.key? key
		if File.exist?(ARGV[0] + "class009_homework/" + student_to_team[key] + '.pdf')
			data[key][4] = 1
		end
	end
end

system('git checkout `git rev-list -1 --before="Oct 27 2014 20:00" master` -q')

data.each do |key, value|
	if student_to_team.key? key
		if File.exist?(ARGV[0] + "class009_homework/" + student_to_team[key] + '.pdf')
			data[key][4] = 2
		end
	end
end

# --- CLASS 012

data.each { |key, value| data[key][5] = nil }

system("git checkout master -q")
check_folder(ARGV[0] + 'class012_homework/', data, 5, /^[a-zA-Z0-9]+_[a-zA-Z0-9]+_[AB]_\d+.rb$/, 1)
system('git checkout `git rev-list -1 --before="Nov 10 2014 20:00" master` -q')
check_folder(ARGV[0] + 'class012_homework/', data, 5, /^[a-zA-Z0-9]+_[a-zA-Z0-9]+_[AB]_\d+.rb$/, 2)

data.each do |key, value|
	data[key].each_with_index do |res, i|
		data[key][i] = 0 if res.nil? 
	end
end



data.sort
system("git checkout master -q")
Dir.chdir current_path

case ARGV[2]
	when "xml"
		writer = XMLWriter.new
	when "csv"
		writer = CSVWriter.new
	when "json"
		writer = JSONWriter.new
	when "html"
		writer = HTMLWriter.new
	when "svg"
		writer = SVGWriter.new
end
writer.write data
