syntax on
set clipboard+=unnamed 
set nu
" set fileencoding=gb18030
"set fileencodings=utf-8,gb18030,utf-16,big5

" settings of cscope.
" " I use GNU global instead cscope because global is faster.
set cscopetag

set cscopeprg=gtags-cscope

map <C-g> :cs f g <C-R>=expand("<cword>")<CR><CR> 
map <C-c> :cs find c <C-R>=expand("<cword>")<CR><CR> 
map <C-s> :cs find t <C-R>=expand("<cword>")<CR><CR>

"记录上次文件打开的位置
autocmd BufReadPost * 
              \ if line("'\"")>0&&line("'\"")<=line("$") | 
              \	exe "normal g'\"" | 
              \ endif
