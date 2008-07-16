# This file handles all the background initialization work that the programmer
# shouldn't have to worry about.  
# This includes database startup, common requires, activesupport, and other
# magic.  I'm not sure if this is a good idea or not.

# ENV works like in rails, except is :real or :test
GTRON_ENV rescue GTRON_ENV = :real 

GTRON_ROOT = File.dirname(__FILE__)

require 'rubygems'
require 'rake'

require 'activesupport'
#set up autoload paths
Dependencies.load_paths << "#{GTRON_ROOT}/lib/"

require 'active_record'


def get_db_conn(env)
  env = env.to_sym
  #set up logging
  ActiveRecord::Base.logger = Logger.new("#{GTRON_ROOT}/log/#{env}.log")

  #load in dbs from database.yml
  ActiveRecord::Base.establish_connection(
    YAML::load(File.read("#{GTRON_ROOT}/database.yml"))[env])

  #load all models
  Dir["#{GTRON_ROOT}/models/**/*.rb"].each {|r| load r }

  nil
end
