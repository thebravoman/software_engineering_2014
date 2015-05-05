Check = Hash.new{|id, exercise| id[exercise] = Array.new}
    Dir.glob("#{ARGV[0]}/**/*.*") do |file|

        data = file.split("/").last
        first = data.split("_").first.capitalize
        last = data.split("_", 2).last.split("_").first.capitalize
        number = data.split("_").last.split(".").first
        type = file.split(".").last
	if ['c','cpp','py','html','rb','java'].include? type
		if data.scan('_').count == 2
			if number.to_i > 1 and number.to_i < 19

Check["#{first} #{last}"] << number.to_i
			end
		end
	end
end
Check.sort.each do |id, exercise|
    result = 0
    exercise = exercise.sort.uniq
    exercise.each do |vesko|
    result += vesko.to_i
end
puts "#{id}" + "," + exercise.join(",") + "," + result.to_s
end
