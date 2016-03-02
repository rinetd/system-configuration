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

"高亮搜索
set hlsearch
set incsearch
" 在右下角显示文件行数以及百分比
set ruler

if exists('$ITERM_PROFILE')
  if exists('$TMUX') 
    let t_SI = "<Esc>[3 q"
    let t_EI = "<Esc>[0 q"
  else
    let t_SI = "<Esc>]50;CursorShape=1x7"
    let t_EI = "<Esc>]50;CursorShape=0x7"
  endif
end
