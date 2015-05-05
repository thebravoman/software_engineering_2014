list = Hash.new
stefan = Hash.new 
vanya = Hash.new
radoslav = Hash.new
stefan["../../class016/Stefan_Iliev_B_28/fixture/"] = ["c79cebde","da3e5702","e2d2e61b","db2c5549","6933f104","a059b1d0","2c40c53d","14d2c190","007ac6de","82e7bff5","4ba9968b","27ed8788","f74e194f","2899304a","d614ce69","8fc44197","769ce879","990d42f4","7097778f","fce4d375","600ed2d4","e68e2949"]
vanya["../../class016/Vanya_Santeva_5_B/fixture/"] =  ["44e94fc4","582de2e5","6c3d2ca8","7d2544d7","bad8d1c2","f33e8621","46025b3d","03c6ca26","07c5163f","f76433c1","1a7b3031","193e7097","2bef4341","ccaf7125","209924b8"]
radoslav["../../class016/Radoslav_Kostadinov_22_A/fixture/"] = ["b128c3","6f8073","fd50e0","755d84","8a6e81","bd4324","02e338"]
def to_html ()
	html = File.open("result_Stanislav_Gospodinov_A_26.html", "w")
	html.puts("<body>")
	html.puts("	<table>")
	html.puts("		<tr>")
	html.puts("			<td>First Name</td>")
	html.puts("			<td>Last Name</td>")
	html.puts("			<td>Result</td>")
	html.puts("		</tr>")
	html.puts("	</table>")
	html.puts("</body>")
end

Dir.glob("../../class017_test/files_for_exam_2/results/*.rb") do |file|
	hex = file.split('.rb').first.split('/').last.split('_').last
	first = file.split('.rb').first.split('/').last.split('_').first
	last = file.split('.rb').first.split('/').last.split('_')[1]
	if stefan["../../class016/Stefan_Iliev_B_28/fixture/"].include?("#{hex}")
		result = `ruby #{file} ../../class016/Stefan_Iliev_B_28/fixture/`
		if result != ""
			#
		else
			list["#{first}"+" "+"#{last}"] = 0
		end
	elsif vanya["../../class016/Vanya_Santeva_5_B/fixture/"].include?("#{hex}")
		result = `ruby #{file} ../../class016/Vanya_Santeva_5_B/fixture/`
		if result != ""
			#
		else
			list["#{first}"+" "+"#{last}"] = 0
		end
	elsif radoslav["../../class016/Radoslav_Kostadinov_22_A/fixture/"].include?("#{hex}")
		result = `ruby #{file} ../../class016/Radoslav_Kostadinov_22_A/fixture/`
		if result != ""
			#
		else
			list["#{first}"+" "+"#{last}"] = 0 
		end
	end
end