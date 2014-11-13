# xml writer
require 'builder'
class XMLWriter
	def write grades
	  xml = Builder::XmlMarkup.new(:indent=>2)
	  xml.results do |p|
	    grades.keys.sort.each do |key|
		    p.student do |student|
		    	student.name "#{key.split(' ').first} #{key.split(' ').last}"
		    	i = 0
		    	student.result do |exp|
		    		student.vh grades["#{key}"][0]
		    		student.Task002 grades["#{key}"][1]
		    		student.Task003 grades["#{key}"][2]
		    		student.Task004 grades["#{key}"][3]
		    		student.Task009 grades["#{key}"][4]
		    		student.Task012 grades["#{key}"][5]
		    	end
		   	end
		end
	  end
	  file = File.new("results_Nikola_Marinov_A_20.xml", "wb")
	  file.print(xml.target!)
	  file.close
	end
end
