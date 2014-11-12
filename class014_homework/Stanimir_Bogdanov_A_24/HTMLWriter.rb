class HTMLWriter
	def write data
		html_results = Nokogiri::HTML::Builder.new do |html|
		html.html{
			html.head{
				html.title "Results"
			}
			html.body{
				html.table{
					html.tr{
						html.td ""
						html.td ""
						html.td "VH"
						html.td "002"
						html.td "003"
						html.td "004"
						html.td "009"
						html.td "012"
					}
					data.each{|key, value|
						html.tr{
							html.td key.split('_').first
							html.td key.split('_').last
							html.td value[0]
							html.td value[1]
							html.td value[2]
							html.td value[3]
							html.td value[4]
							html.td value[5]
						}
					}
				}
			}
		}
		end
		File.open("results_Stanimir_Bogdanov_A_24.html","w"){ |file| 
			file.write(html_results.to_html)
		}
	end
end
