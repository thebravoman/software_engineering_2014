require 'erubis'
require "securerandom"

tasks = [
	content = {
		:main_task => "CSV file with first and last name of students (all files are valid in format [A-Z][a-z], no name checking required)",
		:input_example => "			FirstName_LastName1   
			FirstName_LastName2
			...
			FirstName_LastNameN",
		:output_example => "<students>
	<student>
		<name>FirstName_Student1</name>
	</student>
	<student>
		<name>FirstName_Student2</name>
	</student>
	<student>
		<name>FirstName_Student3</name>
	</student>
<students>",
		:task => "Find all the students from that CSV that have exactly 5 symbols in their First name. If there are duplicates the file must be written only once.",
		:sort_by => "ASC",
		:save_in => "Produce a result in CSV format named result.xml:",
		:expected_result => "<students><student><name>Azohh</name></student><student><name>Binde</name></student><student><name>Cance</name></student><student><name>Xpeke</name></student><students>",
	},
	content = {
		:main_task => "CSV file with first and last name of students (all files are valid in format [A-Z][a-z], no name checking required)",
		:input_example => "			FirstName_LastName1   
			FirstName_LastName2
			...
			FirstName_LastNameN",
		:output_example => "<students>
	<student>
		<name>LastName_Student1</name>
	</student>
	<student>
		<name>LastName_Student2</name>
	</student>
	<student>
		<name>LastName_Student3</name>
	</student>
<students>",
		:task => "Find all the students from that CSV that have exactly 5 symbols in their Last name. If there are duplicates the file must be written only once.",
		:sort_by => "DESC",
		:save_in => "Produce a result in XML format named result.xml:",
		:expected_result => "<students><student><name>Matev</name></student><student><name>MITno</name></student><student><name>Livov</name></student><students>",
	}
]

ARGV.each do |current_number|
	task = Random.rand(0..1)

	file = File.read("task.eruby")
	eruby = Erubis::Eruby.new(file)

	hash_code = SecureRandom.hex(4)
	tasks[task][:task_number] = hash_code

	File.open("tasks/#{ current_number }_#{ hash_code }.txt", "w") do |file_to_save|
		file_to_save.write(eruby.evaluate(tasks[task]))
	end

	File.open("expects/#{ hash_code }.txt", "w") do |file_to_save|
		file_to_save.write(tasks[task][:expected_result])
	end
end
