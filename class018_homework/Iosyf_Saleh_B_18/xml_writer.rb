class XMLWriter
	def write result, end_time
 		file = File.new("results_Iosyf_Saleh_B_18.xml", "w")
		file.write("<results>")
		file.write("<program_run_time>"+end_time.to_s+"</program_run_time>\n")
		result.keys.each do |key|
			key_split = key.split(",")
			file.write("\n\t<students>")
			file.write("\n\t\t<student_name>"+key_split.to_s+"</student_name>")
			file.write("\n\t\t<result>"+result[key].to_s+"</result>")
			file.write("\n\t</students>")
		end
		file.write("\t</results>")
		file.close
	end
end
