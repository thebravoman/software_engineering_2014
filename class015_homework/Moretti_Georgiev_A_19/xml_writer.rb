require 'builder'

class XMLWriter
	def write (student)
		file = File.new("results_Moretti_Georgiev_A_19.xml", "w")
		xml = Builder::XmlMarkup.new(:indent => 2)
		file << xml.student {
			student.keys.sort.each do |key|
				xml.student {
					xml.name key
					xml.VN student[key]["VN"]
					xml.HW002 student[key]["002"]
					xml.HW003 student[key]["003"]
					xml.HW004 student[key]["004"]
					xml.HW009 student[key]["009"]
					xml.HW012 student[key]["012"]
					xml.G2 student[key]["g2"]
					xml.G3 student[key]["g3"]
					xml.G4 student[key]["g4"]
					xml.G9 student[key]["g9"]
					xml.G12 student[key]["g12"]
					xml.G14 student[key]["g14"]
					xml.Y2 student[key]["y2"]
					xml.Y3 student[key]["y3"]
					xml.Y4 student[key]["y4"]
					xml.Y9 student[key]["y9"]
					xml.Y12 student[key]["y12"]
					xml.Y14 student[key]["y14"]
				}	
			end
		}
		file.close
	end
end