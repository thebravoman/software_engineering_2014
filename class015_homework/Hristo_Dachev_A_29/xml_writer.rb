require 'builder'

class XMLWriter
	def write results, time
		file = File.new("results_Hristo_Dachev_A_29.xml", "w")
		xml = Builder::XmlMarkup.new(:indent => 2)
		file <<	xml.results {
				xml.time time
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
						xml.g2 results[key]["g002"]
						xml.g3 results[key]["g003"]
						xml.g4 results[key]["g004"]
						xml.g9 results[key]["g009"]
						xml.g12 results[key]["g012"]
						xml.g14 results[key]["g014"]
					}
					xml.flay {
						xml.y2 results[key]["y002"]
						xml.y3 results[key]["y003"]
						xml.y4 results[key]["y004"]
						xml.y9 results[key]["y009"]
						xml.y12 results[key]["y012"]
						xml.y14 results[key]["y014"]
					}
				}	
			end
		}
		file.close
	end
end