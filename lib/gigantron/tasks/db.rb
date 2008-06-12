require 'gigantron/migrator'

namespace :db do
  desc "Migrate databases according to models"
  task :migrate do
    puts "Migrating your database"
    get_db_conn(GTRON_ENV)
    
    Gigantron.migrate_dbs
  end
end
