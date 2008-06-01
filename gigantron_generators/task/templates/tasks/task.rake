desc "Write a task description and write it good!"
task :<%= name %> do
  get_db_conn(GTRON_ENV)
end
