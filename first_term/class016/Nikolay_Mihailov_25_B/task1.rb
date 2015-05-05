require_relative "task.rb"

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"",
			:name=>"Alexander",
			:letters=>"4",
			:file_format=>"xml",
			:file_format_example=>
"
<result>
	<student>
		<first>Alexander</first>
		<last>Muci</last>
		<number>13</number>
	</student>
	<student>
		<first>Alexander</first>
		<last>Ynwa</last>
		<number>19</number>
	</student>
</result>
",			
			:expected=>
"<result>
	<student>
		<first>Alexander</first>
		<last>Muci</last>
		<number>13</number>
	</student>
	<student>
		<first>Alexander</first>
		<last>Ynwa</last>
		<number>19</number>
	</student>
</result>"
		}
		
		context1_2 = {
			:task_number=>"",
			:name=>"Iosif",
			:letters=>"6",
			:file_format=>"html",
			:file_format_example=>
"
<!DOCTYPE html>
<html>
	<body>
		 <dl>
			<dd>Iosif</dd>
			<dd>Ivanov</dd>
			<dd>12</dd>
			  
		</dl> 
		 <dl>
			<dd>Iosif</dd>
			<dd>Ilievv</dd>
			<dd>17</dd>
		</dl> 
	</body>
	
 </html>",			
			:expected=>
"<!DOCTYPE html>
<html>
	<body>
		 <dl>
			<dd>Iosif</dd>
			<dd>Ivanov</dd>
			<dd>12</dd>
			  
		</dl> 
		 <dl>
			<dd>Iosif</dd>
			<dd>Ilievv</dd>
			<dd>17</dd>
		</dl> 
	</body>
	
 </html>"		
		}
		
		context1_3 = {
			:task_number=>"",
			:name=>"Andrea",
			:letters=>"4",
			:file_format=>"html",
			:file_format_example=>
"
<!DOCTYPE html>
<html>
	<body>
		 <dl>
			<dd>Andrea</dd>
			<dd>Spas</dd>
			<dd>12</dd>
			  
		</dl> 
		 <dl>
			<dd>Andrea</dd>
			<dd>Boko</dd>
			<dd>17</dd>
		</dl> 
	</body>
	
 </html>",			
			:expected=>
"<!DOCTYPE html>
<html>
	<body>
		 <dl>
			<dd>Andrea</dd>
			<dd>Spas</dd>
			<dd>12</dd>
			  
		</dl> 
		 <dl>
			<dd>Andrea</dd>
			<dd>Boko</dd>
			<dd>17</dd>
		</dl> 
	</body>
	
 </html>",			
		}
		
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task1.eruby'
	end
end
