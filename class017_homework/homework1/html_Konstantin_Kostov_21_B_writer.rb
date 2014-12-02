class HTMLWriter
def write(result)
html = File.open("results_Konstantin_Kostov_B_21.html", "w")
#result.keys.sort.each do |key,val| val|
#xml_file.puts(" <student>")
#xml_file.puts(" <Name> #{key} </Name>")
#xml_file.puts(" <002> #{result[key]} </002>")
#xml_file.puts(" </student>")
result.sort_by{|val,key| val}.reverse.each do |key,val|
html.puts("	<tr>")
html.puts("	<td> #{key} </td>")
html.puts("	<td> #{val} </td>")
html.puts("	</tr>")
end
html.close
end
end
