require 'csv'

students_exam1_a = Array.new
students_exam1_b = Array.new
students_exam2 = Array.new
tasks_results = Array.new
expected_results = Array.new
paths_and_hashes_Stefan = Array.new
paths_and_hashes_Vanya = Array.new
paths_and_hashes_Radoslav = Array.new
students_exam2_Stefan = Array.new
students_exam2_Vanya = Array.new
students_exam2_Radoslav = Array.new
paths_and_hashes_Stefan = Array.new
paths_and_hashes_Vanya = Array.new
paths_and_hashes_Radoslav = Array.new

CSV.foreach("software_engineering_2014/class017_homework/hash_to_fixture.csv") do |csv|
	if csv[0] != "Path to Fixture" && csv[1] != "Hashes of script files"
		path = csv[0]
		hashes = csv[1].split(",")
			if path.include?("Stefan")
				paths_and_hashes_Stefan = [path, hashes]
			elsif path.include?("Vanya")
				paths_and_hashes_Vanya = [path, hashes]
			elsif path.include?("Radoslav")
				paths_and_hashes_Radoslav = [path, hashes]
			end
	end
end

def task1(path_tasks, path_expected, all_students)
	Dir.glob("#{ARGV[0]}" + "#{path_tasks}") do |my_text_file|
		first_name = my_text_file.split("/").last.split("_").first
		last_name = my_text_file.split("/").last.split("_",2).last.split("_").first
		hash_code = my_text_file.split("/").last.split("_").last.split(".").first
		Dir.glob("#{ARGV[0]}" + "#{path_expected}") do |file|
			expected_code = file.split("/").last.split(".").first
			if expected_code == hash_code
				`ruby #{my_text_file} software_engineering_2014/class008_test/visible/fixture1 software_engineering_2014/class008_test/visible/fixture2`
				tasks_results = CSV.read("result.csv")
				expected_results = CSV.read("#{file}")
				if tasks_results == expected_results
					task_evaluation = 1
				else
					task_evaluation = 0
				end
				if my_text_file.include?("files_for_exam_1/results/a/")
					all_students << ["#{first_name} #{last_name}", "#{task_evaluation}"]
				elsif my_text_file.include?("files_for_exam_1/results/b/")
					all_students << ["#{first_name} #{last_name}", "#{task_evaluation}"]
				end
			end
		end
	end
end
task1("files_for_exam_1/results/a/results/*_*_*_*.rb", "files_for_exam_1/results/a/expects/*.csv", students_exam1_a)	
task1("files_for_exam_1/results/b/results/*_*_*_*.rb", "files_for_exam_1/results/b/expects/*.csv", students_exam1_b)	

def task2(path_tasks, path_expected, fixtures, path_hash, all_students)
	Dir.glob("#{ARGV[0]}" + "#{path_tasks}") do |my_text_file|
		first_name = my_text_file.split("/").last.split("_").first
		last_name = my_text_file.split("/").last.split("_",2).last.split("_").first
		hash_code = my_text_file.split("/").last.split("_").last.split(".").first
		Dir.glob("#{ARGV[0]}" + "#{path_expected}") do |file|
			expected_code = file.split("/").last.split(".").first
			if path_hash[1].include?("#{expected_code}") && expected_code == hash_code
				`ruby #{my_text_file} software_engineering_2014#{fixtures}`
				tasks_results = CSV.read("result.csv")
				expected_results = CSV.read("#{file}")
				if tasks_results == expected_results
					task_evaluation = 1
				else
					task_evaluation = 0
				end
				all_students << ["#{first_name} #{last_name}", "#{task_evaluation}"]
			end
		end
	end
end
		
task2("files_for_exam_2/results/*_*_*_*.rb", "files_for_exam_2/expects/*.*", "#{paths_and_hashes_Stefan[0]}", paths_and_hashes_Stefan, students_exam2_Stefan)	
#task2("files_for_exam_2/results/*_*_*_*.rb", "files_for_exam_2/expects/*.*", "#{paths_and_hashes_Vanya[0]}", paths_and_hashes_Vanya, students_exam2_Vanya)	
#task2("files_for_exam_2/results/*_*_*_*.rb", "files_for_exam_2/expects/*.*", "#{paths_and_hashes_Radoslav[0]}", paths_and_hashes_Radoslav, students_exam2_Radoslav)


all_students = students_exam1_a
all_students = all_students + students_exam1_b
all_students = all_students + students_exam2_Stefan
all_students = all_students + students_exam2_Vanya
all_students = all_students + students_exam2_Radoslav


file = File.new("results_Stefan_Radev_B_27.html", "w")
n = 0		
file << "<div class=\"student\">
		  	<table width=\"100%\" align=\'center\' cellpadding=\'1\' cellspacing=\'1\' border=\'1\' style=\'table-layout:fixed\'>
				<tr>
					<td>First Name</td> 
					<td>Last Name</td>
					<td>Result</td>
				</tr>
			</table>
		</div>"
all_students.each do |name, points|
first_name = name.split(" ").first
last_name = name.split(" ").last
file << "<div class=\"student\">
		  	<table width=\"100%\" align=\'center\' cellpadding=\'1\' cellspacing=\'1\' border=\'1\' style=\'table-layout:fixed\'>
				<tr>
					<td>#{first_name}</td>
					<td>#{last_name}</td>
					<td>#{points}</td>
				</tr>
		 	 </table>
		</div>"
	n = n + 1
end
