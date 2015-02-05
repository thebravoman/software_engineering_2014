require "./part"

class SubtitlesParser

	def initialize content
		@content = content
	end
	
	def transcript 
		content1 = @content.split("\n\n")[0]
		content2 = @content.split("\n\n")[1]
		
		part1 = Part.new(content1)
		part2 = Part.new(content2)
		part1.transcript + " " + part2.transcript
	end
end
