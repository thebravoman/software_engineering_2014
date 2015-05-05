class XMLWriter
    def write_out(results)
        output = File.open("results_Velislav_Kostov_B_7.xml", "w")
        #output.puts "<?xml version="1.0"" "encoding="UTF-8"?>"
        results.each_pair do |key, value|
            output.puts "<result>"
            output.puts "\t<first_name> #{key.split(/\_/).first} </first_name>"
            output.puts "\t<last_name> #{key.split(/\_/).last} </last_name>"
            output.puts "\t<result_sequence> #{value[0]}, #{value[1]}, #{value[2]}, #{value[3]}, #{value[4]}, #{value[5]} </result_sequence>"
            output.puts "</result>"
        end
    end
end
