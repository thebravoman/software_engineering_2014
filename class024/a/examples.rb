require "net/http"
require "uri"

class Examples

	def get_site_content url_string
		uri = URI.parse(url_string)
		response = Net::HTTP.get_response(uri)
		File.open("result.html","w") do |file|	
			file.write response.body
		end
	end
	
	def format_current_time
		t = Time.now
		t.strftime("%d/%m/%Y")
	end
	
end
