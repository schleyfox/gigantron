class Shape < ActiveRecord::Base
  has_many :coordinates

  def self.from_directory(dir_name)
    Dir["#{dir_name}/*.csv"].map do |fn|
      shape_name = File.basename(fn, ".csv")
      shape = Shape.create(:name =>  shape_name)
      Coordinate.from_file(fn, shape)
      shape
    end
  end

end
