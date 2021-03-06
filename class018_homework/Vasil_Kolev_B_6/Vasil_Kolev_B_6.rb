require_relative 'csv_reader.rb'
require_relative 'csv_writer.rb'
require_relative 'html_writer.rb'

$times = csv_read "times.csv", 0
$head = Array.new
$head[0] = "First Name"
$head[1] = "Last Name"

i = 0
$times.values.each do |val|
	$head[i+2] = val[1]
	val[3] = i
	$times[val[0]] = val
	i+=1
end

$project_to_names = csv_read "#{ARGV[0]}/class009_homework/project_to_names.csv", 1
$res = Hash.new{|h, k| h[k] = Array.new($times.keys.count,0)}

def check_file (dir)
	#find a better solution some day pls, these exceptions are annoying as hell...
	if ((dir.split('/').last).split('_')[1] != nil or dir.split('/')[-2] == "class009_homework") and dir.split('/').last != "run_them_all.rb" and dir.split('/').last != "hash_to_fixture.csv" and dir.split('/').last != "result_output_name.csv" 
		times_row = $times[dir.split('/')[-2]]
		if times_row != nil
			grade_file dir, times_row
		end
	else
		if File.directory?(dir) and dir.split('/').last != "r2014113"
			Dir.glob("#{dir}"'*/*') do |files|
				times_row = $times[files.split('/')[4]]
				if times_row != nil
					grade_file files, times_row
				end
			end
		end
	end
end

def grade_file (dir, times_row)
	Dir.chdir ("#{ARGV[0]}") do
		if dir.split('/')[-2] == "class009_homework"
			$project_to_names.values.each do |team|
				if team[0] == (dir.split('/').last).split('.')[0]
					if `git log --until #{times_row[2]}, #{dir.split('2014/')[1].dump}` == ''
						$res[team[1]][times_row[3]] = 1
					else 
						$res[team[1]][times_row[3]] = 2
					end
				end
			end
		else
			file = dir.split('/').last
			first_name = file.split('_')[0]
			last_name = file.split('_')[1]
			person = first_name.capitalize + " " + last_name.capitalize
			if `git log --until #{times_row[2]}, #{times_row[0].dump}` == ''
				$res[person][times_row[3]] = 1
			else 
				$res[person][times_row[3]] = 2
			end
		end
	end
end

Dir.glob("#{ARGV[0]}"'*/*') do |dir|
	check_file dir
end

results = $res.sort

if ARGV[1] == "-o"
	case ARGV[2].downcase
	when "csv"
		csv_write results, $head
	when "html"
		html_write $res
	when "json"
		
	end
end

puts results