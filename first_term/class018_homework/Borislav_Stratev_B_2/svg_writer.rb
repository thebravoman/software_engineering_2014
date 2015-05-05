require 'SVG/Graph/Bar'

class SVGWriter
	def write h,t
		File.open("results_Borislav_Stratev_B_2.svg","w") do |svg|
			a = Array.new
			i = 0
			data = Array.new
			fields = %w(Vh 2 3 4 9 12 14 15 16 17_1 17_2 18);
			
			for j in 0..11
				i = 0
				h.each do |k,v|
					a[i] = v[j]
					i = i + 1
				end

				data[j] = (a.count("1") + a.count("2")).to_i
			end

			graph = SVG::Graph::Bar.new(:height => 300, :width =>  500, :fields => fields)
			graph.add_data(:data => data, :title => "results_Ivo_Stratev_B_16.svg")
			
			svg << graph.burn
			svg.close
		end
	end
end
