require 'rake/clean'
require 'rspec/core/rake_task'
require_relative 'lib/tasks/paths'
require_relative 'lib/tasks/utils'

namespace :dynamo do
  desc "Run dynamo's rspec tests"
  RSpec::Core::RakeTask.new(:spec)

  desc "Run dynamo's tests"
  task :test => [:spec]

  desc 'Generate PHPDoc structure.xml'
  task :phpdoc => :build do
    puts 'Generating structure.xml ...'
    verbose VERBOSE do
      cmd = phpdoc
      Dir.chdir(WORDPRESS_DIR) do
        sh cmd
      end
    end
  end

  desc 'Generate Syntax files - no phpdoc'
  task :build_syntax => :build do
    puts 'Generating Syntax Files ... '
    verbose VERBOSE do
      syntax
    end
  end

  desc 'Generate Syntax files'
  task :syntax => [:build, :phpdoc, :build_syntax]

  desc 'Generate Completion Dictionary - no phpdoc'
  task :build_dict => :build do
    puts 'Generating Completion Dictionary ...'
    verbose VERBOSE do
      dict
    end
  end

  desc 'Remove Generated Syntax & Dictionary files'
  task :clean do
    verbose VERBOSE do
      clean_file BUILD_SYNTAX_FILE
      clean_file BUILD_DICT_FILE
      clean_file SYNTAX_DEST
      clean_file DICT_DEST
    end
  end

  desc 'Move Generated Syntax & Dictionary into Vim directories - only copy'
  task :dist_copy do
    verbose VERBOSE do
      copy_to BUILD_SYNTAX_FILE, SYNTAX_DEST
      copy_to BUILD_DICT_FILE, DICT_DEST
    end
  end

  desc 'Generate Completion Dictionary'
  task :dict => [:build, :phpdoc, :build_dict]

  desc 'Move Generated Syntax & Dictionary into Vim directories - only copy'
  task :dist => [:dict, :dist_copy]
end

namespace :riml do
  desc 'Compile plugin'
  task :compile_plugin => :build do
    sh "bundle exec riml -c #{PLUGIN_SOURCE} -I #{LIB_DIRS} -o #{BUILD_DIR}"
  end

  desc 'Compile app'
  task :compile_app => :build do
    sh "bundle exec riml -c #{APP_SOURCE} -I #{LIB_DIRS} -o #{BUILD_DIR}"
  end

  desc 'Compile all'
  task :compile => [:compile_plugin, :compile_app]

  desc 'Run all riml tests'
  task :test => :build do
    sh "bundle exec speckle -a #{TEST_DIR} -r fivemat"
  end

  desc 'Remove Generated Syntax & Dictionary files'
  task :clean do
    verbose VERBOSE do
      clean_file BUILD_PLUGIN_OUTPUT
      clean_file BUILD_APP_OUTPUT
      clean_file PLUGIN_DEST
      clean_file APP_DEST
    end
  end

  desc 'Move Generated Plugin & App files into vim directories - only copy'
  task :dist_copy do
    verbose VERBOSE do
      copy_to BUILD_PLUGIN_OUTPUT, PLUGIN_DEST
      copy_to BUILD_APP_OUTPUT, APP_DEST
    end
  end

  desc 'Move Generated Plugin & App files into vim directories'
  task :dist => [:compile, :dist_copy]
end

desc 'Setup build directories'
task :build do
  verbose VERBOSE do
    mkdir_p BUILD_DIR
    mkdir_p BUILD_PHPDOC_DIR
  end
end

desc 'Default task :build'
task :default => :test

desc 'Run all tests'
task :test => ['dynamo:test', 'riml:test']

desc 'Remove generated files'
task :clean => ['dynamo:clean', 'riml:clean']

desc 'Move generated files into their Vim locations'
task :dist => ['dynamo:syntax', 'dynamo:dict', 'dynamo:dist', 'riml:dist']
