require 'yaml'

class KeyGenerator 
	@p
	@q	

	def initialize p, q
		abort("KeyGenerator can be initialized only with prime numbers!") unless is_prime? p and is_prime? q
		@p = p
		@q = q
	end

	def generate
		keys = {}
		keys["n"] = @p * @q

		fi = (@p - 1) * (@q - 1)

		begin
			keys["e"] = rand 2..fi - 1
		end while not are_coprime? keys["e"], fi

		keys["d"] = 0
		begin
			keys["d"] += 1
		end while (keys["e"] * keys["d"]) % fi != 1

		keys
	end

	def self.save_keys_to_file filename, keys
		if File.exists? filename
			puts "Error: File '#{filename}' already exists!"
			return
		end
		File.open(filename, 'w') {|file| file.write keys.to_yaml}
		puts "Keys generated successfully and saved in '#{filename}'"
	end

	def self.load_keys_from_file path_to_file
		return "File does not exists!" if not File.file? path_to_file
		YAML.load_file path_to_file
	end
private
	def is_prime? num
		for del in 2..num / 2
			return false if num % del == 0 
		end 
		return true
	end

	def are_coprime? a, b		
		while b != 0 do
			temp = b
			b = a % temp
			a = temp
		end
		return a > 1 ? false : true
	end
end
