list = Hash.new
sum = 0
tasks = ""
path = ARGV[0]
Dir.glob("#{path}*.*") do |file_name|
	data = file_name.split('/').last.split('.').first
	if(data.split('_').length > 2)
		name = data.split('_')[0] + "_" + data.split('_')[1]
		Dir.glob("#{path}#{name}*.*") do |data|
			if data.split('_').last.split('.').first.to_i < 19 and data.split('_').last.split('.').first.to_i > 1
				tasks = tasks + "," + data.split('_').last.split('.').first
			end
		end
		sum = 0
		tasks.split(',').each do |i|
			sum += i.to_i
		end
		tasks = tasks + "," + sum.to_s
		list["#{data.split('_')[0] + " " + data.split('_')[1]}"] = tasks
		tasks = ""
	end
end
list.each{ |k,v| puts "#{k}#{v}" }
