student = Hash.new{ |name, programs| name[programs] = []}
Dir.glob("fixtures/*") do |my_file|
  name = my_file.split("/").last.split("_").first
  last_name = my_file.split("/").last.split("_", 2).last.split("_").first
  number = my_file.split("_").last.split(".").first
  if number.to_i.to_s == number then student[name.capitalize + " " + last_name.capitalize] << number.to_i end
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


#{ARGV[0]}/*.*