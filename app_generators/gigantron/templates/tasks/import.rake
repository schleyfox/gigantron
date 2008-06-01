desc "Import data into the database"
task :import do
  # Acquire your data (e.g. from input/ or something) and parse it into
  # your database.  Your models should probably be the ones doing the heavy
  # lifting on this one.
  #
  # Ex:
  #   Foo.import_yaml(FileList["input/*.yml"].to_a)
  #
  # It may also be valuable to include database initialization or cleansing
  # as a dependency of this task
end
