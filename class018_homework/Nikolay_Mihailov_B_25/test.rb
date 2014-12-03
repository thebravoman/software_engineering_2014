require 'yaml'
YAML.load_file("info.yml")["homeworks"].each do |yaml|
puts yaml[3]
end
