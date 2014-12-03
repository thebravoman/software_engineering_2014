require 'yaml'

def init_headers(html,hw_h,gh,yh)
	html.puts("		<tr>")
	html.puts("			<th> FirstName </th>")
	html.puts("			<th> LastName </th>")
	hw_h.split("|").each do | header |
	next if header == "-"
		html.puts("			<th> #{header} </th>")
	end

	gh.split("|").each do | header |
	next if header == "-"
		html.puts("			<th> #{header} </th>")
	end
	yh.split("|").each do | header |
	next if header == "-"
		html.puts("			<th> #{header} </th>")
	end
	html.puts("		</tr>")
	return html
end

class HTMLWriter
	@@config = ""
	def self.write(results)
		@@config = YAML.load_file("config.yml")["headers"]
		homework_header = @@config["homeworks"]
		flog_header = @@config["flog"]
		flay_header = @@config["flay"]
	
		html = File.open("results_Stefan_Iliev_B_28.html", "w")
		html.puts("<!DOCTYPE html>")
		html.puts("<html>")
		html.puts("	<table border=\"1\" style=\"width:100%\">")

		html = init_headers(html,homework_header,flog_header,flay_header)

		results.each do |key,hw_hash|
			html.puts("		<tr>")
			html.puts("			<td> #{key.split("_").first} </td>")
			html.puts("			<td> #{key.split("_")[1]} </td>")
			counter = 0
			homework_header.split("|").each do | header |
			next if header == "-" 
			counter += 1
				html.puts("			<td> #{hw_hash.values_at("homework_#{counter}").first} </td>")
			end 
			counter = 0
			flog_header.split("|").each do | header |
			next if header == "-"
				counter += 1
				html.puts("			<td> #{hw_hash.values_at("flog_#{counter}").first} </td>")
			end 
			counter = 0
			flay_header.split("|").each do | header |
			next if header == "-"
				counter += 1
				html.puts("			<td> #{hw_hash.values_at("flog_#{counter}").first} </td>")
			end 
			html.puts("		</tr>")
		end

		html.puts("	</table>")
		html.puts("</html>")
		html.close
	end
end

