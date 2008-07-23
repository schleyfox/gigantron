require 'rake/testtask'

desc "Run all tests"
Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.pattern = 'test/**/test_*.rb'
  t.verbose = true
end

namespace :test do
  Rake::TestTask.new(:models) do |t|
    t.libs << "test"
    t.pattern = 'test/models/test_*.rb'
    t.verbose = true
  end
  Rake::Task['test:models'].comment = "Run model tests"

  Rake::TestTask.new(:tasks) do |t|
    t.libs << "test"
    t.pattern = 'test/tasks/test_*.rb'
    t.verbose = true
  end
  Rake::Task['test:tasks'].comment = "Run task tests"
end
