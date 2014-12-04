require 'csv'

class CSVWriter
  def write files
    CSV.open("results.csv", "w") do |csv|
      files.each do |element|
        csv << [element]
      end
    end
  end
end