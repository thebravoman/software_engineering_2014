require "./part"

class SubtitlesParser

	def initialize content
		@content = content
		@parts =[]
		@content.split("\n\n").each { |c| @parts << Part.new(c) }
	end

	def move part, timems
		get_parts[part-1..-1].each do |part|
			part.move timems
		end
	end
	
	def to_html_paragraphs ms
		previous = get_parts.first
		
		result = ["<p>", previous.transcript]
		
		1.upto(get_parts.length-1) do |index|
			current = get_parts[index]
			diff = current.start - previous.finish
			result << ((diff < ms) ?	" " : "</p><p>")
			result << current.transcript
			previous = current
		end
		result << "</p>"
		result.join
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
