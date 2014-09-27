## WordPress.vim

### Vim Plugin for WordPress Development

### Features

* Auto-Completion for the WordPress API
* WordPress Hooks Integration
* WP-CLI Integration
* Jump to Definition in WordPress Core
* UltiSnips Snippets
* Syntax Highlighting for WordPress PHP files.
* Markdown Syntax Highlighting for readme.txt
* [PHPCS][31] Syntax Checker integrated with [WordPress Coding Standards][32]
* Search in Codex
* Integration with WpSeek API.
* Readme.txt Auto Validation.

## Auto-Completion

WordPress.vim extends [phpcomplete.vim][2] to provide Auto-Completions for
WordPress PHP files. If you have phpcomplete.vim installed no additional
configuration is required.

The demo below shows Auto-Completion of the `WP_Query` class and other
API functions.

![Auto Completion][23]

See `:h wordpress-auto-completion` for more.

## WordPress Hooks Integration

WordPress.vim has close integration with the WordPress action and filter
hooks. This feature uses `ctags` and is further enhanced with the
presence of [CtrlP.vim][17].

The demo below shows navigation to a few hooks with the ex commands
`:Waction` and `:Wfilter` and their CtrlP variants, `:CtrlPaction` and
`:CtrlPfilter`.

![WordPress Hooks Integration][26]

See `:h wordpress-hooks-integration` for more.

## WP-CLI Integration

WordPress.vim is closely integrated with [WP-CLI][3]. You can easily run
WP-CLI commands without leaving Vim. It maps the `wp {command}` to Vim's
Ex commands of the form `:W{command}`.

The demo below shows `:Wscaffold plugin` in action. Also seen are the
`:Weval` and `:Wplugin` commands.

![WP-CLI Plugin Scaffold][24]

See `:h wordpress-wp-cli` for more.

## Jump to Definition in Core

Jump to Core takes you to the implementation of a function in Core. You
can easily move around the code base and return once you've figured out
what you need.

The demo below starts out in a theme then jumps to different Core
functions and finally returns back to the starting point.

![Jump To Core][22]

See `:h wordpress-jump-to-core` for more.

## UltiSnips Snippets

WordPress.vim comes with a few useful snippets to speed up common
WordPress development tasks. Snippets require the [UltiSnips][5]
snippets engine plugin to be installed.

A Snippet is like an interactive Web Form. Once you enter a Snippet you
are put at the first placeholder. As you start typing the placeholder
changes and also affects any dependent placeholders. You can cycle back and
forth between placeholders and Escape out when done.

The demo below shows the `theme header` snippet in action.

![themeheader snippet][21]

See `:h wordpress-snippets` for more.

## Syntax Highlighting

WordPress.vim extends the default PHP syntax highlighting with support
for the WordPress API. Importantly it highlights the use
of any deprecated function as Errors.

Note the highlighting of the deprecated `is_taxonomy` function.

![Deprecate is_taxonomy][20]

Additionally the `readme.txt` found in WordPress files is highlighted as
Markdown.

See `:h wordpress-syntax-highlighting` for more.

## Search in Codex

The `:Wcodexsearch` Ex command provides searching for keywords on the Codex. When
arguments are omitted it uses the current Visual selection or the word
under the cursor to query for.

For faster searches, You can map this to a key sequence like, `<leader>co` with,

```viml
:nnoremap <leader>co :Wcodexsearch<CR>
```

## WpSeek.com Integration

WordPress.vim integrates with the [WpSeek API][16]. This allows
searching using the wpseek api directly from within Vim.

The demo below shows the `:Wsimilar` Ex command in action.

![Wsimilar demo][25]

see `:h wordpress-wpseek-integration` for more.

## Getting Started

The repository includes a [minimal Vimrc][19] for trying out WordPress.vim without
affecting your existing Vim configuration. Plugin management is done with
[Vundle][12].

First backup your existing vimrc.

```bash
$ mv ~/.vimrc ~/.vimrc_backup
```

Then download the [minimal vimrc][19] to a temporary directory like
`/tmp/wordpress_vim`.

```bash
$ mkdir -p /tmp/wordpress_vim
$ wget -O /tmp/wordpress_vim/vimrc https://raw.githubusercontent.com/dsawardekar/wordpress.vim/develop/examples/minimal_vimrc.vim
```

Link the tmp vimrc to your `$HOME` vimrc.

```bash
$ ln -s /tmp/wordpress_vim/vimrc ~/.vimrc
```

Now start Vim.

The first time the `vimrc` will download Vundle to the `/tmp/wordpress_vim` directory and then
proceed to install the required plugins using Vundle. Plugins will be
installed in the subdirectory `/tmp/wordpress_vim/bundle`.

Installation may take a few minutes. Once completed you will have a custom vim
configuration separate from your existing one.

To move to your old configuration simply link your backup vimrc back to the
`$HOME` vimrc.

## Installation

##### 1. With [Vundle][12]
`Plugin 'dsawardekar/wordpress.vim'`

##### 2. With [NeoBundle][13]
`NeoBundle 'dsawardekar/wordpress.vim'`

##### 3. With [Pathogen][14]
`git clone https://github.com/dsawardekar/wordpress.vim ~/.vim/bundle/wordpress.vim`

## System Requirements

WordPress.vim requires Vim 7.3p97+ with Python support.

WordPress.vim uses Progressive Enhancement to enable/disable features.
This means that the features that depend on other plugins/external tools are
only enabled if their presence is detected. A missing requirement will
not affect the behaviour of the rest of the plugin.

It is highly recommended to install the following plugins to get the
best experience.

* [phpcomplete.vim][2] - Enables Auto-Completion
* [SuperTab][7] or [YouCompleteMe][8] - More intuitive Auto Completion &
  integration with [UltiSnips][5]
* [UltiSnips][5] - Enables Code Snippets
* [php.vim][10] - Better PHP Syntax Highlighting
* [vim-markdown][6] - Enables Markdown Syntax Highlighting of readme.txt
* [open-browser.vim][15] - Enables Search in Codex & `:Wtopics` launching.
* [CtrlP.vim][17] - Enables Fuzzy matcher integration for WordPress hooks.
* [Syntastic][33] - For the PHPCS Syntax Highlighter Integration.

Additionally the following tools enhance WordPress.vim.

* [WP-CLI][3] - Enables :W ex commands & automatic WordPress path lookup.
* [Exuberant CTags][9] - Enables the Jump to Core Definition feature

To install `ctags`,

* On Ubuntu, use `apt-get install exuberant-ctags`
* On Mac, use `brew install ctags`

## Thanks

WordPress.vim builds on top a number of other excellent Projects.
Many Thanks in particular to,

* Shawn Biddle - for [phpcomplete.vim][2]
* Cristi Burcă - for [WP-CLI][3]
* Luke Gruber  - for [Riml][4]
* Oliver Schlöbe - for the [WpSeek][16] API
* Sudar Muthu - for the Syntastic Integration.

## Contributing

WordPress.vim needs the help of the WordPress community to keep
improving. Please consider joining this effort by providing new
snippets, new features or bug reports.

If you find that a feature is missing or find a bug, please contact me
or and add an issue to the [issues tracker][11].

For further details on setting up a development environment for
WordPress.vim and the implementation of the plugin see
[CONTRIBUTING.md][1].

## TODO

* ~~WordPress Hook Integration~~ DONE
* ~~Find current word in Codex~~ DONE
* ~~Highlight Constants~~ DONE
* Improve snippets
* ~~Integrate with the wpseek.com API~~ DONE
* Improve Javascript Support
* ~~Figure out how to run WP-CLI shell commands.~~ DONE
* WPSE integration.

## License

MIT License. Copyright © 2014 Darshan Sawardekar.

[1]: https://github.com/dsawardekar/wordpress.vim/blob/develop/CONTRIBUTING.md
[2]: https://github.com/shawncplus/phpcomplete.vim
[3]: http://wp-cli.org
[4]: http://github.com/luke-gru/riml
[5]: https://github.com/SirVer/ultisnips
[6]: https://github.com/tpope/vim-markdown
[7]: https://github.com/ervandew/supertab
[8]: https://github.com/Valloric/YouCompleteMe
[9]: http://ctags.sourceforge.net/
[10]: https://github.com/StanAngeloff/php.vim
[11]: https://github.com/dsawardekar/wordpress.vim/issues
[12]: https://github.com/gmarik/Vundle.vim
[13]: https://github.com/Shougo/neobundle.vim
[14]: https://github.com/tpope/vim-pathogen
[15]: https://github.com/tyru/open-browser.vim
[16]: http://wpseek.com/
[17]: https://github.com/kien/ctrlp.vim
[18]: https://raw.githubusercontent.com/dsawardekar/wordpress.vim/develop/examples/minimal_vimrc.vim
[19]: https://github.com/dsawardekar/wordpress.vim/blob/develop/examples/minimal_vimrc.vim

[20]: http://i.imgur.com/YClNJML.png
[21]: http://i.imgur.com/3i7qrHJ.gif
[22]: http://i.imgur.com/iZgMFHk.gif
[23]: http://i.imgur.com/CGvCMUJ.gif
[24]: http://i.imgur.com/FWGrAN6.gif
[25]: http://i.imgur.com/CEBIxpn.gif
[26]: http://i.imgur.com/eMo6M9T.gif

[31]: https://github.com/squizlabs/PHP_CodeSniffer
[32]: https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards
[33]: https://github.com/scrooloose/syntastic
