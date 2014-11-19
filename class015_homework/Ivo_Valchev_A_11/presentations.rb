module Presentations
  def Presentations.presentation_names data, student_to_team, value_to_write
    data.each do |student_name, results|
      file = "#{ARGV[0]}class009_homework/#{student_to_team[student_name]}.pdf"
      data[student_name][4] = value_to_write if student_to_team.key?(student_name) && File.exist?(file)
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