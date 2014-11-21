#require writers here
require_relative 'csv_writer'
require_relative 'html_writer'
require_relative 'xml_writer'
require_relative 'json_writer'
require_relative 'svg_writer'
class HWChecker
    @@names_team_result
    @@start = 0
    @@duration = 0
    @@entry_point = Dir.getwd
    @@final_result = Hash.new(Array.new)
    @@args = []
    def initialize(args)
        @@args = args
        @@names_team_result = load_data(@@args[0] + "class009_homework/project_to_names.csv")
        @@start = Time.now
    end
    
    def load_data path
        #Load names and teamnames
        file = File.open(path, "r")
        data = Hash.new(Array.new)
        file.each do |line|
            names = line.split(/\,/).last.split(/\s/).first.chomp + "_" + line.split(/\,/).last.split(/\s/).last.chomp
            data[names] = [line.split(/\,/).first]
        end
        #Remove example (1-st row of csv)
        data.delete("Student_Name")
        return data
    end
    
    #Caller makes sure filename exists in current dir
    def flog_score filename
        score = `flog #{filename}`
        return score.to_i
    end
    
    #Caller makes sure filename exists in current dir
    def flay_count filename
        count = `flay #{filename}|grep #{filename}|wc -l`
        return count.chomp.to_i
    end
    
    #[0]Wheter the file is missing = 0/late = 1/ok = 2, [1] = flog, [2] = flay
    def status? deadline, filename, detailed
        return [0,0,0] if !File.exists?(filename)
        flog_res = 0
        flay_res = 0
        if detailed == true
            flog_res = flog_score(filename)
            flay_res = flay_count(filename)
        end
        var = `git log --until=#{deadline} -- #{filename}`
        if !var.empty?
            return [2,flog_res,flay_res]
        else
            return [1,flog_res,flay_res]
        end
    end
    
    #File status in directory according to rel_filename, based on detailed, file_format and file_count
    def file_stat? dir, deadline, rel_filename, detailed, file_format, file_count
        count = 0
        Dir.chdir(ARGV[0] + dir)
        Dir.glob(ARGV[0] + dir + "**/#{file_format}") do |file|
            if file.include?(rel_filename)
                count += 1 
                return status?(deadline, file, detailed) if count == file_count
            end
        end
        return [0,0,0]
    end
    
    def sort_stats stat, results, flogs, flays
        results << stat[0] if results != nil
        flogs << stat[1] if flogs != nil
        flays << stat[2] if flays != nil
    end
    
    def start()
        @@names_team_result.each_pair do |key, v|
            results = []
            flogs = []
            flays = []
            sort_stats(file_stat?("vhodno_nivo/", "22.09.2014:20:00:00", key, false, "*.*", 3), results, nil, nil)
            sort_stats(file_stat?("class002_homework/", "22.09.2014:20:00:00", key, true, "*_*_*_*.rb", 1), results, flogs, flays)
            sort_stats(file_stat?("class003_homework/", "24.09.2014:20:00:00", key, true, "*_*_*_*.rb", 1), results, flogs, flays)
            sort_stats(file_stat?("class004/", "29.09.2014:20:00:00", key, true, "*_*_*_*.rb", 1), results, flogs, flays)
            sort_stats(file_stat?("class009_homework/", "27.10.2014:20:00:00", v[0], false, "*.pdf", 1), results, nil, nil)
            sort_stats(file_stat?("class012_homework/", "10.11.2014:20:00:00", key, true, "*_*_*_*.rb", 1), results, flogs, flays)
            sort_stats(file_stat?("class014_homework/", "13.11.2014:06:00:00", key, true, "*_*_*_*.rb", 1), results, flogs, flays)
            @@names_team_result[key] = results.flatten + flogs.flatten + flays.flatten
        end
        @@duration = Time.now - @@start
        Dir.chdir(@@entry_point)
        writer = CSVWriter.new
        for i in 1..@@args.length - 2
            if (@@args[i] == "-o")
                p "Writing"
                case @@args[i + 1]
                when "csv"
                    writer = CSVWriter.new
                when "xml"
                    writer = XMLWriter.new
                when "html"
                    writer = HTMLWriter.new
                when "json"
                    writer = JSONWriter.new
                when "svg"
                    writer = SVGWriter.new
                end
            end
        end
        if(writer != nil)
            writer.write(@@names_team_result,[@@duration,"","VH", "002", "003", "004", "009", "012", "014", "g2", "g3", "g4", "g12", "g14", "y2", "y3", "y4", "y12", "y14"])
        end
    end
end
