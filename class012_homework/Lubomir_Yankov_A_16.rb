require 'csv'

def rnl(string)
	string.delete "\n"
end

class TaskParser
	
	attr_accessor :results, :number_of_requests, :teams, :dir_name_check
	@dir_name_check = Hash.new
	@teams = Hash.new
	@results = Hash.new
	@number_of_requests
	
	def initialize()
		@dir_name_check = Hash.new
		@teams = Hash.new
		@results = Hash.new
		@number_of_requests = 0
	end

	def parseEntryDir(input_array, time)

		@number_of_requests += 1

		input_array.each do |e|

			first_name = e.split('/').last.split('_')[0].to_s
			last_name = e.split('/').last.split('_')[1].to_s

			name = "#{first_name.to_s.capitalize} #{last_name.to_s.capitalize}"

			log = `git log --until=#{time} -- #{e}`
			log_after = `git log --after=#{time} -- #{e}`

			if !last_name.empty?

				if !results.has_key? name

					if !log.empty?
						if results[name] != nil
							currentUserFiles = results[name]
							currentUserFiles << 2
							results[name] = currentUserFiles
						else
							results[name] = []
							results[name] << 2
						end
					end
				
					if !log_after.empty? and log.empty?
							
						if results[name] != nil
							currentUserFiles = results[name]
							currentUserFiles << 1
							results[name] = currentUserFiles
						else
							results[name] = []
							results[name] << 1
						end
					 	
					end

					if log_after.empty? and log.empty?
				 		if results[name] != nil
							currentUserFiles = results[name]
							currentUserFiles << 0
							results[name] = currentUserFiles
						else
							results[name] = []
							results[name] << 0
						end
					end
				end


				results.keys.each do |i|

				 	if results[i].length < number_of_requests
				 		results[i] << 0
				 	end
			 	
			 	end
			end
	
		end

	end

	def parseDir(input_array, time)

		@number_of_requests += 1

		input_array.each do |e|

			first_name = e.split('/').last.split('_')[0]
			last_name = e.split('/').last.split('_')[1]

			name = "#{first_name.to_s.capitalize} #{last_name.to_s.capitalize}"

			if dir_name_check.has_key? name
				next
			else
				dir_name_check[name] = 0
			end

			if !results.has_key? name

				if results[name] != nil
					currentUserFiles = results[name]
					currentUserFiles << 0
					results[name] = currentUserFiles
				else
					results[name] = []
					results[name] << 0
				end

			end

			log = `git log --until=#{time} -- #{e}`
			log_after = `git log --after=#{time} -- #{e}`

			if !log.empty?
				if results[name] != nil
					currentUserFiles = results[name]
					currentUserFiles << 2
					results[name] = currentUserFiles
				else
					results[name] = []
					results[name] << 2
				end
			end
		
			if !log_after.empty? and log.empty?
					
				if results[name] != nil
					currentUserFiles = results[name]
					currentUserFiles << 1
					results[name] = currentUserFiles
				else
					results[name] = []
					results[name] << 1
				end
			 	
			end

			if log_after.empty? and log.empty?
		 		if results[name] != nil
					currentUserFiles = results[name]
					currentUserFiles << 0
					results[name] = currentUserFiles
				else
					results[name] = []
					results[name] << 0
				end
			end
		
		end 		
		
		dir_name_check.clear

		 results.keys.each do |i|

		 	if results[i].length < number_of_requests
		 		results[i] << 0
		 	end
		 
		 end
	  
	end

	def parsePresentationDir(input_array, time)

		@number_of_requests += 1

		csv_contents = CSV.read(ARGV[0] + "class009_homework/project_to_names.csv")
	 	
	 	csv_contents.shift
	 	
	 	csv_contents.each do |row|
		 	
		 	if teams[row[0]] != nil
				currentUserFiles = teams[row[0]]
				currentUserFiles << row[1]
				teams[row[0]] = currentUserFiles
			else
				teams[row[0]] = []
				teams[row[0]] << row[1]
			end
	 	
	 	end

		input_array.each do |e|

			log = `git log --until=#{time} -- #{e}`
			log_after = `git log --after=#{time} -- #{e}`

			team_name = e.split("/").last.split(".").first

			if !log.empty?

				creator_names = (teams.values_at(team_name)).flatten

				creator_names.each do |s|

					if s == nil
						next
					else

						if results[s] != nil
							currentUserFiles = results[s]
							currentUserFiles << 2
							results[s] = currentUserFiles
						else
							results[s] = []
							results[s] << 2
						end

					end
				
				end

			end

			if log.empty? and !log_after.empty?

				creator_names = (teams.values_at(team_name)).flatten

				creator_names.each do |s|

					if s == nil
						next
					else

						if results[s] != nil
							currentUserFiles = results[s]
							currentUserFiles << 1
							results[s] = currentUserFiles
						else
							results[s] = []
							results[s] << 1
						end

					end
				
				end

			end

			if log.empty? and log_after.empty?

				creator_names = (teams.values_at(team_name)).flatten

				creator_names.each do |s|

					if s == nil
						next
					else

						if results[s] != nil
							currentUserFiles = results[s]
							currentUserFiles << 0
							results[s] = currentUserFiles
						else
							results[s] = []
							results[s] << 0
						end

					end
				
				end

			end

		end

		results.keys.each do |i|

		 	if results[i].length < number_of_requests
		 		results[i] << 0
		 	end
		 
		 end

	end
	
	def toCSV()

		results.keys.each do |i|

		 	if results[i].length < number_of_requests
		 		results[i] << 0
		 	end
		
		end

		CSV.open("results_Lubomir_Yankov_A_16.csv", "w") do |csv|

			csv << ["Program name", "VH" ,"002", "003", "004" , "009", "012"].flatten
			
			results.sort.each do |key, value|
				csv << [key,value].flatten
			end
	
		end
	
	end
	
end



a = TaskParser.new
a.parseEntryDir(Dir.glob(ARGV[0] + "vhodno_nivo/*"), "Sep-17-2014-20:00:00")
a.parseDir(Dir.glob(ARGV[0] + "class002_homework/*.rb"), "Sep-22-2014-20:00:00")
a.parseDir(Dir.glob(ARGV[0] + "class003_homework/*.rb"), "Sep-24-2014-20:00:00")
a.parseDir(Dir.glob(ARGV[0] + "class004/*.rb"), "Sep-29-2014-20:00:00")
a.parsePresentationDir(Dir.glob(ARGV[0] + "class009_homework/**/*.pdf"), "Oct-29-2014-20:00:00")
a.parseDir(Dir.glob(ARGV[0] + "class012_homework/*.rb"), "Nov-10-2014-20:00:00")
a.toCSV()
