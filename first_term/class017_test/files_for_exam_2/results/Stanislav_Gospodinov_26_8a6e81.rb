arr =Array.new 
i=0
Dir.glob("#{ARGV[0]}*.#{ARGV[1]}") do |file|
	filename = file.split('/').last.split('.').first;
		if filename.split('_').length == 3
			if filename.split('_').last.to_i.odd?  
				arr[i]=file.split('/').last
				i+=1;
			end
		end

end
arr.sort
	xml = File.open("result_Stanislav_Gospodinov_26.xml", "w")
		xml.puts("<odd_result>")
		arr.each do |element|
			xml.puts("	<file>#{element}</file>")
		end
		xml.puts("</odd_result")
	xml.close