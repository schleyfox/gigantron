class Coordinate < ActiveRecord::Base
  belongs_to :shape

  def self.from_file(file_name, shape)
    coords = File.read(file_name).split("\n")
    coords = coords[1...coords.size]

    coords.map do |line|
      c = line.split(",")
      Coordinate.create( :lon => c[0],
                         :lat => c[1],
                         :alt => c[2],
                         :shape => shape )
    end
  end
end
