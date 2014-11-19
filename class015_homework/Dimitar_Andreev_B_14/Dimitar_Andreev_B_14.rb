require_relative 'csv_read.rb'
require 'csv'

$times = read "times.csv", 0

i = 0
$times.values.each do |val|
	val[3] = i
	$times[val[0]] = val
	i+=1
end

$project_to_names = read "#{ARGV[0]}/class009_homework/project_to_names.csv", 1
$res = Hash.new{|h, k| h[k] = Array.new($times.keys.count,0)}

def check_file (dir)
	if ((dir.split('/').last).split('_')[1] != nil or dir.split('/')[-2] == "class009_homework") and dir.split('/').last != "run_them_all.rb"
		times_row = $times[dir.split('/')[-2]]	
		if times_row != nil
			grade_file dir, times_row
		end
	end
end

def grade_file (dir, times_row)
	Dir.chdir ("#{ARGV[0]}") do
		if dir.split('/')[-2] == "class009_homework"
			$project_to_names.values.each do |team|
				if team[0] == (dir.split('/').last).split('.')[0]
					exception = dir.split('2014/')[1]
					if (dir.split('class009_homework/')[1]).split(' ')[1] != nil
						exception = dir.split('/')[-2] + '/' + (dir.split('/').last).split(' ')[0] + '\ ' + (dir.split('/').last).split(' ')[1] + "/"
					end
					if `git log --until #{times_row[2]}, #{exception}` == ''
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
			if `git log --until #{times_row[2]}, #{dir.split('2014/')[1]}` == ''
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
#Move to another file PLS!
CSV.open("results_Dimitar_Andreev_B_6.csv", "w") do |csv|
	$res.keys.each do |key|
		csv << Array.new(1,key) + $res[key]
	end
end
