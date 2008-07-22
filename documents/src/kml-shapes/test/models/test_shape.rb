require File.dirname(__FILE__) + '/../test_helper.rb'

class TestShape < Test::Unit::TestCase
  def setup
    get_db_conn(GTRON_ENV)
    Gigantron.migrate_dbs
  end

  #replace with real tests
  should "be true" do
    assert true
  end
end
