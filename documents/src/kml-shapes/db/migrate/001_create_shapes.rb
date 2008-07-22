class CreateShapes < ActiveRecord::Migration
  def self.up
    create_table :shapes do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :shapes
  end
end
