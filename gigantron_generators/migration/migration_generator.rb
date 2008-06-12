class MigrationGenerator < RubiGen::Base

  default_options :author => nil

  attr_reader :name

  def initialize(runtime_args, runtime_options = {})
    super
    usage if args.empty?
    @name = args.shift
    extract_options
  end

  def manifest
    record do |m|
      # Ensure appropriate folder(s) exists
      m.directory "db/"
      m.directory "db/migrate/"
      m.template  "db/migrate/migration.rb", 
        "db/migrate/#{next_migration_num}-#{name.underscore}.rb"

    end
  end

  protected
    def banner
      <<-EOS
Creates a ...

USAGE: #{$0} #{spec.name} name
EOS
    end

    def add_options!(opts)
      # opts.separator ''
      # opts.separator 'Options:'
      # For each option below, place the default
      # at the top of the file next to "default_options"
      # opts.on("-a", "--author=\"Your Name\"", String,
      #         "Some comment about this option",
      #         "Default: none") { |options[:author]| }
      # opts.on("-v", "--version", "Show the #{File.basename($0)} version number and quit.")
    end

    def extract_options
      # for each option, extract it into a local variable (and create an "attr_reader :author" at the top)
      # Templates can access these value via the attr_reader-generated methods, but not the
      # raw instance variable value.
      # @author = options[:author]
    end

    def next_migration_num
      #blegh, catalog existing migrations, find next
      current = Dir.glob(
        "#{@destination_root}/db/migrate/[0-9][0-9][0-9]-*.rb").map{|x|
          /(\d{3})-.*\.rb/.match(x)[1].to_i
      }.max
      current ||= 0
      "%03d" % current.succ
    end
end
