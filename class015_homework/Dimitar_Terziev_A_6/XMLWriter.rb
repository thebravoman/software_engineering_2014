require 'nokogiri'

class XMLWriter
	def write data, time_taken
		xml_results = Nokogiri::XML::Builder.new do |xml|
			
			xml.homework_evaluation {

				xml.title "Results"
				xml.description "results from homeworks' turn-in"
				xml.time_taken "#{time_taken}"

				xml.legend {
					xml.result "0-not turned in"
					xml.result "1-turned in but not on time"
					xml.result "2-turned in on time"
				}

				data.each do |student_name, homework_results|
					xml.student {
						xml.name student_name
						xml.results {
							results = HOMEWORK_NAMES + HOMEWORK_NUMBERS_FLOG_FLAY.map { |num| "g#{num}" } + 
								HOMEWORK_NUMBERS_FLOG_FLAY.map { |num| "y#{num}" }
							results.each_with_index do |hw_name, index|
								xml.send(hw_name, homework_results[index])
							end
						}
					}
				end

			}
		end

		File.open("results_Dimitar_Terziev_A_6.xml","w") do |file| 
			file.write(xml_results.to_xml)
		end
	end
end
