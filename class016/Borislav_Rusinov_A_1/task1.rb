require_relative 'task.rb'
	class Task1 < Task
		def init_contexts
			context1_1 = {
				:task_number=>"1",
				:extension=>"rb",
				:in_what_order=>"ASC",
				:digit_type=>"odd",
				:format=>"XML",
				:format_output=>"XML file
					 <odd_result>
						<file>FirstName1_LastName1_digit.rb</file>
						<file>FirstName2_LastName2_digit.rb</file>
						<file>FirstNameN_LastNameN_digit.rb</file>
					</odd_result>",
				:expected=>
					"<odd_result>
						<file>First_File_7.rb</file>
						<file>Second_File_15.rb</file>
					</odd_result>
 					"
			}
			context1_2 = {
				:task_number=>"1",
				:extension=>"cpp",
				:digit_type=>"even",
				:in_what_order=>"DESC",
				:format=>"HTML",
				:format_output=>"HTML file
						<h3>Even result </h3>
						<ul>
 							<li>file2_name</li>
							<li>file1_name</li>
							<li>fileN_name</li>
 						</ul>",
				:expected=>
					"<h3>Even result </h3>
						<div class=\"student\">
							<ul>
								<li>Second_File_10.cpp</li>
							</ul>
						</div><div class=\"student\">
					        <ul>
								<li>First_File_8.cpp</li>
							</ul>
						</div>
 						"
			}

			context1_3 = {
				:task_number=>"1",
				:extension=>"c",
				:ditig_type=>"odd",
				:in_what_order=>"ASC",
				:format=>"XML",
				:format_output=>"XML file
					 <odd_result>
						<file>FirstName1_LastName2_digit.c</file>
						<file>FirstName2_LastName1_digit.c</file>
						<file>FirstNameN_LastNameN_digit.c</file>
					</odd_result>",
				:expected=>
				"<odd_result>
					<file>First_File_7.c</file>
					<file>Second_File_15.c</file>
				</odd_result>
 				"
					
			}
			
			[context1_1,context1_2,context1_3]
		end
			def initialize
				super 'task1.eruby'
			end
	end