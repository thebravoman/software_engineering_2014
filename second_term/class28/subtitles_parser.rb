require "./part"

class SubtitlesParser

	def initialize content
		@content = content
	end
	
	def transcript 
		parts = get_parts
		result = ""
		parts.each do |part|
			result += part.transcript
			result += " " if part != parts.last
		end
		result
	end
	
	private
	def get_parts
		#[p1,p2,p3]
		result =[]
		@content.split("\n\n").each do |content|
			result << Part.new(content)
		end
		result
	end
	
end
