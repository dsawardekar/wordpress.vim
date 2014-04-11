# Design

WordPress.vim has 2 main aspects to it's code base. Code Generation & the Vim plugin.

### Code Generation

The syntax files and auto-completion are auto generated from the
WordPress code base. First an XML structure is built using [phpdocumentor][1].
This `structure.xml` is an intermediate format used by `phpdoc` before
it builds it's template documentation. It is very useful as it contains all the relevant meta
information needed by us.

The generated phpdocs are scanned using the ruby library [Nokogiri][7] into
a project structure. And this internal structure is used to generate the final syntax files and
the auto-completion dictionary.

Code Generation is written in Ruby and is located in `lib/dynamo`.

### Vim Plugin

The Vim plugin is split into 2 components. A lightweight WordPress
project detector and the main application that provides the
WordPress.vim functionality.

The plugin component ensures that the WordPress functionality only kicks
in when you are inside a WordPress project. This is handy because you
don't want to load WordPress.vim ex commands in a custom PHP project.

This also ensures a fast Vim bootup when you are not working on a
WordPress project.

The plugin itself is written entirely in [Riml][2]. The implementation uses a
Command Pattern to organize code. Most command names correspond to what
they do. For instance, the `LoadSyntaxCommand` loads the syntax files for
`PHP` and `readme.txt`

The `WpCliCommand` provides execution of the [wp-cli][6] commands. For most
`wp-cli` subcommands the class is used directly. However some actions
like for instance, `wp eval` extend the base functionality. The
`EvalCommand` adds support for execution of the current Vim selection.

The Vim Plugin lives in `lib/wordpress`

# Building a Development Environment

To contribute to WordPress.vim you will need a working Ruby and PHP
setup.

For Ruby you will need.

1. Ruby 1.9.3+
1. [Bundler][9]

For PHP you will need.

1. PHP 5.3+
1. [Composer][10]
1. [WP-CLI][6]
1. A Working WordPress Stack - LAMP, MAMP, WAMP, etc

Additionally you will also need `Exuberant CTags`. Ctags provides the
`goto definition` functionality.

1. On Ubuntu, that's `apt-get install exuberant-ctags`
1. On Mac, that's `brew install ctags`

Once you have these environments setup, the WordPress.vim setup is straightforward.

1. Clone the repo.
1. Run `$ composer install` to install the project's PHP dependencies.
1. Run `$ bundle install` to install the project's Ruby dependencies.
1. Run `rake tmp:init`. This will download WordPress into
   `tmp/wordpress/VERSION`. Where `VERSION` will usually reflect the
   current WordPress release.
1. Update `wp-config.php` in `tmp/wordpress/VERSION` and run a `wp-cli`
   command like `wp core version` to verify that WordPress is correctly
   configured.
1. Finally run `rake test` to run the test suite. This will run `phpdoc`
   to generate the `structure.xml` and then the `rspec` and `speckle`
   tests.
1. Add the plugin's repo to your Vim's runtime path. Eg:- `let
   rtp+=path/to/repo`. You can now use `rake dist` to rebuild the plugin
   files and test out your changes.

See `rake -T` to list all the tasks available.

## Reporting a Bug

If you encounter Vim's Red Screen of Death, don't Panic!

1. When Vim encounters an Error in a function it doesn't stop execution
   of the rest of the function. More often then not the only error that
   matters is the first one. The remaining errors are generally
   irrelevant.
1. To get Vim to log errors start Vim with, `vim --cmd 'let &verbosefile="foo.log"'`
1. Repeat the error causing behaviour and exit Vim.
   This will cause Vim to log error messages to the log file.
1. Create a [Gist][8] of your log file and include it along with your Bug report.

These steps will help with quick resolution of your Bug.

# Pull Requests

1. WordPress.vim uses the [Git-Flow][3] branching model.
1. Pull Requests go against the `develop` branch.
1. As described above the `.vim` are compiled/generated files. These
   files are regenerated on every build with `rake dist`. Pull requests
   should go against the source code in the `lib` directory.
1. Please provide working test examples alongside major changes or
   feature additions.

[1]: http://phpdoc.org
[2]: https://github.com/luke-gru/riml
[3]: https://github.com/nvie/gitflow
[4]: http://rspec.info
[5]: http://rake.rubyforge.org/
[6]: http://wp-cli.org
[7]: http://nokogiri.org/
[8]: http://gist.github.com
[9]: http://bundler.io
[10]: https://getcomposer.org
