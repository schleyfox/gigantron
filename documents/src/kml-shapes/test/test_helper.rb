require 'rubygems'
require 'test/unit'

require 'gigantron/migrator'
require File.dirname(__FILE__) + '/../initialize'
silence_warnings { GTRON_ENV = :test }
ENV['GTRON_ENV'] = 'test'

require 'shoulda'
require 'gigantron/shoulda/private_helpers'
require 'gigantron/shoulda/general'
require 'gigantron/shoulda/active_record_helpers'

module Test
  module Unit
    class TestCase
      include ThoughtBot::Shoulda::General
      extend ThoughtBot::Shoulda::ActiveRecord
    end
  end
end

