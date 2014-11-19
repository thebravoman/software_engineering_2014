require 'builder'

class XMLWriter
	def write (student)
		file = File.new("results_Moretti_Georgiev_A_19.xml", "w")
		xml = Builder::XmlMarkup.new(:indent => 2)
		file << xml.student {
			student.keys.sort.each do |key|
				xml.student {
					xml.name key
					xml.vh student[key]["VH"]
					xml.HW002 student[key]["002"]
					xml.HW003 student[key]["003"]
					xml.HW004 student[key]["004"]
					xml.HW009 student[key]["009"]
					xml.HW012 student[key]["012"]
				}	
			end
		}
		file.close
	end
end