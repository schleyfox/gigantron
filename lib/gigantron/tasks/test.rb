require 'rake/testtask'

desc "Test all models and tasks"
task :test do
  errors = %w(test:models test:tasks).collect do |task|
    begin
      Rake::Task[task].invoke
      nil
    rescue => e
      task
    end
  end.compact
  abort "Errors running #{errors.to_sentence}!" if errors.any?
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
