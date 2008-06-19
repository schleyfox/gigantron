desc "Describe your MapReduce task"
task :<%= name %> do
  load 'mapreduce/mr_<%= name %>'
  MapReduce<%= name.camelcase %>.run
end
