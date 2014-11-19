require 'time'
require_relative 'CSVWriter'
require_relative 'HTMLWriter'
require_relative 'XMLWriter'
require_relative 'JSONWriter'
require_relative 'SVGWriter'
require_relative 'presentations'
require_relative 'check'

start_time = Time.now

TOTAL_HOMEWORKS = 6
HOMEWORK_NUMBERS = ['', 2, 3, 4, 9, 12, 14]
HOMEWORK_NUMBERS_FLOG_FLAY = [2, 3, 4, 12, 14].freeze
HOMEWORK_NAMES = ['vh_nivo', 'class002', 'class003', 'class004', 'class009', 'class012', 'class014'].freeze
DEADLINES = [
	'Sep 17 2014 20:00', 'Sep 22 2014 20:00', 'Sep 24 2014 20:00', 'Sep 29 2014 20:00', 
	'Oct 27 2014 20:00','Nov 10 2014 20:00','Nov 13 2014 06:00'
].freeze

repo_folder = ARGV[0]

data = Hash.new do |hash, student_name| 
	hash[student_name] = Array.new(HOMEWORK_NAMES.size + 2*HOMEWORK_NUMBERS_FLOG_FLAY.size) 
end

current_path = Dir.pwd
Dir.chdir repo_folder

# --- CHECKING
check = Check.new
student_to_team = Hash.new
Presentations::csv_reading(student_to_team)

for i in 1..2
	0.upto(TOTAL_HOMEWORKS) do |curr_hw|
		system "git checkout `git rev-list -1 --before=\"#{DEADLINES[curr_hw]}\" master` -q" if i==2
		case curr_hw
			when 0
				check.check_entry_level data, i
			when 1..2
				check.check_folder "#{HOMEWORK_NAMES[curr_hw]}_homework/", data, curr_hw, /^[a-zA-Z0-9]+_[a-zA-Z0-9]+_Class#{HOMEWORK_NUMBERS[curr_hw]}_[12].rb$/, i
			when 3
				check.check_folder "class004", data, 3, /^[a-zA-Z0-9]+_[a-zA-Z0-9]+_Class4_[12].rb$/, i
			when 4
				Presentations::presentation_names data, student_to_team, i
			when 5..6
				check.check_folder "#{HOMEWORK_NAMES[curr_hw]}_homework/", data, curr_hw, /^[a-zA-Z0-9]+_[a-zA-Z0-9]+_[AB]_\d+.rb$/, i
		end
	end
end

# fill in the missing flog and flay values with -1, i.e. no homework, no value to write, not 0 which is a value!
7.upto(data.first.last.size - 1) do |index| 
	data.each_value { |v| v[index] ||= -1 }
end

# --- ENZEROING

data.each_value do |results|
	results.map! { |curr_hw| curr_hw ||= 0 }
end

system("git checkout master -q")
Dir.chdir current_path
time_taken = Time.now - start_time

# --- WRITING

format = 'CSV'
if ARGV.include?('-o')
	format_index = ARGV.index('-o')+1
	format = ARGV[format_index]
	require_relative "#{format.upcase}Writer"
end
writer = eval("#{format.upcase}Writer.new") if format =~ /\Axml\Z|\Ahtml\Z|\Ajson\Z|\Asvg\Z|\Acsv\Z/
writer.write data.sort, time_taken
