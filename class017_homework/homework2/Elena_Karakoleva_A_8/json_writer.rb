require 'json'
class JSONWriter
	def write results, time
		time1 = {"Program time" => time}
		File.open("results_Elena_Karakoleva_A_8.json","w") do |f|
		f.write JSON.generate(time1)
			results.keys.sort!.each do |key,val|
		tempHash = {
		
			"Student Name" => "#{key}",
			"result" => {
			"VH" => results["#{key}"][0],
			"002" => results["#{key}"][1],
			"003" => results["#{key}"][2],
			"004" => results["#{key}"][3],
			"009" => results["#{key}"][4],
			"012" => results["#{key}"][5],
			"014" => results["#{key}"][6],
			"017/1" => results["#{key}"][7],
			"017/2" => results["#{key}"][8],
			#flog
			"g2" => results["#{key}"][9],
			"g3" => results["#{key}"][10],
			"g4" => results["#{key}"][11],
			"g9" => results["#{key}"][12],
			"g12" => results["#{key}"][13],
			"g14" => results["#{key}"][14],
			"g17/1" => results["#{key}"][15],
			"g17/2" => results["#{key}"][16],
			#flay
			"y2" => results["#{key}"][17],
			"y3" => results["#{key}"][18],
			"y4" => results["#{key}"][19],
			"y9" => results["#{key}"][20],
			"y12" => results["#{key}"][21],
			"y14" => results["#{key}"][22],
			"y17/1" => results["#{key}"][23],
			"y17/2" => results["#{key}"][24]
			}
}
f.write(JSON.pretty_generate(tempHash))

		end
	end
   end
end

