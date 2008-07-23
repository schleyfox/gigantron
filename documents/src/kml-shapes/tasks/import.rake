desc "Import data into the database"
task :import do
  get_db_conn(ENV["GTRON_ENV"] || GTRON_ENV)
  input_path = ENV["INPUT_PATH"] || "#{GTRON_ROOT}/input"

  Shape.delete_all
  Coordinate.delete_all
  Shape.from_directory(input_path)
end
