" phpcs Syntax checker for WordPress files to Syntastic plugin
" Based on PHP's phpcs syntax checker
"
" Needs the WordPress coding standard sniffs from
" https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards
"
" @author: Sudar Muthu (https://github.com/sudar)
if exists("g:loaded_syntastic_wordpress_phpcs_checker")
    finish
endif
let g:loaded_syntastic_wordpress_phpcs_checker = 1

" Use PHP's phpcs checker
runtime! syntax_checkers/php/phpcs.vim

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'wordpress',
    \ 'name': 'phpcs',
    \ 'redirect': 'php/phpcs'})

" Register the new filetype
if exists('g:syntastic_extra_filetypes')
    call add(g:syntastic_extra_filetypes, 'wordpress')
else
    let g:syntastic_extra_filetypes = ['wordpress']
endif
