require 'zeitwerk'
require 'yaml'
require 'active_record'

$stdout.sync = true

loader = Zeitwerk::Loader.new
loader.push_dir('db')
loader.push_dir(File.join('db', 'migrate'))
loader.push_dir('lib')
loader.push_dir(File.join('lib', 'models'))
loader.setup

db_config_file = File.open(File.join(File.dirname(__FILE__), 'config', 'database.yml'))
@db_config = YAML::load(db_config_file)

ActiveRecord::Base.establish_connection(@db_config)