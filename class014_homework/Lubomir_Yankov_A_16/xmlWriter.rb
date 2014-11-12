require 'builder'


class XMLWriter
	
	def write(results)

		File.open("results_Lubomir_Yankov_A_16.xml", "w") do |f|

		xml = Builder::XmlMarkup.new( :target => f, :indent => 2 )

		xml.instruct! :xml, :version => "1.0", :encoding => "UTF-8"
		xml.students do

			 results.keys.sort.each do | name, choice |
		  		xml.student do 

		  			xml.first_name(name.split(" ")[0])
		  			xml.last_name(name.split(" ")[1])
		  			xml.homework_check do 

		  				xml.vhodno_nivo do
		  					xml.result(results[name][0])
		  				end
		  				
		  				xml.class002 do
		  					xml.result(results[name][1])
		  				end
		  				
		  				xml.class003 do
		  					xml.result(results[name][2])
		  				end
		  				
		  				xml.class004 do
		  					xml.result(results[name][3])
		  				end
		  				
		  				xml.class009 do
		  					xml.result(results[name][4])
		  				end
		  				
		  				xml.class012 do
		  					xml.result(results[name][5])
		  				end
		  			end


		  		end
		 	end
		end

		xml_data = xml.target!  #Returns the implictly created string target object
		end

	end

end