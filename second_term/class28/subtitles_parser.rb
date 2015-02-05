class SubtitlesParser

	def initialize content
		@content = content
	end
	
	def transcript
		@content.split("\n")[3]
	end
	
end
