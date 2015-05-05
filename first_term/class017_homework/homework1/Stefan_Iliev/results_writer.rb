
class ResultsWriter 
	def self.write( results )
		results.to_hash
		
		html = File.open("results_Stefan_Iliev_B_28.html", "w")
		html.puts("<!DOCTYPE html>")
		html.puts("<html>")
		html.puts("	<table border=\"1\" style=\"width:100%\">")
		html.puts("		<tr>")
		html.puts("			<th> FirstName </th>")
		html.puts("			<th> LastName </th>")
		html.puts("			<th> Result </th>")
		html.puts("		<tr>")

		results.each do |name, result|
			first_name = name.split("_").first
			last_name = name.split("_")[1]
			html.puts("		<tr>")
			html.puts("			<th> #{first_name} </th>")
			html.puts("			<th> #{last_name} </th>")
			html.puts("			<th> #{result} </th>")
			html.puts("		<tr>")		
		end 
		html.puts("	</table>")
		html.puts("</html>")
		html.close
	end 
end 