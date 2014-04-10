if exists('b:current_syntax') && b:current_syntax == 'markdown.readme'
  finish
end

" headings
syn region readmeH3 start="=\s*"   end="=*\s*$" oneline
syn region readmeH2 start="==\s*"  end="=*\s*$" oneline
syn region readmeH1 start="===\s*" end="=*\s*$" oneline

" inline PHP
unlet! b:current_syntax
syntax include @PHP syntax/php.vim
syntax region phpCode matchgroup=phpCodeDelimiter start="`" keepend end="`" contains=@PHP

" meta keywords
syn match readmeMetaKeyword "^Contributors:"
syn match readmeMetaKeyword "^Donate link:"
syn match readmeMetaKeyword "^Tags:"
syn match readmeMetaKeyword "^Requires at least:"
syn match readmeMetaKeyword "^Tested up to:"
syn match readmeMetaKeyword "^Stable tag:"
syn match readmeMetaKeyword "^License:"
syn match readmeMetaKeyword "^License URI:"

" highlighting
hi link readmeH1 htmlH1
hi link readmeH2 htmlH2
hi link readmeH3 htmlH3
hi link readmeMetaKeyword Keyword
hi link phpCodeDelimiter Delimiter

" done
let b:current_syntax = 'markdown.readme'
