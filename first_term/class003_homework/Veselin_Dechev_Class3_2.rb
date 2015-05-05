Check = Hash.new
    Dir.glob("#{ARGV[0]}/**/*.*") do |file|

	        data = file.split("\/")
            first = data.last.split("_").first
            last  = split("_", 2).last.split("_").first
            number = split("_").last.split(".").first

        Check["#{first} #{last}"] += number + ","
    end

Check.each do |id, exercise|
    result = 0
		exercise.split(",").each do |vesko|
			result += vesko.to_i
    end
        puts "#{id}" + "," + exercise + result.to_s
    end
gets
