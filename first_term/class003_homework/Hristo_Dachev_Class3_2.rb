student = Hash.new("")
path = ARGV[0]


Dir.glob("#{path}*/*") do |my_file|
  name = my_file.split("/").last.split("_").first
  last_name = my_file.split("/").last.split("_", 2).last.split("_").first
  number = my_file.split("_").last.split(".").first

  student[name + " " + last_name] += number + ","
end

student.each do |name, program|
  sum = 0
  print "#{name}" + ","
  program.split(",").each do |a|
    sum += a.to_i
  end
  puts program + sum.to_s
end