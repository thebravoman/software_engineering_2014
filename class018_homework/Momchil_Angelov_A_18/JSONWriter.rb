require 'json'

class JSONWriter
	def write(list, timer)
		File.open("result_Momchil_Angelov_18.json","w") do |f|
  			f.write(list.to_json)
		end
	end
end