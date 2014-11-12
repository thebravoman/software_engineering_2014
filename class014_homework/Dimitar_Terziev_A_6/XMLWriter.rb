class XMLWriter
	def write data
		xml_results = Nokogiri::XML::Builder.new do |xml|
		xml.homework_evaluation{
			xml.title "Results"
			xml.description "results from homeworks' turn-in"
			xml.legend{
				xml.result "0-not turned in"
				xml.result "1-turned in but not on time"
				xml.result "2-turned in on time"
			}
			data.each{|key, value|
				xml.student{
					xml.name key
					xml.results{
						xml.vhodno_nivo "#{value[0]}"
						xml.class002 "#{value[1]}"
						xml.class003 "#{value[2]}"
						xml.class004 "#{value[3]}"
						xml.class009 "#{value[4]}"
						xml.class012 "#{value[5]}"
					}
				}
			}
		}
		end
		File.open("results_Dimitar_Terziev_A_6.xml","w"){ |file| 
			file.write(xml_results.to_xml)
		}
	end
end
