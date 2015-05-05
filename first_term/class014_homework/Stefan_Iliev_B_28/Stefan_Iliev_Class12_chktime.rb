require 'date'
#Stefan Iliev waz hiar. #
#ruby chktime file_path time_limit point_penalty.#
#additional arguments: -help brings the help menu, -x accumulates the points lost for every late commit.
isPenaltyAccumulated = false


ARGV.each do |arg|
	if arg == "help" || arg == "-help" || arg == "--help" then
		p "Pass the path to file as the first argument and the time in the format YY:MM:DD:HH:MM or YYMMDDHHMM as the second."
		p "Third argument is optional. If the student made a commit on time but also commited after the time limit the float argument passed is removed from the return max result (1)."
		p "-x to accumulate lost points for every late commit."
		exit
	end
	if arg == "-x" then isPenaltyAccumulated = true end
end

filePath = ARGV.shift
timeLimit = ARGV.shift
#Year:Month:Day:Hour:Minute#

pointCut = ARGV.shift || "0"
pointCut = pointCut.to_f



timeLimit = timeLimit.tr(":",'').to_i 
timeLimit *= 10 ** (12 - timeLimit.to_s.length)
#Equalize timeLimit to match requirement in case it's not passed as required. (YY:MM:DD:HH:MM) (Two symbols per ':' after the first ':')#

dir = File.expand_path(File.dirname(__FILE__))
output = `git log #{dir}/#{filePath}`
commitTimes = Array.new() 
output.split("\n").each do |new_line|
	if new_line.include?("Date:")
		commitTimes.push(new_line.split("Date:").last)
	end
end
#Creates array with commit dates and times. ["Day_name","Month_name","Day_date","HH:MM:SS","Year","WTF_IS_THIS"]#

maxReward = 0.0
isRewardCut = false
isRewarded = false
pointsLost = 0.0

commitTimes.each do |time|
	year = time.split(" ")[4].to_s
	month = Date::ABBR_MONTHNAMES.index(time.split(" ")[1])
	if month.to_s.length < 2 then month = ("0" + month.to_s) end
	
	day = time.split(" ")[2].to_s
	if day.to_s.length < 2 then day = "0" + day.to_s end
	
	hour = time.split(" ")[3].split(":").first.to_s
	minute = time.split(" ")[3].split(":")[1].to_s
	
	#was throwing error so ... PLZ GOD THANK YOU FOR THE TO_S. Debugging plz, go away. :D:D // Potential bug *although the tests were successful* //#
	commitTime = year.to_s + month.to_s + day.to_s + hour.to_s + minute.to_s
	commitTime = commitTime.to_i
	
	if commitTime < timeLimit then isRewarded = true end
	if commitTime > timeLimit then 
		isRewardCut = true
		pointsLost += pointCut
	end
end
if isRewarded then maxReward += 1 end
if isRewardCut && !isPenaltyAccumulated then maxReward -= pointCut end
if isPenaltyAccumulated then maxReward -= pointsLost end
p maxReward.round(2)
