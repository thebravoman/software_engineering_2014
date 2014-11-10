require 'csv'

path = ARGV[0]
count = 0
programs = Array.new
students = Array.new


students = [
["Atanaska","Ivancheva"],["Borislav","Rusinov"],["Borislav","Stratev"],
["David","Georgiev"],["Denis","Stoinev"],["Denis","Trenchev"],["Dimitar","Andreev"],
["Dimitar","Matev"],["Dimitar","Nestorov"],["Dimitar","Terziev"],["Elena","Karakoleva"],
["Emiliqn","Sokolov"],["Georgi","Ivanov"],["Georgi","Velev"],["Gergan","Nikolov"],
["Hristiyan","Dodov"],["Hristiyan","Velyakov"],["Hristo","Dachev"],["Iliyan","Germanov"],
["Iosyf","Saleh"],["Ivailo","Ivanov"],["Ivelin","Slavchev"],["Ivo","Stratev"],["Ivo","Valchev"],
["Kalin","Marinov"],["Kaloyan","Nikov"],["Kamena","Dacheva"],["Konstantin","Kostov"],
["Konstantin","Vekilski"],["Krassen","Angelov"],["Kristina","Pironkova"],["Lili","Kokalova"],
["Lubomir","Yankov"],["Marian","Belchev"],["Martin","Grigorov"],["Mladen","Karadimov"],["Momchil","Angelov"],
["Moretti","Georgiev"],["Nikola","Marinov"],["Nikolay","Mihailov"],["Petko","Bozhinov"],["Radoslav","Kostadinov"],
["Simeon","Shopkin"],["Stanimir","Bogdanov"],["Stanislav","Gospodinov"],["Stanislav","Iliev"],["Stanislav","Valkanov"],
["Stefan","Iliev"],["Stefan","Radev"],["Tihomir","Lidanski"],["Valentin","Georgiev"],["Valentin","Varbanov"],
["Vanya","Santeva"],["Vasil","Kolev"],["Velislav","Kostov"],["Veselin","Dechev"],["Veselina","Kolova"],
["Vladimir","Yordanov"]
]

programs = ["/software_engineering_2014/vhodno_nivo","/software_engineering_2014/class002_homework",
"/software_engineering_2014/class003_homework","/software_engineering_2014/class004",
"/software_engineering_2014/class009_homework","/software_engineering_2014/class012_homework"]

students.each do |student|	
#Checking Input

ishere = false
count = 0
 Dir.glob("#{ARGV[0]}#{programs[0]}/*/*.*") do |file|
	file_name = file.split("/").last
	file_name = file_name.split("_")

	
		if (student[0] == file_name[0] && student[1] == file_name[1])
			count+=1
				if count == 3
			 student << "1"
			 ishere = true
		end
	end
	end
	
	if ishere == false
		student << "0"
	end

#Checking class002
ishere = false
count = 0
 Dir.glob("#{ARGV[0]}#{programs[1]}/*.*") do |file|
	file_name = file.split("/").last
	file_name = file_name.split("_")

	
		if (student[0] == file_name[0] && student[1] == file_name[1] && count == 0)
			 student << "1"
			 ishere = true
			 count +=1
		end
	end
	
	if ishere == false
		student << "0"
	end

#Checking oo3
	ishere = false
	count = 0
	Dir.glob("#{ARGV[0]}#{programs[2]}/*.*") do |file|
		file_name = file.split("/").last
		file_name = file_name.split("_")
			`git log --until=Sep-24-2014-20:00:00 -- #{file}`
		if (student[0] == file_name[0] && student[1] == file_name[1] && count == 0 )
			student << "1"
			ishere = true
			count+=1
		end
	end
	
	if ishere == false
		student << "0"
	end

	#Checking 004
	ishere = false
	count = 0
	Dir.glob("#{ARGV[0]}#{programs[3]}/*.*") do |file|
		file_name = file.split("/").last
		file_name = file_name.split("_")

	
		if (student[0] == file_name[0] && student[1] == file_name[1] && count == 0 )
			student << "1"
			ishere = true
			count+=1
		end
	end
	
	if ishere == false
		student << "0"
	end

#Checking 012
	ishere = false
	count = 0
	Dir.glob("#{ARGV[0]}#{programs[5]}/*.*") do |file|
		file_name = file.split("/").last
		file_name = file_name.split("_")

	
		if (student[0] == file_name[0] && student[1] == file_name[1] && count == 0 )
			student << "1"
			ishere = true
			count+=1
		end
	end
	
	if ishere == false
		student << "0"
	end

end




CSV.open("results_Momchil_Angelov_A_18.csv", "w") do |csv|
students.each do |element|
	csv << element
end

end