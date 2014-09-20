list = Hash.new
sum = 0
tasks = ""
Dir.glob("/home/stanislav/Desktop/github/software_engineering_2014/vhodno_nivo/*.*") do |file_name|
	data = file_name.split('/').last.split('.').first
	name = data.split('_')[0] + "_" + data.split('_')[1]
	Dir.glob("/home/stanislav/Desktop/github/software_engineering_2014/vhodno_nivo/#{name}*.*") do |data|
		tasks = tasks + "," + data.split('_').last.split('.').first
	end
	sum = 0
	tasks.split(',').each do |i|
  	sum += i.to_i
	end
	tasks = tasks + "," + sum.to_s
	list["#{data.split('_')[0] + " " + data.split('_')[1]}"] = tasks
	tasks = ""
end
list.each{ |k,v| puts "#{k}#{v}" }
