#Run this script to generate only good tasks which are:
def is_good? dir_name
	good = [
		"Denis_Stoinev_13_B",
		"Iliyan_Germanov_17_B",
		"Ivailo_Ivanov_A_9",
		"Moretti_Georgiev_A_19",
		"Radoslav_Kostadinov_22_A",
		"Stanislav_Iliev_26_B",
		"Stefan_Iliev_B_28",
		"Vanya_Santeva_5_B"
	]
	good.each do |name|	
		if dir_name.include?(name)
			return true
		end
	end
	false
end

def clear_test_folders all_files
	all_files.each do |file|
		dir = File.dirname(file)
		`cd #{dir} && rm expects/* -rf && rm tasks/* -rf && rm tests/* -rf`
	end
end

files = Dir.glob("#{ARGV[0]}/*/generate.rb").to_a
numbers = (1..58).to_a
numbers = numbers.shuffle
clear_test_folders files

while numbers.size>0
	file = files.shuffle[0]
	dir = File.dirname(file)
	if(is_good? dir)
		params = numbers.pop(3)
		while params.size<3	
			params << params[0]
		end
		params = params.map(&:inspect).join(' ')
		file = file.split('/')[file.split('/').size-1]
		p "cd #{dir} && ruby #{file} #{params}"
		`cd #{dir} && ruby #{file} #{params} && cp expects/* /home/kireto/Desktop/expects && cp tests/* /home/kireto/Desktop/tests/ cp tasks/* /home/kireto/Desktop/tasks/`
	end
end
