require 'csv'
class TaskParser 
	
	attr_accessor :result, :num, :alt, :chk_name
    	@result = Hash.new
    	@num
    	@alt = Hash.new
    	@chk_name = Hash.new
  
    def initialize()
        @result = Hash.new
        @num = 0
        @alt = Hash.new
        @chk_name = Hash.new
    end
    
 	def entry(input_array, time)
		@num += 1
		input_array.each do |e|
			el = e.split("/").last
        	first_name = e.split("/").last.split("_")[0].to_s
        	last_name = e.split("/").last.split("_")[1].to_s
        	name = "#{first_name.to_s.capitalize} #{last_name.to_s.capitalize}"
        	log = `git log --until=#{time} #{e}`
        	log_after = `git log --after=#{time} #{e}`
            if result[name] == nil and last_name != ""
            	if !log.empty?
            		if result[name] != nil     
               			cur = result[name]
                		cur << 2
                		result[name] = cur
            		else
                		result[name] = []
                		result[name] << 2        
            		end
        		end     
        		if !log_after.empty? and log.empty?                 
            		if result[name] != nil
                		cur = result[name]
                		cur << 1
                		result[name] = cur
            		else
                		result[name] = []
                		result[name] << 1
            		end             
       			end 
        		if log_after.empty? and log.empty?
            		if result[name] != nil
                		cur = result[name]
                		cur << 0
                		result[name] = cur
            		else
                		result[name] = []
                		result[name] << 0
            		end
        		end 
      		end
      	end              
	end
	
    def parse(input_array, time)
        @num += 1
        input_array.each do |e|
        	first_name = e.split("/").last.split("_")[0]
        	last_name = e.split("/").last.split("_")[1]
        	name = "#{first_name.to_s.capitalize} #{last_name.to_s.capitalize}"
        	if chk_name.has_key?(name)
        		next
        	else
        		chk_name[name] = 0
        	end
        	log = `git log --until=#{time} #{e}`
        	log_after = `git log --after=#{time} #{e}`
        	if !result.has_key?(name)
        		if result[name] != nil
                	cur = result[name]
                	cur << 0
                	result[name] = cur
            	else
                	result[name] = []
                	result[name] << 0
            	end
        	end
       	 	if !log.empty?
            	if result[name] != nil     
               		cur = result[name]
                	cur << 2
                	result[name] = cur
            	else
                	result[name] = []
                	result[name] << 2        
            	end
        	end     
        	if !log_after.empty? and log.empty?                 
            	if result[name] != nil
                	cur = result[name]
                	cur << 1
                	result[name] = cur
            	else
                	result[name] = []
                	result[name] << 1
            	end             
       		end 
        	if log_after.empty? and log.empty?
            	if result[name] != nil
                	cur = result[name]
                	cur << 0
                	result[name] = cur
            	else
                	result[name] = []
                	result[name] << 0
            	end
        	end 
        end  
        chk_name.clear               
        result.keys.each do |i| 
           	if result[i].length < num
               	result[i] << 0
            end         
        end      
    end
     
    def report(input_array, time)	
    	@num += 1
		content = CSV.read(ARGV[0] + "class009_homework/project_to_names.csv")
		content.shift
		content.each do |col|
 			if alt[col[0]] != nil
				cur = alt[col[0]]
				cur << col[1]
				alt[col[0]] = cur
			else
				alt[col[0]] = []
				alt[col[0]] << col[1]
			end
		end	  	
		input_array.each do |e|
			el = e.split("/").last
        	log = `git log --until=#{time} -- #{e}`
        	log_after = `git log --after=#{time} -- #{e}`
        	team = el.split(".").first
      		n = (alt.values_at(team)).flatten
			n.each do |el|
	 			if  el != nil
		   			if !log.empty? 
		        		if result[el] != nil
		           			cur = result[el]
		            		cur << 2
		            		result[el] = cur
		        		else
		            		result[el] = []
		            		result[el] << 2
		        		end
		    		end
		    		if !log_after.empty? and log.empty?    
		        		if result[el] != nil
		         			cur = result[el]
		            		cur << 1
		            		result[el] = cur
		       	 		else
				        	result[el] = []
				        	result[el] << 1
				    	end    
			   		end
					if log_after.empty? and log.empty?
				    	if result[el] != nil
				        	cur = result[el]
				        	cur << 0
				        	result[el] = cur
				    	else
				        	result[el] = []
				        	result[el] << 0
				    	end
		    		end
		    	end
        	end
		end
		result.keys.each do |i| 
           	if result[i].length < num
               	result[i] << 0
            end         
        end
	end

  	def write()    
       	CSV.open("results_Ivelin_Slavchev_A_10.csv", "w") do |csv| 
      		csv << ["Program name", "VH" ,"002", "003", "004", "009", "012"].flatten        
       		result.each do |key, value|
            	csv << [key,value].flatten
   		 	end
 		end
 	end
 	
end

a = TaskParser.new
a.entry(Dir.glob(ARGV[0] + "vhodno_nivo/*"), "Sep-17-2014-20:00:00")
a.parse(Dir.glob(ARGV[0] + "class002_homework/*.rb"), "Sep-22-2014-20:00:00")
a.parse(Dir.glob(ARGV[0] + "class003_homework/*.rb"), "Sep-24-2014-20:00:00")
a.parse(Dir.glob(ARGV[0] + "class004/*.rb"), "Sep-29-2014-20:00:00")
a.report(Dir.glob(ARGV[0] + "class009_homework/**/*.pdf"), "Oct-17-2014-20:00:00")
a.parse(Dir.glob(ARGV[0] + "class012_homework/*.rb"), "Nov-10-2014-20:00:00")
a.write()
