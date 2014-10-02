x = ""
Dir.glob(ARGV[0]+"*.rb") do |script|	
	Dir.glob(ARGV[1]+"*") do |fixture|
		name = script.split(/\//).last.split(".").first
		fixtures = fixture.split("/").last
		name1 = name.split("_").first 
		name2 = name.split("_",2).last.split("_").first	
		

		if name.split("_").last == "2"
			if File.exist?("#{fixture}/expected_results2.csv")
				file = File.open("#{fixture}/expected_results2.csv","r")
				puts "#{name1} #{name2} against #{fixtures}"
				output = `ruby #{script} #{fixture}`
				
				
				file.close
				
			end
		end
	end
end
