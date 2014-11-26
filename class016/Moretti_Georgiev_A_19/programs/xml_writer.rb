require 'builder'

class XMLWriter
	def write (student)
		file = File.new("results.xml", "w")
		xml = Builder::XmlMarkup.new(:indent => 2)
		file << xml.allStudents {
			student.sort.each do |key, value|
				xml.student {
					
					xml.secondName student[key][value]
					
				}	
			end
		}
		file.close
	end
end