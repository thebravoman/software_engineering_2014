
require 'csv'
class TaskParser 
	
	attr_accessor :results, :number_of_requests, :hnine, :dir_name
    	@results = Hash.new
    	@number_of_requests
    	@hnine = Hash.new
    	@dir_name = Hash.new
  
    def initialize()
        @results = Hash.new
        @number_of_requests = 0
        @hnine = Hash.new
        @dir_name = Hash.new
    end
    
 	def vhodno(input_array, time)
		@number_of_requests += 1
		input_array.each do |e|
			el = e.split("/").last
        	first_name = e.split("/").last.split("_")[0].to_s
        	last_name = e.split("/").last.split("_")[1].to_s
        	name = "#{first_name.to_s.capitalize} #{last_name.to_s.capitalize}"
        	log = `git log --until=#{time} #{e}`
        	log_after = `git log --after=#{time} #{e}`
            if results[name] == nil and last_name != ""
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
      	end              
	end
	
    def parseDir(input_array, time)
        @number_of_requests += 1
        input_array.each do |e|
        	first_name = e.split("/").last.split("_")[0]
        	last_name = e.split("/").last.split("_")[1]
        	name = "#{first_name.to_s.capitalize} #{last_name.to_s.capitalize}"
        	if dir_name.has_key?(name)
        		next
        	else
        		dir_name[name] = 0
        	end
        	log = `git log --until=#{time} #{e}`
        	log_after = `git log --after=#{time} #{e}`
        	if !results.has_key?(name)
        		if results[name] != nil
                	currentUserFiles = results[name]
                	currentUserFiles << 0
                	results[name] = currentUserFiles
            	else
                	results[name] = []
                	results[name] << 0
            	end
        	end
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
        dir_name.clear               
        results.keys.each do |i| 
           	if results[i].length < number_of_requests
               	results[i] << 0
            end         
        end      
    end
     
    def nine(input_array, time)	
    	@number_of_requests += 1
		csv_contents = CSV.read(ARGV[0] + "class009_homework/project_to_names.csv")
		csv_contents.shift
		csv_contents.each do |row|
 			if hnine[row[0]] != nil
				currentUserFiles = hnine[row[0]]
				currentUserFiles << row[1]
				hnine[row[0]] = currentUserFiles
			else
				hnine[row[0]] = []
				hnine[row[0]] << row[1]
			end
		end	  	
		input_array.each do |e|
			el = e.split("/").last
        	log1 = `git log --until=#{time} -- #{e}`
        	log1_after = `git log --after=#{time} -- #{e}`
        	team = el.split(".").first
      		n = (hnine.values_at(team)).flatten
			n.each do |el|
	 			if  el != nil
		   			if !log1.empty? 
		        		if results[el] != nil
		           			currentUserFiles = results[el]
		            		currentUserFiles << 2
		            		results[el] = currentUserFiles
		        		else
		            		results[el] = []
		            		results[el] << 2
		        		end
		    		end
		    		if !log1_after.empty? and log1.empty?    
		        		if results[el] != nil
		         			currentUserFiles = results[el]
		            		currentUserFiles << 1
		            		results[el] = currentUserFiles
		       	 		else
				        	results[el] = []
				        	results[el] << 1
				    	end    
			   		end
					if log1_after.empty? and log1.empty?
				    	if results[el] != nil
				        	currentUserFiles = results[el]
				        	currentUserFiles << 0
				        	results[el] = currentUserFiles
				    	else
				        	results[el] = []
				        	results[el] << 0
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
       	CSV.open("results_Krassen_Angelov_A_14.csv", "w") do |csv| 
      		csv << ["Program name", "VH" ,"002", "003", "004", "009", "012"].flatten        
       		results.each do |key, value|
            	csv << [key,value].flatten
   		 	end
 		end
 	end
 	
end

a = TaskParser.new
a.vhodno(Dir.glob(ARGV[0] + "vhodno_nivo/*"), "Sep-17-2014-20:00:00")
a.parseDir(Dir.glob(ARGV[0] + "class002_homework/*.rb"), "Sep-22-2014-20:00:00")
a.parseDir(Dir.glob(ARGV[0] + "class003_homework/*.rb"), "Sep-24-2014-20:00:00")
a.parseDir(Dir.glob(ARGV[0] + "class004/*.rb"), "Sep-29-2014-20:00:00")
a.nine(Dir.glob(ARGV[0] + "class009_homework/**/*.pdf"), "Oct-17-2014-20:00:00")
a.parseDir(Dir.glob(ARGV[0] + "class012_homework/*.rb"), "Nov-10-2014-20:00:00")
a.toCSV()
