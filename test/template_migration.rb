class CreateFoos < ActiveRecord::Migration
  def self.up
    create_table :foos do |t|
      t.string :title
    end

    %w(Foo Bar).each do |t|
      Foo.new(:title => t).save
    end
  end

  def self.down
    drop_table :foos
  end
end

