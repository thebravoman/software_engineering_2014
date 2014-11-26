require_relative 'task.rb'
class Task3 < Task
	def init_contexts
		context1_1 = {
			:write_in=>"HTML",
			:letters=>"10",
			:name=>"FIRST name",
			:sort_by=>"LAST name",
			:sort_order=>"ASC",
			:example=>
		"
		<html>
		<table>
		<tr>
		<th>firstName5,lastName1</th>
		</tr>
		<tr>
		<th>firstName9,lastName2</th>
		</tr>
		...
		<tr>
		<th>firstNameN,lastNameN</th>
		</tr>
		</table>
		<html>
		",
		:expected=>
"<html>
<table>
<tr>
<th>Fir</th>
<th>Last</th>
</tr>
<tr>
<th>Frist1</th>
<th>Last1</th>
</tr>
<tr>
<th>FirstN</th>
<th>LastN</th>
</tr>
<tr>
<th>FirstName</th>
<th>LastNameeee</th>
</tr>
</table>
</body>
</html>
		"
		}
		context1_2 = {
			:write_in=>"JSON",
			:letters=>"5",
			:name=>"LAST name",
			:sort_by=>"LAST name",
			:sort_order=>"DESC",
			:example=>
		"
		[
		 \"firstName4,lastName6\"
		][
		 \"firstName7,lastName5\"
		]...[
		 \"firstName2,lastNameN\"
		]
		",
		:expected=>
"[
  \"Frist1,Last1\"
][
  \"FirstN,LastN\"
][
  \"Fir,Last\"
]"
		}
		context1_3 = {
			:write_in=>"XML",
			:letters=>"10",
			:name=>"FIRST name",
			:sort_by=>"FIRST name",
			:sort_order=>"ASC",
			:example=>
		"
		<results>
		<student>
		<firstName>firstName1</firstName>
		<lastName>lastName3</lastName>
		</student>
		<student>
		<firstName>firstName2</firstName>
		<lastName>lastName8</lastName>
		</student>
		...
		<student>
		<firstName>firstNameN</firstName>
		<lastName>lastName2</lastName>
		</student>
		</results>
		",
	:expected=>
		"<results>
<student>
<firstName>Fir</firstName>
<lastName>Last</lastName>
</student>
<student>
<firstName>FirstN</firstName>
<lastName>LastN</lastName>
</student>
...
<student>
<firstName>FirstName</firstName>
<lastName>LastNameeee</lastName>
</student>
<student>
<firstName>Frist1</firstName>
<lastName>Last1</lastName>
</student>
</results>"
		}
[context1_1,context1_2,context1_3]
end
	def initialize
		super 'task3.eruby'
	end
end
