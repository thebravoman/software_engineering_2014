class JSONWriter
	def write(results)
		json = File.open("003f7cb7.json", "w")
		json.puts("{")
		results.keys.sort_by{|key, val| key}.reverse.each do |key|
			json.puts("\t\"#{key}\":\"#{results[key]}\"")
		end
		json.puts("}")
		json.close
	end
end
