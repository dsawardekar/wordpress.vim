# Changelog

### 0.1.16

* Removes loading message.
  * In hindsight this also speeds up startup since we skip
    the extra `:redraw`.
* Adds Exclude files to Ctags builder to speed up tags generation.
* Improves WpCli error handling of invalid json.

### 0.1.15

* Improves error messaging when wp-cli is not detected.

### 0.1.14

* Removes debug statements from 0.1.13

### 0.1.13

* Adds readme.txt validator.

### 0.1.12

* Makes the tags file generated relative to itself.

### 0.1.11

* Removes duplicate CtrlP tag.

### 0.1.10

* Upgrades to WordPress 3.9
* Syntax & Autocompletion is now generated from 3.9
* Improves error message for :Wdef and others for unmatched tags.

### 0.1.9

* Removes duplicate help tags - issue #7.

### 0.1.8

* Improves Jump to Core implementation for WordPress hooks.
* Ctrl-] inside action name in listener jumps to invocation and vice
  versa.
* Similar implementation for filter hooks.
* Fixes :Wcodexsearch issue #5.

### 0.1.7

* Adds WordPress Hooks integration.
* :Waction[!] => add_action or do_action
* :Wfilter[!] => add_filter or do_filter
* And CtrlP variants.
* Improved error handling for WpCli#list.
* Adds :Wctags[!] to refresh ctags manually.
  * needed to upgrade from 0.1.6 to 0.1.7
  * old generated tags file did not have the custom ctag patterns.

### 0.1.6

* Adds support for highlighting WordPress constants.

### 0.1.5

* Adds `:Wdef` command to jump to core definition from ex mode.
* Adds custom mappings for <c-]> and <c-w>] to use `:Wdef` for improved
  ctags sorting.
* Adds Wpseek.com integration.
* :Wsimilar - searches for similar keywords
* :Wtopics - searches for topics on wordpress.org
* The WpSeek.com integration requires Vim with Python support.

### 0.1.4

* Adds `:Wshell` command that corresponds to `!wp shell`.

### 0.1.3

* Adds Search in Codex Feature with `:Wcodexsearch`
* Without arguments it uses the Visual selection or word under cursor.

### 0.1.2

* Fixes bug with :Wscaffold!.
* Fixes duplicate tag in Vim docs.

### 0.1.1

* Adds Vim docs.
* Removes underscores from snippet triggers.

### 0.1.0

* Initial version.
