require 'rubygems'
require 'test/unit'
require 'shoulda'
require File.dirname(__FILE__) + '/../initialize'
silence_warnings { GTRON_ENV = :test }
