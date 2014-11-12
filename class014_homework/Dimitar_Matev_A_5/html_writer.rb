require 'markaby'

class HTMLWriter

	def write names, name_of_folder
		mb = Markaby::Builder.new
		mb.html do
			head{title "Results"}
			body{
				table{
					tr{
						td{""}
						td{""}
						td{"VH"}
						td{"002"}
						td{"003"}
						td{"004"}
						td{"009"}
						td{"012"}
					}
					names.each do |key, value|
						tr{
							td{key.split(" ").first}
							td{key.split(" ").last}
							value.map { |var| var.nil? ? 0 : var }.map { |var| var.class == Array ? var[0] : var }.each{|el|
								td{el}
							}
						} 	
					end
					
				}
			}
		end
		File.open(name_of_folder + ".html","w"){ |file| 
			file.write(mb.to_s)
		}
	end

end


