require File.dirname(__FILE__) + '/../test_helper.rb'

class TestCoordinate < Test::Unit::TestCase
  def setup
    get_db_conn(GTRON_ENV)

    Gigantron.migrate_dbs
    Coordinate.delete_all
    Shape.delete_all
    @shape = Shape.create(:name => "Test")
    @coordinate = Coordinate.create(:lon => 32, :lat => 40, 
                                    :alt => 1000, :shape => @shape)
  end

  #should_belong_to :shape

  should "import from file" do
    assert_equal Coordinate,
      Coordinate.from_file("#{GTRON_ROOT}/test/sample_shape.csv", 
                           @shape).first.class
  end

end
