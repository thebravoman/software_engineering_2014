Dir.glob(ARGV[0]+"*.rb") do |script_file|
	Dir.glob(ARGV[1]+"*") do |fixture|
		p "#{script_file} #{fixture}"
		system("ruby #{script_file} #{fixture}")
	end
end


