require "csv"

def isOnTime(file, deadline)
	log = `git log --until=#{deadline} #{file}`
	return (log.empty?) ? 1 : 2
end

def initStudent()
	tmp = Hash.new
	
	HOMEWORKS.each do |hw, v|
		tmp[hw] = 0
	end
	
	FLOG.each do |flog, v|
		tmp[flog] = 0
	end
	
	FLAY.each do |flay, v|
		tmp[flay] = 0
	end
	
	return tmp
end

def calculateFlog(file, homework)
	tmp = 0
	if homework.to_i >= 14 && homework != "017-1"
		tmp = `flog #{file.chomp("#{file.split(/\//).last}")}`
	else
		tmp = `flog #{file}`
	end
	tmp = tmp.to_s.split("\n").first.to_i
	return (tmp != nil) ? tmp : 0
end

def calculateFlay(results, name)
	return `echo \"#{results}\" | grep #{name} | wc -l`.to_i
end

def parseNames(file)
	tmp = CSV.read(file)
	hash = Hash.new
	tmp.each do |team, name|
		hash[name] = team
	end
	hash.delete("Student Name")
	return hash
end
