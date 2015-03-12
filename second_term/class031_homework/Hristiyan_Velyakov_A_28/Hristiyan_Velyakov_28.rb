require 'active_support/core_ext/string'
arr1=Array.new
arr2=Array.new
path=ARGV[0]
	if	path.to_s.empty?
		puts "You have to give directory"
	end
	Dir.glob("#{path}/*.*").each do |files|	
	arr1<<files.split("/").last.split(".").first
	end	
Dir.glob("#{path}/*.*").each do |files|	
	#arr1<<files.split("/").last.split(".").first
	File.open("#{files}","r") do |content|
		arr2=content.read.split("\s")
		counter=0
		arr2.each do |haha|
			arr1.each do |haha1|
				if (haha.casecmp(haha1)==0)
					 arr2=arr2.to_s.gsub(haha,"<a href=\"#{haha}.html\">#{haha}</a>")		# <a href="haha.html">haha</a>
			 	elsif (haha.singularize.casecmp(haha1)==0)
			 		haha.pluralize
			 		arr2=arr2.to_s.gsub(haha,"<a href=\"#{haha}.html\">#{haha}</a>")
				end	
			end	
		end
		arr2=arr2.to_s.split("[").last.split("]").first
		arr2=arr2.to_s.gsub! /,/,''
end
File.open("#{files}","w+") do |file|
		arr2=arr2.to_s.gsub! /"/, ''
		file.write arr2
	end	
end
	