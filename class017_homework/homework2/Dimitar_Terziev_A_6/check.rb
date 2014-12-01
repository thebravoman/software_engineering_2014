class Check
  @@flog_flay_index = 0
  def check_entry_level data, value_to_write
      acceptable_extensions = [ '.c', '.cpp', '.cc', '.rb', '.py', '.java', '.html', '.js', '.pas' ]
      hash = Hash.new { |hash, student_name| hash[student_name] = Array.new }

      Dir.glob("vhodno_nivo/**/*.*") do |file|
        first_name, last_name, problem_num = file.gsub(/.*\/|\..*/, '').split('_')

        if acceptable_extensions.include?(File.extname(file)) && (Integer(problem_num) rescue false)
          problem_num = problem_num.to_i
          unless first_name.empty? || last_name.empty? || !problem_num.between?(2,18)
            full_name = first_name.capitalize + '_' + last_name.capitalize
            hash[full_name] << problem_num unless hash[full_name].include? problem_num
          end
        end
    end

    case value_to_write
      when 1
        hash.each { |name, problems| problems.size >= 3 ? data[name][0] = 1 : data[name][0] = 0 }
      when 2
        hash.each { |name, problems| data[name][0] = 2 if problems.size >= 3 }
    end
  end

  def check_folder folder_path, data, folder_number, filename_format, value_to_write
  	@@flog_flay_index+=1
    Dir.glob("#{folder_path}**/*.*") do |file_path|
      filename = file_path.split('/').last

      if filename =~ filename_format
        first_name, last_name = filename.split('_')
        full_name = first_name + '_' + last_name
        data[full_name][folder_number] = value_to_write
        if value_to_write == 1 # Run flay and flog on the latest versions
          flog_output = `flog #{file_path} 2> /dev/null` # Ignore the standard error
          flog_value_index_in_results = TOTAL_HOMEWORKS + @@flog_flay_index#+ HOMEWORK_NUMBERS_FLOG_FLAY.index(cur_hw_number)

          if $?.to_i == 0
            flog_value = flog_output.split("\n").first.split(':').first.gsub(' ', '')
            data[full_name][flog_value_index_in_results] = flog_value
          else
            data[full_name][flog_value_index_in_results] = "error"
          end

          flay_output = `flay #{file_path}`

          flay_value_index_in_results = TOTAL_HOMEWORKS + HOMEWORK_NUMBERS_FLOG_FLAY.size + @@flog_flay_index

          flay_value = flay_output.split("\n").first.match(/\d+/)

          data[full_name][flay_value_index_in_results] = flay_value
          # BUG: FLAY ENCOUNTERING AN ERROR -> the error code flay returns is 0 regardless of whether an error
          #     occurred or not, therefore I cannot do what I did with flog 
          #     Momchil's homework 12 does not compile and "error" gets written in the g12 column (flog), as expected
          #     this is not the case with flay, though - in the y12 column there is a 0
        end
      end
    end
  end
end
