require 'builder'

class XMLWriter
	def write odd_result
		file = File.new("results_Hristiyan_Velyakov_A_28.xml", "w")
		xml = Builder::XmlMarkup.new(:indent => 2)
		file << xml.odd_result {
			odd_result.sort.each do |file_name|
					xml.file file_name
			end
		}
		file.close
	end
end
