namespace :db do
  desc "Migrate databases according to models"
  task :migrate do
    puts "Migrating your database"
    get_db_conn(GTRON_ENV)

    ActiveRecord::Migration.verbose = 
      ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    ActiveRecord::Migrator.migrate("db/migrate/", 
                                   ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
  end
end
