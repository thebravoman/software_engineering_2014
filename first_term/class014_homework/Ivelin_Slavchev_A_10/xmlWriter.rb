require 'builder'

class XMLWriter
	
	def write(results)
		File.open("results_Ivelin_Slavchev_A_10.xml", "w") do |f|
		xml = Builder::XmlMarkup.new( :target => f, :indent => 2 )
		xml.instruct! :xml, :version => "1.0", :encoding => "UTF-8"
		xml.students do
			 results.keys.sort.each do | name, choice |
		  		xml.student do 
		  			xml.first_name(name.split(" ")[0])
		  			xml.last_name(name.split(" ")[1])
		  			xml.homework_check do 
		  				xml.VHODNO_NIVO do
		  					xml.result(results[name][0])
		  				end		  				
		  				xml.CLASS002 do
		  					xml.result(results[name][1])
		  				end		  				
		  				xml.CLASS003 do
		  					xml.result(results[name][2])
		  				end		  				
		  				xml.CLASS004 do
		  					xml.result(results[name][3])
		  				end		  				
		  				xml.CLASS009 do
		  					xml.result(results[name][4])
		  				end		  				
		  				xml.CLASS012 do
		  					xml.result(results[name][5])
		  				end
		  			end
		  		end
		 	end
		end
		xml_data = xml.target!  
		end
	end

end