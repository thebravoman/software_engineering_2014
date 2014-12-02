require 'json'

class JSONWriter
	
    def write (results, end_time)
      a = ["Entry    ", "Class2   ", "Class3   ", "Class4   ", "Class9   ", "Class12  ", "Class14  ", "Class15  ", "Class17_1", "Class17_2", "g2       ", "g3       ", "g4       ","g12      ", "g14      ", "g15      ", "g17_1    ", "g17_2    ", "y2       ", "y3       ", "y4       ", "y12      ", "y14      ", "y15      ", "y17_1    ", "y17_2    "]
       File.open("results_Ivelin_Slavchev_A_10.json", "w") do |file|
       		file.write (end_time)
       		file.write "\n"
       		file.write "\n"
            results.sort.each do |key,  value| 
                file.write (key.to_s)
                file.write "\n"
                for i in 0..25 do
                    file << a[i].to_s + " => " + value[i].to_s
                    file.write "\n"
                end
                file.write "\n"
            end
        end
	end

end
