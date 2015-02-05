class Part
	
	def initialize content
		@content = content
	end
	
	def transcript
		@content.split("\n")[2..-1].join(" ")
	end
	
end
