require 'builder'

class XMLWriter
	def write results
		file = File.new("results_Kristina_Pironkova_A_15.xml", "w")
		xml = Builder::XmlMarkup.new(:indent => 2)
		file << xml.results {
			results.keys.sort.each do |key|
					xml.student {
						xml.name key
						xml.vh results[key][0]
						xml.HW002 results[key][1]
						xml.HW003 results[key][2]
						xml.HW004 results[key][3]
						xml.HW012 results[key][4]
					}
				
			end
		}
		file.close
	end
end
