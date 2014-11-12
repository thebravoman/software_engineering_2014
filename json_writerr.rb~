require 'json'
class JSONWriter
	def write results
File.open("results_Elena_Karakoleva_A_8.json","w+") do |f|
		results.keys.sort!.each do |key,val|
		tempHash = {

			"Student Name" => "#{key}",
			"result" => {
			"VH" => results["#{key}"][0],
			"002" => results["#{key}"][1],
			"003" => results["#{key}"][2],
			"004" => results["#{key}"][3],
			"009" => results["#{key}"][4],
			"012" => results["#{key}"][5]

			}
}

f.write(JSON.pretty_generate(tempHash))

		end

	end
   end
end

