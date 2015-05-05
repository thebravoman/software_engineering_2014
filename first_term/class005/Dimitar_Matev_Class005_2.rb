Dir.glob(ARGV[0]+"class004/*.rb") do |script|	
	Dir.glob(ARGV[0]+"class004_homework/*/*") do |fixture|
		result = `ruby #{script} #{fixture}`
		f = File.open("#{ARGV[0]}"+ "class004_homework/*/expected_results.csv", "r")
		if result == f 
			puts "#{script} WORKS WITH #{fixture}"
		else 
			puts "#{script} WORKS WITH #{fixture}"
		end
	end
end
# siguren sum che ne raboti.Komputura mi ne iskash da runne tozi skript i improvizirah
