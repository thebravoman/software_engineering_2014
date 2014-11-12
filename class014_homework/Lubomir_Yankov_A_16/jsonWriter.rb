require 'json'

class JSONWriter
	
    def write results
    
        arr = ["Entry   ", "Class002", "Class003", "Class004", "Class009", "Class012"]
        File.open("results_Lubomir_Yankov_A_16.json", "w") do |f|
            
            results.sort.each do |key,  value| 
            
                f.write key.to_s
                f.write "\n"
            
                for i in 0..5 do
            
                    f << arr[i].to_s + " => " + value[i].to_s
                    f.write "\n"
            
                end
            
                f.write "\n"
            end

        end

	end

end