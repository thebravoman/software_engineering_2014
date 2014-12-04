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
				writer = XMLWriter.new
			when "svg"
				writer = SVGWriter.new
			when "csv"
				writer = CSVWriter.new
			when "html"
				writer = HTMLWriter.write result
				exit()
			when "json"
				writer = JSONWriter.new
		end
		writer.write result
	end
end 
