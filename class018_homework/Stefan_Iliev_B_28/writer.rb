require_relative "xml_writer.rb"
require_relative "html_writer.rb"
require_relative "csv_writer.rb"
require_relative "json_writer.rb"
require_relative "svg_writer.rb"
	
class ResultWriter
	def self.write( writer_type, result,config_file_path )
		writer =0 
		case writer_type
			when "xml"
				writer = XMLWriter.write( result, config_file_path)
				exit()
			when "svg"
				writer = SVGWriter.write( result, config_file_path)
				exit()
			when "csv"
				writer = CSVWriter.write( result, config_file_path)
				exit()
			when "html"
				writer = HTMLWriter.write( result, config_file_path)
				exit()
			when "json"
				writer = JSONWriter.new
			when "all"
				XMLWriter.write( result, config_file_path)
				SVGWriter.write( result, config_file_path)
				CSVWriter.write( result, config_file_path)
				HTMLWriter.write( result, config_file_path)
				writer = JSONWriter.new
			else 
				print "\n Output not specified with -o OUTPUT. Writing to html by default.\n"
				writer = HTMLWriter.write( result, config_file_path)
				exit()
		end
		writer.write result
	end
end 
