class Crypt

	def initialize params
		set_keys params
		message = params.first
		p crypt(message)
	end

	private

	def set_keys params
		@keys ||= {}
		@keys[:hp_k] = params[1].to_i
		@keys[:pb_k] = params[2].to_i
	end

	def crypt message
		[].tap { |crypted| message.bytes { |byte| crypted.push byte**@keys[:pb_k] % @keys[:hp_k] } }
	end

end
