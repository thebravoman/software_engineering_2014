require 'json'

class JSONWriter
	
    def write results
        a = ["Entry   ", "Class002", "Class003", "Class004", "Class009", "Class012"]
        File.open("results_Ivelin_Slavchev_A_10.json", "w") do |file|
            results.sort.each do |key,  value| 
                file.write key.to_s
                file.write "\n"
                for i in 0..5 do
                    file << a[i].to_s + " => " + value[i].to_s
                    file.write "\n"
                end
                file.write "\n"
            end
        end
	end

end