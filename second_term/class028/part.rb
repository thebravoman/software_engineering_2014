require 'time'
class Part
	
	def initialize content
		@content = content
	end

	def finish
		line = get_lines[1]
		finish_as_string = line.split(" --> ").last
		time_to_milliseconds finish_as_string
	end
	
	def transcript
		get_lines[2..-1].join(" ")
	end
	
	private 
	
	def get_lines
		@lines ||= @content.split("\n")
	end
	
	def time_to_milliseconds as_string
		t = Time.parse(as_string)
		t.usec/1000+t.sec*1000+t.min*60*1000+t.hour*60*60*1000
	end
	
end	
