require 'builder'

class XMLWriter
	def write results
		file = File.new("results_Marian_Belchev_A_17.xml", "w")
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
				}	
			end
		}
		file.close
	end
end