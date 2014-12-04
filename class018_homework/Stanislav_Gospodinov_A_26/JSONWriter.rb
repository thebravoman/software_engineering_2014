require 'json'

class JSONWriter
	def write(list, timer)
		File.open("result_Stanislav_Gospodinov_26.json","w") do |f|
  			f.write(list.to_json)
		end
	end
end