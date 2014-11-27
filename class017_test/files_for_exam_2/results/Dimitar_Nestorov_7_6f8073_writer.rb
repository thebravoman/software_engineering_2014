require 'builder'

class XMLWriter
	def write odd_result
		file = File.new("results_Kristina_Pironkova_A_22.xml", "w")
		xml = Builder::XmlMarkup.new(:indent => 2)
		file << xml.odd_result {
			odd_result.sort.each do |file_name|
					xml.file file_name
			end
		}
		file.close
	end
end
