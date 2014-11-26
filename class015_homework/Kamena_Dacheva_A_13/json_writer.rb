require 'json'
class JSONWriter
	def write results, time
		time1 = {"Program time" => time}
		File.open("results_Kamena_Dacheva_A_13.json","w") do |f|
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
			"g2" => results["#{key}"][7],
			"g3" => results["#{key}"][8],
			"g4" => results["#{key}"][9],
			"g9" => results["#{key}"][10],
			"g12" => results["#{key}"][11],
			"g14" => results["#{key}"][12],
			"y2" => results["#{key}"][13],
			"y3" => results["#{key}"][14],
			"y4" => results["#{key}"][15],
			"y9" => results["#{key}"][16],
			"y12" => results["#{key}"][17],
			"y14" => results["#{key}"][18]
			}
}
f.write(JSON.pretty_generate(tempHash))

		end
	end
   end
end

