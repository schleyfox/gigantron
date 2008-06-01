require File.dirname(__FILE__) + '/../test_helper.rb'

class Test<%= name.capitalize %> < Test::Unit::TestCase
  def setup
    get_db_conn(GTRON_ENV)
    DataMapper.auto_migrate!
  end

  #replace with real tests
  should "be true" do
    assert true
  end
end
