class Part
	
	def initialize content
		@content = content
	end
	
	def transcript
		@content.split("\n")[2..-1].join(" ")
	end
	
end

#~ is a -> Part .. SubtitlesParser - > inheritance
#~ 
#~ Part is a SubtitlesParser 
#~ 
#~ has a -> SubtilesParser .. Part -> composition
