require 'yaml'

hash = Hash[	"002" => "y2", 
				"003" => "y3", 
				"004" => "y4", 
				"012" => "y12", 
				"014" => "y14",
				"015" => "y15",
				"017-1" => "y17-1",
				"017-2" => "y17-2"]
puts hash.to_yaml
