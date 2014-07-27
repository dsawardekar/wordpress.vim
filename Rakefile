require 'rake/clean'
require 'rspec/core/rake_task'
require_relative 'lib/tasks/paths'
require_relative 'lib/tasks/utils'

namespace :composer do
  desc "Install Composer Dependencies"
  task :install do
    sh 'composer install'
  end
end

namespace :tmp do
  desc "Download WordPress"
  task :download do
    verbose VERBOSE do
      mkdir_p 'tmp'
      sh 'wget', '-O', WORDPRESS_TARBALL, WORDPRESS_URL unless File.exists?(WORDPRESS_TARBALL)
    end
  end

  desc "Extract downloaded tarball to #{WORDPRESS_DIR}"
  task :extract do
    verbose VERBOSE do
      unless File.directory?(WORDPRESS_DIR)
        mkdir_p 'tmp/wordpress'
        mkdir_p 'tmp/extract'
        sh 'tar', '-xzf', WORDPRESS_TARBALL, '-C', 'tmp/extract'
        mv 'tmp/extract/wordpress', WORDPRESS_DIR
        puts "*************************************************"
        puts "*** Now update #{WORDPRESS_DIR}/wp-config.php ***"
        puts "*************************************************"
      end
    end
  end

  desc "Copy speckle support files to #{WORDPRESS_DIR}"
  task :copy do
    verbose VERBOSE do
      cp 'spec/wordpress/echo_wp_content.php', WORDPRESS_DIR
      cp 'spec/wordpress/readme.txt', WORDPRESS_DIR

      mkdir_p 'tmp/wpcli_with_local'
      cp 'spec/wordpress/cli.yml', 'tmp/wpcli_with_local/wp-cli.local.yml'
    end
  end

  task :init => [:download, :extract, :copy]
end

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
  task :dist => [:syntax, :dict, :dist_copy]
end

namespace :riml do
  desc 'Compile plugin'
  task :compile_plugin => :build do
    sh "#{RIML_EXEC} -c #{PLUGIN_SOURCE} -I #{LIB_DIRS} -o #{BUILD_DIR}"
  end

  desc 'Compile app'
  task :compile_app => :build do
    sh "#{RIML_EXEC} -c #{APP_SOURCE} -I #{LIB_DIRS} -o #{BUILD_DIR}"
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
task :test => ['composer:install', 'dynamo:phpdoc', 'dynamo:test', 'riml:test']

desc 'Remove generated files'
task :clean => ['dynamo:clean', 'riml:clean']

CLOBBER.include(BUILD_DIR)

desc 'Move generated files into their Vim locations'
task :dist => ['dynamo:syntax', 'dynamo:dict', 'dynamo:dist', 'riml:dist']
