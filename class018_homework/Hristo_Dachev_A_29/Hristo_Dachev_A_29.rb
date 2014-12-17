require 'yaml'
require_relative 'check.rb'
require_relative 'writers.rb'

if ARGV[1].nil? || ARGV[2].nil?
	abort "Run probram with \"ruby Hristo_Dacehv_A_29.rb repository -o result_extention\""
end
start 		= Time.now
puts "Timer started!"
config 		= YAML.load_file('config.yml')
results		= Hash.new {|hash, key| hash[key] = YAML.load_file('init.yml')}

config["deadlines"].each do |hw, deadline|
	path = ARGV[0] + config["folders"][hw]
	homework = Check.new
	case hw
		when '009'
			homework.check009(path, hw, deadline, results)
		when '017'
			homework.checkHW("#{path}/homework1", '0171', deadline, results)
			homework.checkHW("#{path}/homework2", '0172', deadline, results)
		else
			homework.checkHW(path, hw, deadline, results)
	end
end

writer = Writers.new
writer.choosewriter results, start, ARGV[1], ARGV[2]
puts "Successfully checked all homework!"