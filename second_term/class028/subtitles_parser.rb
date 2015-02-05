require "./part"

class SubtitlesParser

	def initialize content
		@content = content
		@parts =[]
		@content.split("\n\n").each { |c| @parts << Part.new(c) }
	end

	def duration
		get_parts.last.finish
	end
	
	def transcript 
		transcripts = []
		get_parts.each { |part| transcripts << part.transcript }
		transcripts.join(" ")
	end
	
	private
	def get_parts
		@parts
	end
	
end
