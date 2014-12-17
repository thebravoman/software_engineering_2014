# __     ________ _      _      ______          __  _____     _______ _  __           
# \ \   / /  ____| |    | |    / __ \ \        / / |  __ \ /\|__   __| |/ /    /\     
#  \ \_/ /| |__  | |    | |   | |  | \ \  /\  / /  | |__) /  \  | |  | ' /    /  \    
#   \   / |  __| | |    | |   | |  | |\ \/  \/ /   |  ___/ /\ \ | |  |  <    / /\ \   
#    | |  | |____| |____| |___| |__| | \  /\  /    | |  / ____ \| |  | . \  / ____ \  
#    |_|  |______|______|______\____/   \/  \/     |_| /_/    \_\_|  |_|\_\/_/    \_\

require_relative 'split.rb'
require_relative 'fandf.rb'

class Check
	def checkHW folder, hwNum, deadline, results
		puts "Checking homework #{hwNum} ..."
		hwNum != "VH" ? path = "#{folder}/**/*_*_*_*.rb" : path = "#{folder}/**/*_*_*.*"
		Dir.glob(path) do |file|
			split = Split.new
			results[split.split(file)][hwNum] = checkTime(file, deadline)
			if hwNum != "VH"
				ff = Fandf.new
				ff.flog(file, hwNum, results)
				ff.flay(file, hwNum, results)
			end
		end
		puts "Homework #{hwNum} checked!"
	end

	def check009 folder, hwNum, deadline, results
		puts "Checking homework #{hwNum}"
		teams = Hash.new
		split = Split.new
		split.splitTeamNames(teams, folder)

		Dir.glob("#{folder}/*.pdf") do |file|
			fileTeamName = file.split('/').last.split('.').first.tr("'", '')
			if teams.key? fileTeamName
				teams[fileTeamName].each do |student|
					results[student][hwNum] = checkTime(file, deadline)
				end
			end
		end
		puts "Homework #{hwNum} checked!"
	end

	def checkTime path, deadline
		return `git log --until=#{deadline} #{path}`.empty? ? 1 : 2
	end
end