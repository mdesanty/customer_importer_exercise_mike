require_relative File.join('.', 'customer_importer.rb')

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task default: %w[run]

task :run do
  ruby 'lib/app.rb'
end

namespace :db do
  task :migrate do
    migrations = Dir[File.join(File.dirname(__FILE__), 'db', 'migrate', '*.rb')]
    migrations.each do |migration|
      require migration
    end
  end

  task :remove do
    File.delete(File.join(File.dirname(__FILE__), @db_config['database']))
  end

  task :reset do
    Rake::Task['db:remove'].invoke
    Rake::Task['db:migrate'].invoke
  end
end