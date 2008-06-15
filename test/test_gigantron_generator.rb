require File.join(File.dirname(__FILE__), "test_generator_helper.rb")

class TestGigantronGenerator < Test::Unit::TestCase
  include RubiGen::GeneratorTestHelper

  def setup
    bare_setup
  end
  
  def teardown
    bare_teardown
  end
  
  def test_generator_without_options
    run_generator('gigantron', [APP_ROOT], sources)
    assert_directory_exists "tasks/"
    assert_generated_file   "tasks/import.rake"
    assert_directory_exists "test/"
    assert_generated_file   "test/test_helper.rb"
    assert_directory_exists "test/tasks/"
    assert_generated_file   "test/tasks/test_import.rb"
    assert_directory_exists "test/models/"
    assert_directory_exists "lib/"
    assert_directory_exists "models/"
    assert_directory_exists "db/"
    assert_directory_exists "script/"
    assert_generated_file   "script/generate"
    assert_generated_file   "database.yml"
    assert_generated_file   "Rakefile"
    assert_generated_file   "initialize.rb"
  end

  context "Generated project" do
    setup do
      run_generator('gigantron', [APP_ROOT], sources)

      silence_warnings { GTRON_ENV = :test }
      require File.join(APP_ROOT, "initialize.rb")
      require 'gigantron/migrator'
      if !File.exists? "test/template_database.yml"
        puts "Configure test DB in 'test/template_database.yml'!"
      end
      assert File.exists?("test/template_database.yml")
      File.open("#{APP_ROOT}/database.yml", "w") do |f|
        f.write ERB.new(
          File.read("test/template_database.yml")).result(binding)
      end

      get_db_conn(GTRON_ENV)
    end

    context "with migration and model" do
      setup do
        run_generator('model', ['Foo'], sources)
        if !File.exists? "#{APP_ROOT}/db/migrate/001_create_foos.rb"
          run_generator('migration', ['CreateFoos'], sources)
        end

        assert File.exists?("#{APP_ROOT}/db/migrate/001_create_foos.rb")
        FileUtils.cp("test/template_migration.rb", 
          "#{APP_ROOT}/db/migrate/001_create_foos.rb")

        get_db_conn(GTRON_ENV)
        ENV["VERBOSE"] = "false"
        Gigantron.migrate_dbs
      end

      should "create test db" do
        assert File.exists?("#{APP_ROOT}/db/test.sqlite3")
      end

      should "create table foos and populate" do
        assert_equal Foo.find(:all).size, 2
      end
    end
  end
  
  private
  def sources
    [RubiGen::PathSource.new(:test, File.join(File.dirname(__FILE__),"..", generator_path)),
    RubiGen::PathSource.new(:test_components, File.join(File.dirname(__FILE__),"..", "gigantron_generators"))]
  end
  
  def generator_path
    "app_generators"
  end
end
