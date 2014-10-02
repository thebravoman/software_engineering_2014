Dir.glob(ARGV[0] + "*.rb") do |script_file|
	Dir.glob(ARGV[1] + "*") do |fixture|
		name = script_file.split('/').last
		fix = fixture.split('/').last
		klas = name.split('.').first.split('_').last.to_i
		if klas == 2
			if File.exist?("#{fixture}/expected_results2.csv")
				system = `ruby #{script_file} #{fixture}`
				expected = File.open("#{fixture}/expected_results2.csv","r")
				expected_read = expected.read
					if system.eql?(expected_read)
						p "#{name} works for #{fix}"
					else
						p "#{name} doesn't work for #{fix}"
					end
				expected.close
			end
		end
	end
end
