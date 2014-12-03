module Presentations
  def Presentations.presentation_names data, student_to_team, value_to_write, how_many_to_check
    checked_presentations = 0
    data.each do |student_name, results|
      file = "#{ARGV[0]}class009_homework/#{student_to_team[student_name]}.pdf"
      if student_to_team.key?(student_name) && File.exist?(file)
        checked_presentations += 1 #if value_to_write == 1
        break if checked_presentations >= how_many_to_check.to_i
        data[student_name][4] = value_to_write
      end
    end
  end

  def Presentations.csv_reading(student_to_team)
    CSV.foreach("#{ARGV[0]}class009_homework/project_to_names.csv") do |entry|
      team_name = entry.first
      student_name = entry.last.gsub(' ', '_')
      student_to_team[student_name] = team_name
    end
  end
end