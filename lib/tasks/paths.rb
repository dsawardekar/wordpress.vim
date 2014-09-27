require_relative 'riml'

# debugging options
VERBOSE = ENV['VERBOSE'] || false
DEBUG   = ENV['DEBUG'] || false

# wordpress paths
WORDPRESS_VERSION = '4.0'
WORDPRESS_DIR     = ENV['WORDPRESS_DIR'] || "tmp/wordpress/#{WORDPRESS_VERSION}"
WORDPRESS_TARBALL = "tmp/wordpress-#{WORDPRESS_VERSION}.tar.gz"
WORDPRESS_URL     = "http://wordpress.org/wordpress-#{WORDPRESS_VERSION}.tar.gz"

# phpdoc
PHPDOC       = ENV['PHPDOC'] || 'vendor/bin/phpdoc.php'
PHPDOC_INCLUDES = [
  'wp-includes'
]

# syntax
SYNTAX_TEMPLATE = 'lib/templates/wordpress.vim.erb'
SYNTAX_DEST     = 'syntax/wordpress.vim'

# dictionary
DICT_TEMPLATE = 'lib/templates/php_complete.vim.erb'
DICT_DEST     = 'misc/builtin.vim'

# riml sources
LIB_DIR = 'lib/wordpress'
LIB_DIRS = build_riml_path([LIB_DIR])

# riml plugin
PLUGIN_SOURCE = "#{LIB_DIR}/plugin.riml"
PLUGIN_DEST   = "plugin/wordpress.vim"

# riml app
APP_SOURCE = "#{LIB_DIR}/wordpress.riml"
APP_DEST   = "autoload/wordpress.vim"

# test paths
TEST_DIR = 'spec'

# build paths
BUILD_DIR              = 'build'
BUILD_PHPDOC_CONFIG    = "#{WORDPRESS_DIR}/phpdoc.dist.xml"
BUILD_PHPDOC_DIR       = "#{BUILD_DIR}/phpdocs"
BUILD_PHPDOC_CACHE_DIR = "#{BUILD_DIR}/phpdocs/cache"
BUILD_STRUCTURE_XML    = "#{BUILD_DIR}/phpdocs/structure.xml"
BUILD_SYNTAX_FILE      = "#{BUILD_DIR}/wordpress_syntax.vim"
BUILD_DICT_FILE        = "#{BUILD_DIR}/phpcomplete.vim"
BUILD_PLUGIN_OUTPUT    = "#{BUILD_DIR}/plugin.vim"
BUILD_APP_OUTPUT       = "#{BUILD_DIR}/wordpress.vim"

# tek riml
if ENV.has_key?('RIML_DIR')
  RIML_EXEC = "#{ENV['RIML_DIR']}/bin/riml"
else
  RIML_EXEC = "bundle exec riml"
end

