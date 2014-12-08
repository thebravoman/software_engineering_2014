require "csv"

def isOnTime(file, deadline)
	log = `git log --until=#{deadline} #{file} 2>/dev/null`
	return (log.empty?) ? 1 : 2
end

def initStudent()
	tmp = Hash.new
	
	HOMEWORKS.each do |hw, v|
		tmp[hw] = 0
	end
	
	FLOG.each do |k, flog|
		tmp[flog] = '-'
	end
	
	FLAY.each do |k, flay|
		tmp[flay] = '-'
	end
	
	return tmp
end

def calculateFlog(file, homework)
	tmp = 0
	if homework.to_i >= 14 && homework != "017-1"
		tmp = `flog #{file.chomp("#{file.split(/\//).last}")} 2>/dev/null`
	else
		tmp = `flog #{file} 2>/dev/null`
	end
	tmp = tmp.to_s.split("\n").first.to_i
	return (tmp != nil) ? tmp : 0
end

def calculateFlay(results, name)
	return `echo \"#{results}\" | grep #{name} | wc -l 2>/dev/null`.to_i
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
