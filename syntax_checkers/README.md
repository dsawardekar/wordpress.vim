# Setting up WordPress syntax checker

You need to do the following steps to get the syntax checker to work with WordPress files.

## Installing Required Vim Plugins

This syntax checker needs the following Vim plugins. You can install them using
your preferred installer like Vundle, Pathogen etc.

- [Syntastic](https://github.com/scrooloose/syntastic)
- [wordpress.vim](https://github.com/dsawardekar/wordpress.vim/)

## Installing phpcs

Next you need to install [`phpcs`](http://pear.php.net/package/PHP_CodeSniffer/).
You should be able to install it using the following command

```
pear install PHP_CodeSniffer
```

## Installing WordPress coding standard sniffs for phpcs

Next you need to install the [WordPress coding standard sniffs for phpcs](https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards).
You can execute the following commands. Also checkout [these instructions](https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards#how-to-use-this) for advanced usage.

```
git clone https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards.git wpcs
phpcs --config-set installed_paths wpcs
```

You can check if the standard installed properly or not using the following command.

```
phpcs -i
```

## Add the syntax checker to syntastic list

Add the following lines to your `~/.vimrc` file or better add them to `~/.vim/ftplugin/wordpress.vim`

```
let g:syntastic_wordpress_checkers = ['phpcs']
let g:syntastic_wordpress_phpcs_standard = "WordPress-Core" "Default standard
"Standard file name. This should be at the root of the project.
"If not found then the default standard is used
let g:syntastic_wordpress_phpcs_standard_file = "phpcs.xml"
```

The above configuration will use `WordPress-Core` as the default standard. If it finds a `phpcs.xml` file in any of the parent directories of the file that is currently being edited, then the standards from the `phpcs.xml` will be used.
