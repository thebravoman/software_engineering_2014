h = Hash.new {|h, k| h[k] = [0,0,0,0,0,0]}
Dir.glob("#{ARGV[0]}"'*/*').each do |we|
	dir = we.split("2014/").last
	folder = dir.split("/").first
	file = dir.split("/").last
	if file.scan(/./)[0].capitalize == file.scan(/./)[0]
		if folder=="vhodno_nivo"
			if (file.split("_")[1] != nil)
				first = file.split("_")[0]
				second = file.split("_")[1]
				file = first+'_'+second
				h[file][0] = 1
			end
		end
		if folder =="class002_homework"
			if (file.split("_")[1] != nil)
				first = file.split("_")[0]
				second = file.split("_")[1]
				file = first+'_'+second
				h[file][1] = 1
			end
		end
		if folder == "class003_homework"
			if (file.split("_")[1] != nil)
				first = file.split("_")[0]
				second = file.split("_")[1]
				file = first+'_'+second 
				h[file][2] = 1
			end
		end
		if folder == "class004_homework"
			if (file.split("_")[1] != nil)
				first = file.split("_")[0]
				second = file.split("_")[1]
				file = first+'_'+second
				h[file][3] = 1
			end
		end
		if folder == "class009_homework"
			#insert shit here if you forget to to so!
			#if (file.split("_")[1] != nil)
			#	first = file.split("_")[0]
			#	second = file.split("_")[1]
			#	file = first+'_'+second
			#	h[file][4] = 1
			#end
		end
		if folder == "class012_homework"
			if (file.split("_")[1] != nil)
				first = file.split("_")[0]
				second = file.split("_")[1]
				file = first+'_'+second
				h[file][5] = 1
			end
		end
	end
end

require 'csv'
CSV.open("results_Vasil_Kolev_B_6.csv", "w") do |csv|
	csv << ["","","VH","002","003","004","009","012"]
	a = h.sort
	a.each do |element|
		b = element[0].split("_").first, element[0].split("_").last, element[1][0].to_s, element[1][1].to_s, element[1][2].to_s, element[1][3].to_s, element[1][4].to_s, element[1][5].to_s
		puts b
		csv << b
	end
end
