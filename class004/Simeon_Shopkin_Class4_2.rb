hm_cheker = Hash.new{|hash, key| hash[key] = []}
path=ARGV[0]
	Dir.glob("#{path}/**/*.*") do |mine_file|
		mine_file1 = mine_file.split("/").last.split(".").first.split("_")
		taskchek = mine_file.split("_").last.split(".").first
		if (taskchek.to_i<19 and taskchek.to_i>1)
			if mine_file1.size == 3
				mine_file1[2] = mine_file1[2].gsub(/[^\d]/, '')
				person = mine_file1[0].capitalize+" "+mine_file1[1].capitalize
				if hm_cheker[person].nil?
					hm_cheker[person] = mine_file1[2].to_s
				else
					hm_cheker[person] <<  taskchek.to_i
				end
			end
		end
	end
	hm_cheker.sort.each{|name,task|
		sum = 0
		task = task.sort!.uniq
		task.each do |x|		
			sum+=x		
		end
		puts "#{name},#{task.join(",")},#{sum}"
	}

		


