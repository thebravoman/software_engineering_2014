require_relative 'task.rb'
class Task2 < Task
	def init_contexts
		context1_1 = {
			:number=>"10",
			:new_file_format1=>"CSV",
			:new_file_format2=>"HTML",
			:in_what_order => "ASC",
			:example1=>
		"
		FirstName5,LastName5,sum11
		FirstName2,LastName2,sum20
		FirstName9,LastName9,sum31
		...
		FirstName,LastName,sumN
		",
			:expected=>
		"Akledm5o2d1,Ph6e4chy2a4z,12
F5lio6s5q10,Ala5abc7p5i,18
Firstname1,Lastname1,20",
			:example2=>
		"
		<html>
		<table>
		<tr>
		<th>firstName5,lastName4</th>
		<th>sum1</th>
		</tr>
		<tr>
		<th>firstName2,lastName5</th>
		<th>sum3</th>
		</tr>
		...
		<tr>
		<th>firstNameN,lastNameN</th>
		<th>sum10</th>
		</tr>
		</table>
		<html>
		",
			:expected1=>
		"<html>
<table>
<tr>
<th>Firstname2,Lastname2</th>
<th>2</th>
</tr>
<tr>
<th>Name,Alastname5l</th>
<th>6</th>
</tr>
<tr>
<th>Bdb8hl62edm,F16l5</th>
<th>7</th>
</tr>
<tr>
<th>Firstname,Lastname</th>
<th>8</th>
</tr>
</table>
<html>"
		}
		context1_2 = {
			:number=>"15",
			:new_file_format1=>"XML",
			:new_file_format2=>"HTML",
			:in_what_order => "DESC",
			:example1=>
		"
		<results>
		<student>
		<Name> firstName5,lastName5 </Name>
		<sum> 20 </sum>
		</student>
		<student>
		<Name> firstName3,lastName3 </Name>
		<sum> 19 </sum>
		</student>
		...
		<student>
		<Name>firstName7,lastName7 </Name>
		<sum> 16 </sum>
		</student>
		</results>
		",
			:expected=>
"<results>
<student>
<Name>Firstname1,Lastname1</Name>
<sum>20</sum>
</student>
<student>
<Name>F5lio6s5q10,Ala5abc7p5i</Name>
<sum>18</sum>
</student>
</results>",
			:example2=>
		"
		<html>
		<table>
		<tr>
		<th>firstName5</th>
		<th>lastName4</th>
		</tr>
		<tr>
		<th>firstName2</th>
		<th>lastName5</th>
		</tr>
		...
		<tr>
		<th>firstNameN</th>
		<th>lastNameN</th>
		</tr>
		</table>
		<html>
		",
			:expected1=>
"<html>
<table>
<tr>
<th>Akledm5o2d1,Ph6e4chy2a4z</th>
<th>12</th>
</tr>
<tr>
<th>Firstname,Lastname</th>
<th>8</th>
</tr>
<tr>
<th>Bdb8hl62edm,F16l5</th>
<th>7</th>
</tr>
<tr>
<th>Name,Alastname5l</th>
<th>6</th>
</tr>
<tr>
<th>Firstname2,Lastname2</th>
<th>2</th>
</tr>
</table>
<html>"
		}
		context1_3 = {
			:number=>"10",
			:new_file_format1=>"JSON",
			:new_file_format2=>"CSV",
			:in_what_order => "ASC",
			:example1=>
		"
		[
		 \"firstName3,lastName5,12\"
		][
		 \"firstName5,lastName3,14\"
		][
		 \"firstName4,lastName1,15\"
		]...[
		 \"firstName,lastName,N\"
		]
		",
			:expected=>
		"[
  \"Akledm5o2d1,Ph6e4chy2a4z,12\"
][
  \"F5lio6s5q10,Ala5abc7p5i,18\"
][
  \"Firstname1,Lastname1,20\"
]",
			:example2=>
		"
		FirstName5,LastName5,sum1
		FirstName2,LastName2,sum2
		FirstName9,LastName9,sum3
		...
		FirstName4,LastName4,sum10
		",
			:expected1=>
		"Firstname2,Lastname2,2
Name,Alastname5l,6
Bdb8hl62edm,F16l5,7
Firstname,Lastname,8"
		}
		context1_4 = {
			:number=>"15",
			:new_file_format1=>"XML",
			:new_file_format2=>"CSV",
			:in_what_order => "ASC",
			:example1=>
		"
		<results>
		<student>
		<Name> firstName5,lastName5 </Name>
		<sum> 15 </sum>
		</student>
		<student>
		<Name> firstName3,lastName3 </Name>
		<sum> 16 </sum>
		</student>
		...
		<student>
		<Name>firstName7,lastName7 </Name>
		<sum> N </sum>
		</student>
		</results>
		",
			:expected=>
"<results>
<student>
<Name>F5lio6s5q10,Ala5abc7p5i</Name>
<sum>18</sum>
</student>
<student>
<Name>Firstname1,Lastname1</Name>
<sum>20</sum>
</student>
</results>",
			:example2=>
		"
		FirstName5,LastName5,sum1
		FirstName2,LastName2,sum2
		FirstName9,LastName9,sum3
		...
		FirstName4,LastName4,sum15
		",
			:expected=>
"Firstname2,Lastname2,2
Name,Alastname5l,6
Bdb8hl62edm,F16l5,7
Firstname,Lastname,8
Akledm5o2d1,Ph6e4chy2a4z,12"}
[context1_1,context1_2,context1_3,context1_4]
end
	def initialize
		super 'task2.eruby'
	end
end
