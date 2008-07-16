desc "Import data into the database"
task :import do
  # Acquire your data (e.g. from input/ or something) and parse it into
  # your database.  Your models should probably be the ones doing the heavy
  # lifting on this one.
  #
  # Ex:
  #   Foo.import_yaml(FileList["input/*.yml"].to_a)
  get_db_conn(ENV["GTRON_ENV"] || GTRON_ENV)
end
