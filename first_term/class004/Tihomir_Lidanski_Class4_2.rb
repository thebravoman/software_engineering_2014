hash = Hash.new{|name, tasks| name[tasks] = Array.new}
Folder=ARGV[0]

Dir.glob("#{Folder}**/*.*") do |file|
  
  firstName = file.split("/").last.split("_").first
	lastName = file.split("/").last.split("_", 2).last.split("_").first
	taskNumber = file.split("_").last.split(".").first
  if taskNumber.to_i >= 2 and taskNumber.to_i <= 18
  hash[firstName.capitalize + " " + lastName.capitalize] << taskNumber.to_i
  
  end
  
  
end

hash.sort.each do |name, tasks|
	print "#{name},"
	sum = 0
	tasks.sort.each do |x|
	print "#{x},"
	sum += x.to_i
	
	end
puts sum

end