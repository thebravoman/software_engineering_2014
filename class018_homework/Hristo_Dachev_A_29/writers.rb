# __     ________ _      _      ______          __  _____     _______ _  __           
# \ \   / /  ____| |    | |    / __ \ \        / / |  __ \ /\|__   __| |/ /    /\     
#  \ \_/ /| |__  | |    | |   | |  | \ \  /\  / /  | |__) /  \  | |  | ' /    /  \    
#   \   / |  __| | |    | |   | |  | |\ \/  \/ /   |  ___/ /\ \ | |  |  <    / /\ \   
#    | |  | |____| |____| |___| |__| | \  /\  /    | |  / ____ \| |  | . \  / ____ \  
#    |_|  |______|______|______\____/   \/  \/     |_| /_/    \_\_|  |_|\_\/_/    \_\

require_relative 'csv_writer.rb'
require_relative 'xml_writer.rb'
require_relative 'json_writer.rb'
require_relative 'html_writer.rb'
require_relative 'svg_writer.rb'

class Writers
	def choosewriter results, start, argv1, argv2
		if argv1 == '-o'
			case argv2
				when 'csv'
					writer = CSVWriter.new
				when 'xml'
					writer = XMLWriter.new
				when 'json'
					writer = JSONWriter.new
				when 'html'
					writer = HTMLWriter.new
				when 'svg'
					writer = SVGWriter.new
				else 
					abort 'ERROR: Wrong type of result file!'
			end
		end
		writer.write results, Time.now - start
	end
end