# __     ________ _      _      ______          __  _____     _______ _  __           
# \ \   / /  ____| |    | |    / __ \ \        / / |  __ \ /\|__   __| |/ /    /\     
#  \ \_/ /| |__  | |    | |   | |  | \ \  /\  / /  | |__) /  \  | |  | ' /    /  \    
#   \   / |  __| | |    | |   | |  | |\ \/  \/ /   |  ___/ /\ \ | |  |  <    / /\ \   
#    | |  | |____| |____| |___| |__| | \  /\  /    | |  / ____ \| |  | . \  / ____ \  
#    |_|  |______|______|______\____/   \/  \/     |_| /_/    \_\_|  |_|\_\/_/    \_\

class Split
	def split file
		path 		= file.split('/').last
		firstName 	= path.split('_').first
		lastName 	= path.split('_', 2).last.split('_').first
		return fullName	= "#{firstName.capitalize} #{lastName.capitalize}"
	end

	def splitTeamNames teams, folder
		teamNames = File.read("#{ARGV[0]}/#{folder.split("../").last}project_to_names.csv")
		teamNames.split("\n").each do |line|
			split = line.split(',')
			splitFirst = split.first
			teams[splitFirst] = [] unless teams.key? splitFirst
			teams[splitFirst] << split.last
		end
		return teams
	end
end