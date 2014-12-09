require_relative 'csv_writer.rb'
require_relative 'html_writer.rb'
require_relative 'xml_writer.rb'
require_relative 'json_writer.rb'
require_relative 'svg_writer.rb'
require_relative 'functions.rb'
require 'yaml'

starting_time = Time.now

names = Hash.new
get_info = YAML.load(File.open("config.yml", "r"))

repository = ARGV[0]
students_check = set_n_students
runnable_programs = set_programs get_info
size_prog = runnable_programs.size
$folder_names, $folders = set_folders get_info
$pdf_names = set_pdf get_info
index_flog = $folders.size

$folders.size.times do |current_homework|
	check_n_students = students_check
	Dir.glob(repository + $folders[current_homework].first) do |program_name|
		break if reached_max_students? check_n_students; check_n_students -= 1
		if current_homework == get_info["pdf_check"]
			pdf_checking(program_name, names)
			next
		end
		short_name = get_short_name program_name
		if valid_name? short_name
			names[short_name] = make_array if names[short_name].nil? 
			if not get_info["zero_level_check"] == current_homework
				run_normal_program program_name, index_flog, size_prog, names[short_name], current_homework
			else 
				zero_level_checking short_name, program_name, names
			end
		end
	end
	index_flog += 1 if runnable_programs.include? current_homework
end

names = set_output_hash names, size_prog

$folder_names.first = (Time.now - starting_time).to_i

writer = option_picked
writer.write(names, get_info["result_file_name"], $folder_names)
