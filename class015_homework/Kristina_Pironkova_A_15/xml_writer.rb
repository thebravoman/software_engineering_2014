require 'builder'

class XMLWriter
	def write results,time
		file = File.new("results_Kristina_Pironkova_A_22.xml", "w")
		xml = Builder::XmlMarkup.new(:indent => 2)
		file << xml.results {
			results.keys.sort.each do |key|
					xml.student {
						xml.name key
						xml.vh results[key]["VH"]
						xml.HW002 results[key]["002"]
						xml.HW003 results[key]["003"]
						xml.HW004 results[key]["004"]
						xml.HW009 results[key]["009"]
						xml.HW012 results[key]["012"]
						xml.HW012 results[key]["014"]
						xml.HW002 results[key]["g2"]
						xml.HW003 results[key]["g3"]
						xml.HW004 results[key]["g4"]
						xml.HW009 results[key]["g9"]
						xml.HW012 results[key]["g12"]
						xml.HW014 results[key]["g14"]
						xml.HW002 results[key]["y2"]
						xml.HW003 results[key]["y3"]
						xml.HW004 results[key]["y4"]
						xml.HW009 results[key]["y9"]
						xml.HW012 results[key]["y12"]
						xml.HW014 results[key]["y14"]
						


					}
				
			end
		}
		file.close
	end
end
