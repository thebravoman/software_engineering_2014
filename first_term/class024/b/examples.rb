require "net/http"
require "uri"

class Examples
	
	def get_index_page
		
		uri = URI.parse("http://lubo.elsys-bg.org/")
		# Shortcut
		response = Net::HTTP.get_response(uri)
		File.open("result.html","w") do |file|
			file.write(response.body)
		end
	end
	
	def format_current_time
		t = Time.now
		t.strftime("%d/%m/%Y")
	end
	
end
