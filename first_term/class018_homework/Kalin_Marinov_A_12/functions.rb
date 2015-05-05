def check_date(date, file)
	`git log --reverse --format=%at "#{ file }"` < date ? 2 : 1
end

def get_short_name name
	name[-1] = '' if name[-1] == "/"
	name = name.gsub(/\A.+\/|_[^\/_]+\z|_|\/\z/, '_' => ' ', /.+/ => '')
	name.scan(/\A[\S]+ [\S]+/).first
end

def make_array 
	Array.new($folder_names.size-2)
end

def option_picked
	case ARGV[1] + " " + ARGV[2]
	when "-o xml" then XMLWriter.new
	when "-o json" then JSONWriter.new
	when "-o html" then HTMLWriter.new
	when "-o svg" then SVGWriter.new
	else CSVWriter.new
	end
end

def pdf_checking(full_pdf_name, names)
	pdf_name = full_pdf_name.gsub(/.+\/|\..+/, '')
	students = $pdf_names.select { |element| element.first == pdf_name}
	students.each do |_, info|	
		names[info] = make_array if names[info].nil?
		names[info][4] = check_date($folders[4].last, full_pdf_name)
	end
end

def zero_level_checking(short_name, program_name, names)
		names[short_name][0] = 0 unless program_name =~ /\/[a-zA-Z0-9]+_[a-zA-Z0-9]+_([1-9]|1[0-8])\.[A-Za-z]+\z/ 
		name = names[short_name][0]
		if name != 0
			name = Array.new(1, 2) if name.nil?
			name[0] = check_date($folders.first.last, program_name) if name.first == 2
			name << Integer(program_name.gsub(/.+_|\..+/, ''))
			names[short_name][0] = name
		end
end

def set_n_students
	number = ARGV[4]
	number.nil? ? -1 : number.to_i+1
end

def set_programs get_info
	programs = get_info['runnable_programs'].split(', ')
	programs.map { |program| program.to_i }
end

def set_output_hash names, size_prog
	names.each do |key, value| 
		value.map! { |var| var.nil? ? 0 : var }
		temp_number = value[0]
		value[0] = temp_number.uniq.size >= 3 ? temp_number[0] : 0 if temp_number.class == Array
		(0...size_prog).each { |index| value[(index-size_prog)] = -1 if value[index-(size_prog*2)] == 0}
	end
	Hash[names.sort_by { |k,v| k }]
end

def flay_and_flog_run student, program_name, index_flog, size
	student[index_flog] = `flog #{ program_name }* -s -q`.to_i
	student[index_flog+size] = `flay #{ program_name }* -s`.scan(/\d+/).first.to_i
end

def set_folders get_info
	names = get_info['homework_names'].split(', ').map { |string| string.gsub(/[^\d\w]/, '') }
	folders = get_info["folders"].to_a
	return names, folders
end

def set_pdf get_info
	File.read(ARGV[0] + get_info['presentation']).split("\n").drop(1).map{ |element| element.split(",") }
end

def reached_max_students? students_left
	students_left > 0 && (students_left-1) == 0
end

def valid_name? short_name
	short_name =~ /\A[A-Z][a-z]+ [A-Z][a-z]+\z/
end

def run_normal_program program_name, index_flog, size_prog, names, current_homework
	names[current_homework] = check_date($folders[current_homework].last, program_name)
	flay_and_flog_run names, program_name, index_flog, size_prog
end

