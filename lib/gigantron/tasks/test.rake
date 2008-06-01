desc "Test all models and tasks"
task :test, ['gtron:init_test'] do
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
  Rake::TestTask.new(:models => ['gtron:init_test', 'db:automigrate']) do |t|
    t.libs << "test"
    t.pattern = 'test/models/test_*.rb'
    t.verbose = true
  end
  Rake::Task['test:models'].comment = "Run model tests"

  Rake::TestTask.new(:tasks => ['gtron:init_test', 'db:automigrate']) do |t|
    t.libs << "test"
    t.pattern = 'test/tasks/test_*.rb'
    t.verbose = true
  end
  Rake::Task['test:tasks'].comment = "Run task tests"
end
