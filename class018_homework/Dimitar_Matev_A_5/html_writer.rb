require 'markaby'

class HTMLWriter

	def write names, name_of_folder, folder_names
		mb = Markaby::Builder.new
		mb.html do
			head { title "Results" }
			body {
				tag! :table, :border => "1", :style => "text-align:center;", :cellpadding => "5" do
					tr {
						folder_names.each { |name|	td { name } }
					}
					names.each do |key, value|
						tr {
							td{ key.split(" ").first }
							td{ key.split(" ").last }
							value.each { |number| td { number } }
						} 	
					end
					
				end
			}
		end

		File.open(name_of_folder + ".html","w") do |html| 
			html.write(mb.to_s)
		end
	end

end


