hash = Hash.new
def write(hash)
	html = File.open("results_Nikolay_Mihailov_B_25.html", "w")
	
	html.puts("<!DOCTYPE html>")
	html.puts("<html>")
	html.puts("	<table border=\"1\" style=\"width:50%\">")

	html.puts("	<tr>")
	html.puts("	<th> Name </th>")
	html.puts("	<th> Result </th>")
	html.puts("	</tr>")
	
	hash.keys.sort.each do |key|
		html.puts("	<tr>")
		html.puts("	<td> #{key} </td>")
		html.puts("	<td> #{hash[key]} </td>")
		html.puts("	</tr>")
	end
	html.puts("	</table>")
	html.puts("</html>")
	html.close
end
Dir.glob(ARGV[0] + "/class017_test/files_for_exam_2/results/*_*_*_*.rb") do |file|
	names = file.split(/\//).last.split(/_/)	
	next if names[3] == nil
	Dir.glob(ARGV[0] + "/class017_test/files_for_exam_2/expects/*.*") do |file|
		expects = file.split(/\//).last.split(".").first
		if names[3] == expects 		
			#nai tupoto domashno koeto sme imali, nqma da go pravq poveche zashtoto se obicham i me boli gutloto :/ 
			hash[names[0] + " " + names[1]] = 1 

		end
	end

end
write(hash)

	
