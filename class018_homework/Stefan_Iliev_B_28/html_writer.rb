require 'yaml'

def init_headers(html,hw_h,gh,yh)
	html.puts("\t<tr>")
	html.puts("\t\t<th> FirstName </th>")
	html.puts("\t\t<th> LastName </th>")
	html.puts(write_header(hw_h))
	html.puts(write_header(gh))
	html.puts(write_header(yh))
	html.puts("\t</tr>")
	return html
end

def write_header(header_) 
	string = ""
	header_.split("|").each do | header |
	next if header == "-"
		string += "\t\t<th> #{header} </th>\n"
	end
	return string
end

def write_tr(header_, hw_hash, result) 
	counter = 1
	string = ""
	header_.split("|").each do | header |
		if header == "-" 
			counter += 1
			next
		end 
		string += "\t\t<td> #{hw_hash.values_at("#{result}#{counter}").first} </td>\n"
		counter += 1 
	end 
	return string
end 

class HTMLWriter
	@@config = ""
	def self.write(results,config_file_path)
		@@config = YAML.load_file(config_file_path)["headers"]
		homework_header = @@config["homeworks"]
		flog_header = @@config["flog"]
		flay_header = @@config["flay"]
		res_out_name = @@config["result_output_name"]
		
		html = File.open("#{res_out_name}.html", "w")
		html.puts("<!DOCTYPE html>")
		html.puts("<html>")
		html.puts("	<table border=\"1\" style=\"width:100%\">")

		html = init_headers(html,homework_header,flog_header,flay_header)

		results.each do |key,hw_hash|
			html.puts("\t<tr>")
			html.puts("\t\t<td> #{key.split("_").first} </td>")
			html.puts("\t\t<td> #{key.split("_")[1]} </td>")
			
			html.puts(write_tr(homework_header,hw_hash,"homework_"))
			html.puts(write_tr(flog_header,hw_hash,"flog_"))
			html.puts(write_tr(flay_header,hw_hash,"flay_"))
			
			html.puts("\t</tr>")
		end

		html.puts("	</table>")
		html.puts("</html>")
		html.close
	end
end

