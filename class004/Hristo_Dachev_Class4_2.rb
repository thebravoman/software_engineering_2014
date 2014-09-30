student = Hash.new{ |name, programs| name[programs] = []}
Dir.glob("#{ARGV[0]}/*.*") do |my_file|
  name = my_file.split("/").last.split("_").first
  last_name = my_file.split("/").last.split("_", 2).last.split("_").first
  number = my_file.split("_").last.split(".").first
  if number.to_i.to_s == number 
    if number.to_i>=2 && number.to_i<=18
      if !name.empty? && !last_name.empty?
        student[name.capitalize + " " + last_name.capitalize] << number.to_i
      end
    end
  end
end
student.sort.each do |name, programs|
  sum = 0
  print "#{name},"
  programs.uniq.sort.each do |num|
    print num
    print ","
    sum += num
  end
  puts sum
end
