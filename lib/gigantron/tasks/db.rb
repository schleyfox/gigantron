namespace :db do
  desc "Automatically migrate databases according to models"
  task :automigrate do
    puts "Migrating your database"
    get_db_conn(GTRON_ENV)
    DataMapper.auto_migrate!
  end
end
