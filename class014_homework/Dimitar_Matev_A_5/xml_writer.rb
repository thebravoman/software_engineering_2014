require 'rexml/document'
include REXML	

class XMLWriter

	def add name, key
		doc = Document.new.add_element(name)
		doc.text = key
		doc
	end

	def write names, name_of_folder	
		test = ["VH", "002", "003", "004", "009", "012"]
		student = Document.new.add_element("results\n")

		names.each do |key, value|
			name_of_student = Document.new.add_element("student") 	
			name_of_student.add_element(add("name", key))
			value.size.times do |number|
				name_of_student.add_element(add("test", test[number]))
				name_of_student.add_element(add("results", value[number]))
			end
			student.add_element(name_of_student)
		end

		File.open(name_of_folder + ".xml", "w") do |xml|
			xml.write(student)
		end
	end

end
