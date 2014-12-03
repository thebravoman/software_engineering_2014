require 'nokogiri'

class HTMLWriter
	def write data, time_taken
		html_results = Nokogiri::HTML::Builder.new do |html|
			html.html {
				html.head {
					html.title "Results"
				}

				html.body {
					html.table(:border => 1) {
						html.tr {
							html.td "#{time_taken}"
							html.td ""

							results = HOMEWORK_NAMES + HOMEWORK_NUMBERS_FLOG_FLAY.map { |num| "g#{num}" } + 
								HOMEWORK_NUMBERS_FLOG_FLAY.map { |num| "y#{num}" }
							results.each { |curr_hw| html.td curr_hw }
						}

						data.each do |student_name, hw_results|
							html.tr {
								html.td student_name.split('_').first
								html.td student_name.split('_').last
								hw_results.each { |cur_result| html.td cur_result }
							}
						end
					}
				}
			}
		end

		File.open("results_Dimitar_Terziev_A_6.html","w") do |file| 
			file.write(html_results.to_html)
		end
	end
end
