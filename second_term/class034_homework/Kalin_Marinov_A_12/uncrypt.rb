class Uncrypt

	def initialize params
		crypted = set_values params
		puts uncrypt(crypted)
	end

	private

	def set_values params
		@keys ||= {}		
		*crypted, @keys[:hp_k], @keys[:pv_k] = params.map!(&:to_i)
		crypted
	end

	def uncrypt crypted
		"".tap { |message| crypted.each { |byte| message.concat(byte**@keys[:pv_k] % @keys[:hp_k]).chr } }
	end

end
