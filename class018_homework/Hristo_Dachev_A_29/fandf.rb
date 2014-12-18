# __     ________ _      _      ______          __  _____     _______ _  __           
# \ \   / /  ____| |    | |    / __ \ \        / / |  __ \ /\|__   __| |/ /    /\     
#  \ \_/ /| |__  | |    | |   | |  | \ \  /\  / /  | |__) /  \  | |  | ' /    /  \    
#   \   / |  __| | |    | |   | |  | |\ \/  \/ /   |  ___/ /\ \ | |  |  <    / /\ \   
#    | |  | |____| |____| |___| |__| | \  /\  /    | |  / ____ \| |  | . \  / ____ \  
#    |_|  |______|______|______\____/   \/  \/     |_| /_/    \_\_|  |_|\_\/_/    \_\

require_relative 'split.rb'

class Fandf
	def flog file, hwNum, results
		flogResult = `flog #{file} -c -q -s`.split(":").first
		numCase(hwNum, file, 'g', flogResult, results)
	end

	def flay file, hwNum, results
		flayResult = `flay #{file}`.split("\n").first.scan(/\d+/).first
		numCase(hwNum, file, 'y', flayResult, results)
	end

	def numCase hwNum, file, yOrG, result, results
		split = Split.new
		results[split.split(file)]["#{yOrG}#{hwNum.to_i.to_s}"] = result
	end
end
