require_relative "xml_writer.rb"
require_relative "html_writer.rb"
require_relative "csv_writer.rb"
require_relative "json_writer.rb"
require_relative "svg_writer.rb"
	
class ResultWriter
	def self.write( writer_type, result )
		writer =0 
		case writer_type
			when "xml"
				writer = XMLWriter.write result
				exit()
			when "svg"
				writer = SVGWriter.write result
				exit()
			when "csv"
				writer = CSVWriter.write result
				exit()
			when "html"
				writer = HTMLWriter.write result
				exit()
			when "json"
				writer = JSONWriter.new
		end
		writer.write result
	end
end 
