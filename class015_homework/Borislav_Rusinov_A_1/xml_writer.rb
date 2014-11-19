require 'builder'

class XMLWriter
	def write results, start
		file = File.new("results_Borislav_Rusinov_A_1.xml", "w")
		xml = Builder::XmlMarkup.new(:indent => 2)
		file <<	xml.results {
				xml.time start
			results.keys.sort.each do |key|
				xml.student {
					xml.name key
					xml.vh results[key]["VH"]
					xml.homeworks {
						xml.HW002 results[key]["002"]
						xml.HW003 results[key]["003"]
						xml.HW004 results[key]["004"]
						xml.HW009 results[key]["009"]
						xml.HW012 results[key]["012"]
						xml.HW014 results[key]["014"]
					}
					xml.flog {
						xml.g2 results[key]["g2"]
						xml.g3 results[key]["g3"]
						xml.g4 results[key]["g4"]
						xml.g9 results[key]["g9"]
						xml.g12 results[key]["g12"]
						xml.g14 results[key]["g14"]
					}
					xml.flay {
						xml.y2 results[key]["y2"]
						xml.y3 results[key]["y3"]
						xml.y4 results[key]["y4"]
						xml.y9 results[key]["y9"]
						xml.y12 results[key]["y12"]
						xml.y14 results[key]["y14"]
					}
				}	
			end
		}
		file.close
	end
end
