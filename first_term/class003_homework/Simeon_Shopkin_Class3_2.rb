HM_Cheker = Hash.new
path=ARGV[0]
	Dir.glob("#{path}*.*") do |mine_file|
		mine_file = mine_file.split("/").last.split(".").first.split("_")
		if mine_file.size == 3
			mine_file[2] = mine_file[2].gsub(/[^\d]/, '')
			person = mine_file[0]+" "+mine_file[1]
			if HM_Cheker[person].nil?
				HM_Cheker[person] = mine_file[2].to_s
			else
				HM_Cheker[person] = HM_Cheker[person] + "," + mine_file[2].to_s
			end
		end
	end
HM_Cheker.each{|name,task|
	sum=0
	task = task.split(",").uniq
	task.each{|v| sum+=v.to_i}
	task = task.join(",")
	puts name+","+task+","+sum.to_s
}
