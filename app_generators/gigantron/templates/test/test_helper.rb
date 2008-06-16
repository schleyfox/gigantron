require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'gigantron/migrator'
require File.dirname(__FILE__) + '/../initialize'
silence_warnings { GTRON_ENV = :test }
ENV['GTRON_ENV'] = 'test'
