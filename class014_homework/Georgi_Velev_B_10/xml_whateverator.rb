require 'builder'
class XMLWriter
	def write whatever
		xml = Builder::XmlMarkup.new(:indent => 2)
		puts xml.resultss {
		 whatever.keys.sort.each do |key|
		  xml.student {

				    xml.FirstName key.split(",").first
				    xml.LastName key.split(",").last
				    xml.VH whatever[key][0]
					xml.H002 whatever[key][1]
					xml.H003 whatever[key][2]
					xml.H004 whatever[key][3]
					xml.H009 whatever[key][4]
					xml.H012 whatever[key][5]
			
		    }
		end
		}

		File.open("results_Georgi_Velev_B_10.xml","w") do |f|
		  f.write(xml)
		end
	end
end