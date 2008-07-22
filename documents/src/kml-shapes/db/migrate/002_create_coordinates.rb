### @export "CreateCoordinates"
class CreateCoordinates < ActiveRecord::Migration
  def self.up
    create_table :coordinates do |t|
      t.float :lon
      t.float :lat
      t.float :alt

      t.integer :shape_id
    end
  end
  # ...
### @end

  def self.down
    drop_table :coordinates
  end
end
