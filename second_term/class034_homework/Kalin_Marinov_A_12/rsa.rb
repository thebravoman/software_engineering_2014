require './generate'
require './crypt'
require	'./uncrypt'

class Cryptor
	def self.rsa_ruby
		mode, *params = ARGV

		case mode
		when "generate" then Generate.new
		when "crypt"		then Crypt.new params
		when "uncrypt"  then Uncrypt.new params
		else puts "Unvalid input"
		end
	end
end

Cryptor.rsa_ruby
