# This file handles all the background initialization work that the programmer
# shouldn't have to worry about.  
# This includes database startup, common requires, activesupport, and other
# magic.  I'm not sure if this is a good idea or not.

# ENV works like in rails, except is :real or :test
GTRON_ENV ||= :real 

GTRON_ROOT = File.dirname(__FILE__)

require 'rubygems'

require 'activesupport'
#set up autoload paths
Dependencies.load_paths << "#{GTRON_ROOT}/lib/"

gem 'dm-core'
require 'data_mapper'

DataMapper.setup(:default, YAML::load(File.read("database.yml"))[GTRON_ENV])
Dir["models/**/*.rb"].each {|r| load r }
