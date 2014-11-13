
class XMLWriter
	def write result
 		file = File.new("results_Martin_Grigorov_B_23.xml", "w")
		file.write("<results>")
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
