list = Hash.new
arr=[]
p=0
for i in 0..1
	q=0
	CSV.foreach("#{ARGV[0]}/task.csv") do |word|
		list.each do |check|
			if word == check
				arr[p]==word
				p+=1
			end
		end
		list[q] = word
		q+=1
		
	end
end

list = Hash[list.sort_by{|fn,ln| fn}.reverse]

File.open("result.html","w") do |file|
	file.write("<html>\n<ul>")
    arr.each do |names|
        file.write("\t<li>"+"#{names}"+"</li>\n")
    end
    file.write("</ul>\n</html>s")
end 
