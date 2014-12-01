require 'markaby'

class HTMLWriter

	def write (results, end_time)
		fileHtml = File.new("results_Ivelin_Slavchev_A_10.html", "w")
		mab = Markaby::Builder.new
		mab.html do
			head { title "Statistics" }
			body do
				table do
					tr do
						th end_time
						th "    " 
						th "VH  "
						th "    "
						th "002 "
						th "    "
						th "003 "
						th "    "   
						th "004 "
						th "    "
						th "009 "
						th "    "
						th "012 "
						th "    "
						th "014 "
						th "    "
						th "015 "
						th "    "
						th "017_1 "
						th "    "
						th "017_2 "
						th "    "
						th "g2  "
						th "    "
						th "g3  "
						th "    "   
						th "g4  "
						th "    "
						th "g12 "
						th "    "
						th "g14 "
						th "    "
						th "g15 "
						th "    "
						th "g17_1 "
						th "    "
						th "g17_2 "
						th "    "
						th "y2  "
						th "    "
						th "y3  "
						th "    "   
						th "y4  "
						th "    "
						th "y12 "
						th "    "
						th "y14 "
						th "    "
						th "y15 "
						th "    "
						th "y17_1 "
						th "    "
						th "y17_2 "
						th "    "
						results.sort.each do |key, value|
							tr do
								first = key.split(' ')[0]
								last = key.split(' ')[1]
								td first
								td last
								for i in 0..25
									td value[i]
									td " |"
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
