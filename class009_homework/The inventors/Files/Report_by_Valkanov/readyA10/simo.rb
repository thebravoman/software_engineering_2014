#Simeon_Shopkin_23_56a835.rb
require 'csv'
arr = Array.new
Dir.glob(ARGV[0]+"/*.rb") do |first_files|	
    Dir.glob(ARGV[1]+"/*.rb") do |second_files|
	first_files = first_files.split("/").last.split(".").first.split("_")
	if first_files.size != 3
	    if first_files != second_files
		print_count = first_files.split("/").last.split(".").first	
		p = print_count.size.to_s
		print = first_files[0].capitalize+"_"+first_files[1].capitalize+"_"+first_files[2]+","+p
		arr.push(print)
	    end
	end	
    end
end	
CSV.open("result.csv","w") do |csv|
    arr.sort.each do |element|
	csv << [element]
    end
end

#many mistakes
#the program isn't even close to the given condition
#working code
=begin
require 'csv'
hash = Hash.new
Dir.glob("#{ARGV[0]}*").each do |path|
    first_name = path.split("/").last.split("_").first
    last_name = path.split("/").last.split("_", 2).last.split("_").first
    digit = path.split("/").last.split("_", 2).last.split("_").last.split(".").first
    name = path.split("/").last
    if name.include? "_" then counter = name.count "_" end
	if (counter != 2) || (digit.to_i.to_s != digit)
	    l = name.length
	    hash[name] = l
	end
    end
end
    Dir.glob("#{ARGV[1]}*").each do |path|
    first_name = path.split("/").last.split("_").first
    last_name = path.split("/").last.split("_", 2).last.split("_").first
    digit = path.split("/").last.split("_", 2).last.split("_").last.split(".").first
    name = path.split("/").last
    if name.include? "_" then counter = name.count "_" end
	if (counter != 2) || (digit.to_i.to_s != digit)
	    l = name.length
	    hash[name] = l
	end
    end	
    end
CSV.open("result.csv", "w") do |csv|
    hash.sort_by{ |k, v| v}.each do |name, length|
	csv << ["#{name}","#{length}"]
    end
end


=end