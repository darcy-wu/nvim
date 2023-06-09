lua << EOF
require("configs.lazy")
EOF

let g:better_escape_shortcut = 'jj'
let g:better_escape_interval = 200
set signcolumn=yes 

" F6自动格式化
" autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
" let g:autopep8_on_save = 1

" F5 自动编译文件 Normal+Visual mode
map <F6> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
	    exec "!g++ % -o %<"
	    exec "!time ./%<"
    elseif &filetype == 'cpp'
	    exec "!g++ % -o %<"
	    exec "!time ./%<"
    elseif &filetype == 'java'
	    exec "!javac %"
	    exec "!time java %<"
    elseif &filetype == 'sh'
	    :!time bash %
    elseif &filetype == 'python'
	    :FloatermNew! /home/eda/work/mercury_dev/venv/bin/python3 %
    elseif &filetype == 'html'
	    exec "!firefox % &"
    elseif &filetype == 'go'
	    " exec "!go build %<"
	    exec "!time go run %"
    elseif &filetype == 'mkd'
	    exec "!~/.vim/markdown.pl % > %.html &"
	    exec "!firefox %.html &"
    endif
endfunc

if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

au BufNewFile,BufRead   *.bsv   set filetype=bsv
