namespace :db do
  desc "Automatically migrate databases according to models"
  task :automigrate do
    puts "Migrating your database"
    DataMapper.auto_migrate!
  end
end