
class HTMLWriter
	def write result
		File.open("result.html","w") do |file|
			file.puts "<html>"
			file.puts "<head></head>"
			file.puts "<body>"
				result.sort_by{|key,val| val}.each do |element|
					file.puts element
				end
			file.puts "</body>"
			file.puts "</html>"
		end
	end
end
