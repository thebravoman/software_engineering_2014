# RUN:
# => ruby main.rb FILES_PATH
require './link.rb'

link = Link.new ARGV[0]
link.link_files
