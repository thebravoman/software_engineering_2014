require 'time'
class Part
	
	def initialize content
		@content = content
	end

	def finish
	#~ 00:41:00,957 --> 00:41:07,457
		line = @content.split("\n")[1]
		finish_as_string = line.split(" --> ").last
		#~ 00:41:07,457
		time_to_milliseconds finish_as_string
	end
	
	def transcript
		@content.split("\n")[2..-1].join(" ")
	end
	
	private 
	def time_to_milliseconds as_string
		t = Time.parse(as_string)
		t.usec/1000+t.sec*1000+t.min*60*1000+t.hour*60*60*1000
	end
end

#~ is a -> Part .. SubtitlesParser - > inheritance
#~ 
#~ Part is a SubtitlesParser 
#~ 
#~ has a -> SubtilesParser .. Part -> composition
