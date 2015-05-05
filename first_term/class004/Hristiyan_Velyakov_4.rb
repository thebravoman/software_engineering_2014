Check = Hash.new("");
Folder = ARGV[0]
	Dir.glob("#{Folder}/*.*") do |names|

      first_name = names.split("/").last.split(/_/).first
	
    last_name = names.split("/").last.split(/_/, 2).last.split("_").first

  task = names.split("/").last.split("_").last.split(".").first

  Check[first_name + " " + last_name] += task + ","

	   end

   Check.sort.each do |key, value|
 
  sum = 0

   value.split(",").each do |x|

  sum += x.to_i

  end

  puts "#{key + "," + value + sum.to_s}"

  end
