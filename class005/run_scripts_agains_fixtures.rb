Dir.glob(ARGV[0]+"*.rb").each do |script_file|
	Dir.glob(ARGV[1]+"*").each do |fixture|
		p "#{script_file} against #{fixture}"
		result = system "ruby #{script_file} #{fixture}"
		p result
		if result != true 
			exit 1
		end
	end
end

