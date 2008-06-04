desc "Describe your MapReduce task"
task :<%= name %> do
  load 'mapreduce/mr_<%= name %>'
  MapReduce<%= name.capitalize %>.run
end
