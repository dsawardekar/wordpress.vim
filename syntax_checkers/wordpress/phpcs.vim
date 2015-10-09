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

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_wordpress_phpcs_GetLocList() dict
	if exists("g:syntastic_wordpress_phpcs_args")
		" if args is defined, then just use it
		let args_before = ''
	endif

	if exists("g:syntastic_wordpress_phpcs_standard")
		" if a standard is set then use it
		let args_before = '--standard=' . g:syntastic_wordpress_phpcs_standard
	endif

	if exists("g:syntastic_wordpress_phpcs_standard_file")
		" search upwards from the current file's directory
		let standard_file = findfile(g:syntastic_wordpress_phpcs_standard_file, '.;')
		if filereadable(standard_file)
			let args_before = '--standard=' . standard_file
		endif
	endif

    let makeprg = self.makeprgBuild({
        \ 'args_before': args_before,
        \ 'args_after': '--report=csv' })

    let errorformat =
        \ '%-GFile\,Line\,Column\,Type\,Message\,Source\,Severity%.%#,'.
        \ '"%f"\,%l\,%c\,%t%*[a-zA-Z]\,"%m"\,%*[a-zA-Z0-9_.-]\,%*[0-9]%.%#'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'subtype': 'Style' })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'wordpress',
    \ 'name': 'phpcs' })

let &cpo = s:save_cpo
unlet s:save_cpo

" Register the new filetype
if exists('g:syntastic_extra_filetypes')
    call add(g:syntastic_extra_filetypes, 'wordpress')
else
    let g:syntastic_extra_filetypes = ['wordpress']
endif
