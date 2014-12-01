require 'rexml/document'
include REXML	

class XMLWriter

	def write names, name_of_folder, folder_names	
		file_xml = Document.new
		results = file_xml.add_element "results"
		time_xml = results.add_element "time"
		time_xml.text = folder_names[0]

		names.each do |key, value|
			student = results.add_element("student") 	
			name = student.add_element("name")
			name.text = key
			value.size.times do |number|
				test_xml = student.add_element("test")
				test_name = test_xml.add_element("name")
				test_name.text = folder_names[number + 2]
				results_test = test_xml.add_element("results")
				results_test.text = value[number]
			end
		end

		File.open(name_of_folder + ".xml", "w") do |xml|
			xml.write(file_xml)
		end
	end

end
