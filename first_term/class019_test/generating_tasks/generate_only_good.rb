#Run this script to generate only good tasks
#run program 'folder with generating scripts' 'folder to put expects and results'
def is_good? dir_name
	good = [
		"Borislav_Stratev_2_B",
		"Denis_Stoinev_13_B",
		"Emiliqn_Sokolov_15_B",
		"Hristiyan_Velyakov_28_A",
		"Iliyan_Germanov_17_B",
		"Ivelin_Slavchev_10_A",
		"Ivo_Stratev_16_B",
		"Kaloyan_Nikov_19_B",
		"Krassen_Angelov_14_A",
		"Lubomir_Yankov_16_A",
		"Martin_Grigorov_23_B",
		"Momchil_Angelov_18_A",
		"Stanislav_Gospodinov_26_A",
		"Stanislav_Iliev_26_B",
		"Stefan_Iliev_B_28",
		"Valentin_Varbanov_B_4",
		"Vanya_Santeva_5_B",
	"Veselin_Dechev_2_A",
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

#~ while files.size>0
	#~ files = files.shuffle
	#~ file = files.pop
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
		where_to_copy = ARGV[1]
		p "cd #{dir} && ruby #{file} #{params}"
		`cd #{dir} && ruby #{file} #{params}`
		`cd #{dir} && cp expects/* #{where_to_copy}/expects`
		`cd #{dir} && cp tasks/*  #{where_to_copy}/tasks/`
		`cd #{dir} && cp tests/* #{where_to_copy}/tests/`
	end
end
