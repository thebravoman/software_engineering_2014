#Doesnt work 4 row
Dir.glob(ARGV[0]+"*2.rb") do |script_file|    
    Dir.glob("#{ARGV[1]}*") do |fixture|
        g = File.read("#{fixture}"+"/expected_results2.csv")
        puts"#{script_file.split("/").last.split(".").first} against #{fixture}"
        system ("ruby #{script_file} #{fixture}")
        p output
        if p == g
        truei += 1
        else
        falsei += 1
        end
    end
end
puts "True are" + "#{truei}"
puts "False are" + "#{falsei}"
