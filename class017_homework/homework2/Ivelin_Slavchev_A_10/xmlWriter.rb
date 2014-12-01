require 'builder'

class XMLWriter
	
	def write(results, end_time)
		File.open("results_Ivelin_Slavchev_A_10.xml", "w") do |f|
		xml = Builder::XmlMarkup.new( :target => f, :indent => 2 )
		xml.instruct! :xml, :version => "1.0", :encoding => "UTF-8"
		xml.students do
			xml.time(end_time)
			 results.keys.sort.each do |name, choice|
		  		xml.student do 
		  			xml.first_name(name.split(" ")[0])
		  			xml.last_name(name.split(" ")[1])
		  			xml.homework_check do 
		  				xml.vhodno_nivo do
		  					xml.result(results[name][0])
		  				end
		  				xml.class002 do
		  					xml.result(results[name][1])
		  					xml.flog(results[name][10])
		  					xml.flay(results[name][18])
		  				end		  				
		  				xml.class003 do
		  					xml.result(results[name][2])
		  					xml.flog(results[name][11])
		  					xml.flay(results[name][19])
		  				end		  				
		  				xml.class004 do
		  					xml.result(results[name][3])
		  					xml.flog(results[name][12])
		  					xml.flay(results[name][20])
		  				end		  				
		  				xml.class009 do
		  					xml.result(results[name][4])
		  				end		  				
		  				xml.class012 do
		  					xml.result(results[name][5])
		  					xml.flog(results[name][13])
		  					xml.flay(results[name][21])
		  				end
		  				xml.class014 do
		  					xml.result(results[name][6])
		  					xml.flog(results[name][14])
		  					xml.flay(results[name][22])
		  				end
		  				xml.class015 do
		  					xml.result(results[name][7])
		  					xml.flog(results[name][15])
		  					xml.flay(results[name][23])
		  				end
		  				xml.class017_1 do
		  					xml.result(results[name][8])
		  					xml.flog(results[name][16])
		  					xml.flay(results[name][24])
		  				end
		  				xml.class017_2 do
		  					xml.result(results[name][9])
		  					xml.flog(results[name][17])
		  					xml.flay(results[name][25])
		  				end
		  			end
		  		end
		 	end
		end
		xml_data = xml.target!
		end
	end

end
