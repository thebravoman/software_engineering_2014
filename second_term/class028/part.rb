require 'time'

class Part
	
	def initialize content
		@content = content
	end
	
	def move timems
		parse_time if @start == nil
		@start+=timems
		@finish+=timems
	end
	
	def start
		parse_time if @start == nil
		@start
	end
	
	def finish
		parse_time if @finish == nil
		@finish
	end
	
	def transcript
		get_lines[2..-1].join(" ")
	end
	
	private 
	
	def parse_time
		line = get_lines[1]
		time_line = line.split(" --> ")
		@start = time_to_milliseconds time_line.first
		@finish = time_to_milliseconds time_line.last
	end
	
	def get_lines
		@lines ||= @content.split("\n")
	end
	
	def time_to_milliseconds as_string
		t = Time.parse(as_string)
		t.usec/1000+t.sec*1000+t.min*60*1000+t.hour*60*60*1000
	end
	
end	
