class Part
	
	def initialize content
		@content = content
	end

	def finish
	#~ 00:41:00,957 --> 00:41:07,457
		line = @content.split("\n")[1]
		finish_as_string = line.split(" --> ").last
		#~ 00:41:07,457
		ms = finish_as_string.split(",").last.to_i
		ms += finish_as_string.split(",").first.split(":").last.to_i*1000
		ms += finish_as_string.split(":")[1].to_i*1000*60
		ms += finish_as_string.split(":")[0].to_i*1000*60*60
		ms
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
