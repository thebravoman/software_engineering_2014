require 'csv'
curr_dir = Dir.pwd
Dir.chdir(ARGV[0])
prob_hash = Hash.new
#method_definition
def entry_level_check(file_path, curr_folder_hash, pattern)
    Dir.glob("#{file_path}") do |my_file|
        file_str = "#{my_file}"
        condition_check = true
        if(pattern == /\A[^_]+_[^_]+_\d+\./ && !((2..18) === file_str.split('/').last.split('_').last.to_i))
            condition_check = false
        end
        if((file_str.split('/').last =~ pattern) && (condition_check) && !(file_str =~ /\~\Z/))
            name = file_str.split('/').last.sub('_',' ').split(/_/).first
            name.to_s unless name.is_a?String
            curr_folder_hash[name] = [] unless curr_folder_hash.key?(name)  
            curr_folder_hash[name].push(file_str.split('/').last.split('_').last.to_i)
        end
    end
    curr_folder_hash.each{|key,value|
        value.sort!.uniq!
    }
end
def homework_check(file_path, curr_folder_hash, pattern)
    Dir.glob("#{file_path}") do |my_file|
        file_str = "#{my_file}"
        if((file_str.split('/').last =~ pattern) && !(file_str =~ /\~\Z/))
            name = file_str.split('/').last.sub('_',' ').split(/_/).first
            curr_folder_hash[name] = []
        end
    end
end
def presentation_check(file_path, curr_folder_hash, pattern)
    Dir.glob("#{file_path}") do |my_file|
        file_str = "#{my_file}"
        if((file_str.split('/').last =~ pattern) && !(file_str =~ /\~\Z/))
            name = file_str.split('/').last.split('.').first
            curr_folder_hash[name] = []
        end
    end
end

#entry_level_works deadline:17 September 20:00
entry_level_hash = Hash.new
entry_level_check("vhodno_nivo/**/*", entry_level_hash, /\A[^_]+_[^_]+_\d+\./)
entry_level_hash.each{|key,value|
    prob_hash[key] = [] unless prob_hash.key?(key)
    if(value.size >= 3)
        prob_hash[key][0] = 1
    end
}
entry_level_hash.clear

#class2_works deadline:22 Септември 20:00
class_2_hash = Hash.new
homework_check("class002_homework/**/*", class_2_hash, /\A[^_]+_[^_]+_Class2_[12]\.rb/)
class_2_hash.each{|key,value|
    prob_hash[key] = [] unless prob_hash.key?(key)
    prob_hash[key][1] = 1
}
class_2_hash.clear

#class3_works deadline:24 September 20:00
class_3_hash = Hash.new
homework_check("class003_homework/**/*", class_3_hash, /\A[^_]+_[^_]+_Class3_[12]\.rb/)
class_3_hash.each{|key,value|
    prob_hash[key] = [] unless prob_hash.key?(key)
    prob_hash[key][2] = 1
}
class_3_hash.clear

#class4_works deadline:29 September 20:00
class_4_hash = Hash.new
homework_check("class004_homework/*_*", class_4_hash, /\A[^_]+_[^_]+/)
class_4_hash.each{|key,value|
    prob_hash[key] = [] unless prob_hash.key?(key)
    prob_hash[key][3] = 1
}
class_4_hash.clear

#class9_works deadline:27 October 20:00
presentation_csv = CSV.read("class009_homework/project_to_names.csv")
class_9_hash = Hash.new
presentation_check("class009_homework/**/*", class_9_hash, /\A.+\.pdf/)
temp = class_9_hash.dup
presentation_csv.each{|name|
	if class_9_hash.key?(name[0])
		class_9_hash[name[1]]=[]
	end
}
temp.each_key{|name|
	if class_9_hash.key?(name)
		class_9_hash.delete(name)
	end
}
class_9_hash.each{|key,value|
    prob_hash[key] = [] unless prob_hash.key?(key)
    prob_hash[key][4] = 1
}
class_9_hash.clear

#class12_works deadline:10 November 20:00
class_12_hash = Hash.new
homework_check("class012_homework/**/*", class_12_hash, /\A[^_]+_[^_]+_[AB]_\d+\.rb/)
class_12_hash.each{|key,value|
    prob_hash[key] = [] unless prob_hash.key?(key)
    prob_hash[key][5] = 1
}
class_12_hash.clear

#on-time_ckecks
system('git checkout `git rev-list -1 --before="Sep 17 2014 20:00" master` -q')
entry_level_check("vhodno_nivo/**/*",entry_level_hash, /\A[^_]+_[^_]+_\d+\./)
entry_level_hash.each{|key,value|
    prob_hash[key] = [] unless prob_hash.key?(key)
    if(value.size >= 3)
        prob_hash[key][0] = 2
    end
}
system('git checkout `git rev-list -1 --before="Sep 22 2014 20:00" master` -q')
homework_check("class002_homework/**/*", class_2_hash, /\A[^_]+_[^_]+_Class2_[12]\.rb/)
class_2_hash.each{|key,value|
    prob_hash[key] = [] unless prob_hash.key?(key)
    prob_hash[key][1] = 2
}
system('git checkout `git rev-list -1 --before="Sep 24 2014 20:00" master` -q')
homework_check("class003_homework/**/*", class_3_hash, /\A[^_]+_[^_]+_Class3_[12]\.rb/)
class_3_hash.each{|key,value|
    prob_hash[key] = [] unless prob_hash.key?(key)
    prob_hash[key][2] = 2
}
system('git checkout `git rev-list -1 --before="Sep 29 2014 20:00" master` -q')
homework_check("class004_homework/*_*", class_4_hash, /\A[^_]+_[^_]+/)
class_4_hash.each{|key,value|
    prob_hash[key] = [] unless prob_hash.key?(key)
    prob_hash[key][3] = 2
}
system('git checkout `git rev-list -1 --before="Oct 27 2014 20:00" master` -q')
presentation_check("class009_homework/**/*", class_9_hash, /\A.+\.pdf/)
temp = class_9_hash.dup
presentation_csv.each{|name|
	if class_9_hash.key?(name[0])
		class_9_hash[name[1]]=[]
	end
}
temp.each_key{|name|
	if class_9_hash.key?(name)
		class_9_hash.delete(name)
	end
}
class_9_hash.each{|key,value|
    prob_hash[key] = [] unless prob_hash.key?(key)
    prob_hash[key][4] = 2
}
system('git checkout `git rev-list -1 --before="Nov 10 2014 20:00" master` -q')
homework_check("class012_homework/**/*", class_12_hash, /\A[^_]+_[^_]+_[AB]_\d+\.rb/)
class_12_hash.each{|key,value|
    prob_hash[key] = [] unless prob_hash.key?(key)
    prob_hash[key][5] = 2
}

system("git checkout master -q")
#CSV_writing
#=begin
Dir.chdir(curr_dir)
CSV.open("results_Dimitar_Terziev_A_6.csv","w")do |csv|
    csv << ["", "" , "VH", "002", "003", "004", "009", "012"].flatten
    prob_hash.sort_by{|key,value|key}.each{|key, value|
        0.upto(5){|counter|
            value[counter] = 0 if value[counter].nil?
        }
        csv << [key.split(' ').first, key.split(' ').last, value[0], value[1], value[2], value[3], value[4], value[5]]
    }
end
#=end
