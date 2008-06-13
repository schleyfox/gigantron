
# simple function to handle migrating Gigantron databases
module Gigantron
  def self.migrate_dbs
    ActiveRecord::Migration.verbose = 
      ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    ActiveRecord::Migrator.migrate("#{GTRON_ROOT}/db/migrate/", 
      ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
  end
end
