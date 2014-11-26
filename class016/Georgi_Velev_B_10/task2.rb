require_relative 'task.rb'

class Task2 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"2",
			:what_order=>"ASC",
			:what_order_ext=>"ASC"
			:case=>"LOWER"
			:file_format=>"CSV",
			:file_format_example=>
"FileName1,EXT1
FileName2,EXT2
..
FileNameN,EXTN
",			
			:expected=>
"Aladin, TXT
Homework, TXT
Music, ZIP
"
		}
		
		context1_2 = {
			:task_number=>"2",
			:what_order=>"ASC",
			:what_order_ext=>"DESC"
			:case=>"UPPER"
			:file_format=>"XML",
			:file_format_example=>
"<folder>
	<file>
		<name>FileNameN</name>
		<extension>EXTN</extension>
	</file>
	...
	<file>
		<name>FileNameN</name>
		<extension>EXTN</extension>
	</file>
</folder>
",			
			:expected=>
"<folder>
	<file>
		<name>Music</name>
		<extension>ZIP</extension>
	</file>
	<file>
		<name>Aladin</name>
		<extension>TXT</extension>
	</file>
	<file>
		<name>Homework</name>
		<extension>TXT</extension>
	</file>
</folder>
"
		}
		
		context1_3 = {
			:task_number=>"2",
			:what_order=>"DESC",
			:what_order_ext=>"DESC"
			:case=>"UPPER"
			:file_format=>"HTML",
			:file_format_example=>
"<html>
	<head>
	</head>
	<body>
		<table>
			<tr>
				<td>FileNameN</td>
				<td>EXTN</td>
			</tr>
		</table>	
	</body>	
</html>
",			
			:expected=>
"<html>
	<head>
	</head>
	<body>
		<table>
			<tr>
				<td>Music</td>
				<td>ZIP</td>
			</tr>			
			<tr>
				<td>Homework</td>
				<td>TXT</td>
			</tr>
			<tr>
				<td>Aladin</td>
				<td>TXT</td>
			</tr>
		</table>	
	</body>	
</html>
"
		}
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task2.eruby'
	end
end
