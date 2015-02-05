require "./part"

class SubtitlesParser

	def initialize content
		@content = content
	end
	
	def transcript 
		transcripts = []
		get_parts.each { |part| transcripts << part.transcript }
		transcripts.join(" ")
	end
	
	private
	def get_parts
		#[p1,p2,p3]
		result =[]
		@content.split("\n\n").each { |c| result << Part.new(c) }
		result
	end
	
end
