require 'markaby'

class HTMLWriter
	
	def write (results)
		fileHtml = File.new("results_Ivelin_Slavchev_A_10.html", "w+")
		mab = Markaby::Builder.new
		mab.html do
			head { title "Statistics" }
			body do
				table do
					tr do
						th "Student name"
						th "VH"
						th "002"
						th "003"   
						th "004"
						th "009"
						th "012"
						results.sort.each do |key, value|
							tr do
							td key
								for i in 0..5
								td value[i]
								end
							end
						end
					end
				end
			end
		fileHtml.puts mab
		end
	end

end