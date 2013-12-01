" SECTION: Init"{{{
" 关闭兼容"{{{
set nocompatible
"}}}
" " 设置HOME"{{{
" if has("win32") || has("wine64")
"     let $HOME = "E:/Vim/Setting"
" else
"     let $HOME = "/data/Vim/Setting"
" endif
" "}}}
" 设置runtimepath"{{{
if has("win32") || has("wine64")
    set runtimepath=E:/Vim/Setting/vimfiles,E:/Vim/Setting/.vim/bundle/vundle,$VIMRUNTIME
else
    set runtimepath=/data/Vim/Setting/.vim/bundle/vundle,/data/Vim/Setting/vimfiles/,$VIMRUNTIME
endif
"}}}
" 用pahtogen管理插件"{{{
call pathogen#infect()
"}}}
" vundle插件管理"{{{
filetype off
call vundle#rc()
"}}}
" 编码设置"{{{
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,latin1
" 解决菜单乱码
" source $VIMRUNTIME/delmenu.vim
" source $VIMRUNTIME/menu.vim
if has("win32") || has("win64")
    language messages zh_CN.utf-8
endif
"}}}
" 开启语法高亮"{{{
syntax enable
syntax on
"}}}
" 侦测文件类型"{{{
filetype on
"}}}
" 载入文件类型插件"{{{
filetype plugin on
"}}}
" 为特定文件类型载入相关缩进文件"{{{
filetype indent on
filetype plugin indent on
"}}}
" 配色方案"{{{
colorscheme mine
" colorscheme solarized

"}}}
"}}}
" SECTION: Option"{{{
" 启动的时候不显示那个援助索马里儿童的提示"{{{
set shortmess=atI
"}}}
" 设置触发CursorHold事件的时间(ms)"{{{
set updatetime=2000
"}}}
" 设置折叠方法"{{{
set foldmethod=marker
"}}}
"允许最大折叠层数"{{{
"set foldnestmax=1
"}}}
" 在处理未保存或只读文件的时候，弹出确认"{{{
set confirm
"}}}
"在命令行显示当前输入的命令"{{{
set showcmd
"}}}
" 当文件的状态在外部改变时，自动读入，内容改变不会重读"{{{
" set autoread
"}}}
" 设置字体"{{{
if has("win32") || has("win64")
    set guifont=Droid_Sans_Mono_for_Powerline:h11
else
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 11
endif
"}}}
"高亮当前行"{{{
set cursorline
"}}}
"高亮当前列"{{{
"set cursorcolumn
"}}}
" 高亮指定列"{{{
" set colorcolumn=81
"}}}
"设置最大列数，超出后自动换行"{{{
"set textwidth=81
"}}}
"设置打开时显示的行数、列数"{{{
"set lines=50 columns=85
"}}}
"不自动备份"{{{
set nobackup
"}}}
"设置格式选项"{{{
set formatoptions+=Mm1
set formatoptions-=r
"}}}
"自动切换目录"{{{
set autochdir
"}}}
" " 高亮显示匹配的括号"{{{
" set showmatch
" "}}}
" " 匹配括号高亮的时间（单位是十分之一秒）"{{{
" set matchtime=10
" "}}}
"搜索智能大小写"{{{
set ignorecase smartcase
"}}}
" 搜索逐字符高亮"{{{
set hlsearch
set incsearch
"}}}
" 允许backspace和光标键跨越行边界"{{{
set whichwrap+=<,>
set wrap
"}}}
" 回删"{{{
set backspace=2
"}}}
" 可以在buffer的任何地方使用鼠标"{{{
set mouse=a
set selection=exclusive
set selectmode=mouse,key
"}}}
" 通过使用:commands命令，告诉我们文件的哪一行被改变过"{{{
set report=0
"}}}
" 设置窗口边界填充字符"{{{
set fillchars=vert:\|,stl:\ ,stlnc:_
"}}}
" 显示tab和换行"{{{
set list
set listchars=tab:>-,trail:-
"}}}
" 设置缩进"{{{
" 使得按退格键时可以一次删掉 4 个空格
set softtabstop=4
" 设定 << 和 >> 命令移动时的宽度为 4
set shiftwidth=4
"}}}
"插入模式里: 插入 <Tab> 时使用合适数量的空格"{{{
set expandtab
"}}}
" " 状态行显示"{{{
" set statusline=%3*%n%m%r%h%w%q%*\ %f\ [%{&ff}:%{&fenc!=''?&fenc:&enc}:%Y]\
" \ \ [R=%03l/%L(%p%%)C=%03v]\ [0x%02.2B/%03.3b]\ [%{strftime(\"%m-%d\ %H:%M\")}]
" hi User1 guibg=#000000
" hi User2 guifg=#000000
" hi User3 guifg=#000000
" function! InsertStatuslineColor(mode)
" if a:mode == 'i'
" hi statusline guifg=#000000
" elseif a:mode == 'r'
" hi statusline guifg=#ff0000
" else
" hi statusline guifg=#00ff00
" endif
" endfunction
" au InsertEnter * call InsertStatuslineColor(v:insertmode)
" au InsertLeave * hi statusline guifg=#1b1d1e guibg=#353738
" "}}}
"设置标签页显示"{{{
set guitablabel=%N\ %f
"}}}
" "当退出编辑时，隐藏到缓冲区"{{{
" set hid
" "}}}
" 持久撤销"{{{
set undofile
if has("win32") || has("win64")
    set undodir=$HOME/win-undodir
else
    set undodir=$HOME/linux-undodir
endif
set undolevels=1000
"}}}
" 设置鼠标模式"{{{
set mousemodel=popup
"}}}
" 设置verbose级别"{{{
"set verbose=4
"}}}
" 设置verbose输出文件"{{{
" set verbosefile=$HOME/verbose
" "}}}
" 补全选项"{{{
set completeopt=menu,longest,preview
"}}}
" 开启modeline"{{{
set modeline
"}}}
" 关闭响铃和视觉"{{{
" set noerrorbells
set visualbell
"}}}
" " 禁用交换文件"{{{
" set noswapfile
" "}}}
" 设置文件格式"{{{
set fileformat=unix
"}}}
"总是显示状态栏"{{{
set laststatus=2
"}}}
"}}}
" SECTION: Map"{{{
" 切换菜单栏和工具栏"{{{
set guioptions-=l
set guioptions-=r
set guioptions-=L
set guioptions-=R
set guioptions-=m
set guioptions-=T
" 关开菜单栏
map<silent> <A-F3>  :call My_SwichMenu()<CR>
function! My_SwichMenu()
    if &guioptions =~# 'T'
        set guioptions-=T
        set guioptions-=m
    else
        set guioptions+=T
        set guioptions+=m
    endif
endfunction
"}}}
" 重新载入vimrc"{{{
if has("win32") || has("win64")
    nnoremap   <C-F5>    :source $HOME/_vimrc<CR>
else
    nnoremap   <C-F5>    :source $HOME/.vimrc<CR>
endif
"}}}
"可视选择一行，不包括空白"{{{
vnoremap il ^vv$
"}}}
" 复制类操作"{{{
" 粘贴
imap    <C-v>   <C-o>:set paste<CR><C-R>+<C-o>:set nopaste<CR><C-o>:echo "paste done"<CR>
cmap    <C-v>   <C-r>+
" 选中复制(剪贴板)
vmap    <C-c>   Y:echo "Copy done"<CR>
vmap    Y   "+y:echo "Copy done"<CR>
vmap    <C-x>   "+d:echo "cut done"<CR>
" 复制（一行）（剪贴板）
nnoremap    yy  "+yy:echo "Copy one line"<CR>
" 复制（当前位置到行尾）（剪贴板）
nnoremap    Y   "+y$:echo "Copy to end of line"<CR>
"复制一个单词到+寄存器
nnoremap    <C-c>  viW"+y:echohl "Copy one word"<CR>
"复制整个文件到+寄存器
nmap    <C-g>   ggVG"+y:echo "Copy whole file"<CR>
"}}}
" 空格控制关开折叠"{{{
nnoremap<silent>    <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"}}}
" 关闭窗口"{{{
map <A-q>   :q<CR>
imap    <A-q>   <esc>:q<CR>
"}}}
" 插入到文件最后一行"{{{
nnoremap ga  Go
"}}}
" 编辑.vimrc"{{{
if has("win32") || has("win64")
    command! -nargs=0    Ev
                \ edit E:/vim/Setting/vimrc
else
    command! -nargs=0    Ev
                \ edit /data/Vim/Setting/vimrc
endif
"}}}
" 窗口切换"{{{
nnoremap    <A-w>   <C-w>
nnoremap    <A-h>   <C-w>h
nnoremap    <A-j>   <C-w>j
nnoremap    <A-k>   <C-w>k
nnoremap    <A-l>   <C-w>l
nnoremap    <A-p>   <C-w>p
nnoremap    <A-o>   <C-w><C-o>
"}}}
" 调整窗口大小"{{{
nmap <A-Up> :resize+1<CR>
imap <A-Up> <C-o>:resize+1<CR>
nmap <A-Down> :resize-1<CR>
imap <A-Down> <C-o>:resize-1<CR>
nmap <A-Left> :vertical resize+1<CR>
imap <A-Left> <C-o>:vertical resize+1<CR>
nmap <A-Right> :vertical resize-1<CR>
imap <A-Right> <C-o>:vertical resize-1<CR>
"}}}
"开关显示行号"{{{
set nonumber
let s:My_line_number_enable = 0
nnoremap    <A-n>   :call My_SwitchLineNumberEnable()<CR>
func! My_SwitchLineNumberEnable()
    if s:My_line_number_enable == 1
        set number!
        let s:My_line_number_enable = 0
    else
        set number
        let s:My_line_number_enable = 1
    endif
endf
"}}}
" 网络查找帮助"{{{
"map! <F1>  :call My_search()<CR>
command! -nargs=0 Gs
            \ call My_search()
" Function: My_search()"{{{
" search by web browser
function! My_search()
    if has("unix")
        let n = inputdialog("Input search engine:", "google")
        if n != ""
            silent! exec "!sr " . n . " " . expand("<cword>")
        endif
    else
    endif
endfunction"}}}
"}}}
" 日期和时间"{{{
inoremap <silent> <A-d> <C-r>=strftime("%Y-%m-%d-%H:%M:%S")<CR>
inoremap <silent> <A-t> <C-r>=strftime("%H:%M")<CR>
"}}}
" 保存"{{{
map <A-s>   :call Save()<CR>
imap    <A-s>   <ESC>:call Save()<CR>
fun! Save()
    let a:line = line('.')
    " "去掉行尾空白
    " silent! exe ':%s;\s\+$;;g'
    silent exe 'w'
    exec ":" . a:line
    echo "saved"
endf
"}}}
" 补全"{{{
"inoremap    <A-]> <C-X><C-]>
"inoremap <A-F> <C-X><C-F>  //更全屏冲突
"inoremap    <A-l> <C-X><C-L>
"inoremap    <A-n> <C-x><C-n>
"}}}
" 跳转"{{{
map <silent> ' `
"}}}
" 打开文件"{{{
map<silent> <leader>o   :browse confirm e<CR>
"}}}
" 定义跳转标签页"{{{
nnoremap    <A-1>   1gt
nnoremap    <A-2>   2gt
nnoremap    <A-3>   3gt
nnoremap    <A-4>   4gt
nnoremap    <A-5>   5gt
nnoremap    <A-6>   6gt
nnoremap    <A-7>   7gt
inoremap    <A-1>   <esc>1gt
inoremap    <A-2>   <esc>2gt
inoremap    <A-3>   <esc>3gt
inoremap    <A-4>   <esc>4gt
inoremap    <A-5>   <esc>5gt
inoremap    <A-6>   <esc>6gt
inoremap    <A-7>   <esc>7gt
"}}}
" 切换单词大小写"{{{
inoremap <silent>    <A-u>   <ESC>mmviwU`ma
inoremap <silent>    <A-l>   <ESC>mmviwu`ma
"}}}
"创建一个段落折叠"{{{
nnoremap    zp  A<CR><CR><ESC>Vkkzf<SPACE>ji
"}}}
" 在命令行获得光标所在单词"{{{
cmap <A-w> <C-r>=expand("<cword>")<CR>
"}}}
" 全屏"{{{
if has("win32") || has("win64")
    map <F11>       :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
    imap <F11>      <C-o>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
else
    map <F11>   :call system("wmctrl -r :ACTIVE: -b toggle,fullscreen")<CR>
    imap <F11>   <C-o>:call system("wmctrl -r :ACTIVE: -b toggle,fullscreen")<CR>
endif
"}}}
" 换行"{{{
imap <S-CR> <ESC>o
"}}}
" 自动行号"{{{
nmap <C-A-l> :call AutoNumbering()<CR>
" Function: AutoNumbering() "{{{
" 自动生成行号
function! AutoNumbering()
    if line("'l") == 0
        echohl WarningMsg | echo "Please set mark(l) at start line!" | echohl None
        return
    endif
    let i = 2
    let endLine = line('.')
    silent! 'l s:^\d*\.\? \?:1. :
    " 因为在执行上个命令后，光标会跳转到修改的位置，所以需要跳转目标行，在执行
    exe "normal " . endLine . "G"
    silent! 'l,.g:\n\n\zs\d*\.\? \?:s//\=printf('%d. ', i)/g | let i+=1
endfunction "}}}
"}}}
" 设置寄存器(*,+)存储文件名并显示 “{{{
cnoremap    <C-f>   <C-R>=My_filename()<CR>
function! My_filename()
    let filename = expand("%:p")
    call setreg('*', filename)
    call setreg('+', filename)
    echo filename
    return filename
endfunction
"}}}
"}}}
" SECTION: Command"{{{
"快速编辑自己的vim脚本"{{{
command! -nargs=0 Em
            \ CommandT ~/.vim/bundle/my
"}}}
"开关设置固定宽度文本"{{{
command! -nargs=? SW
            \ call <SID>SetTextWidth(<f-args>)
" Function: s:SetTextWidth(...) "{{{
" 设置文本宽度
let s:default_text_width = 80
function! s:SetTextWidth(...)
    if a:0 == 0
        exe "set textwidth=" . s:default_text_width
    else
        exe "set textwidth=" . a:1
    endif
endfunction "}}}
"}}}
"}}}
" SECTION: Autocommand"{{{
"当离开某个窗口时，关闭高亮行，列"{{{
au WinLeave * set nocursorline "nocursorcolumn
au WinEnter * set cursorline "cursorcolumn
" autocmd BufWinEnter \[Buf\ List\] setl nonumber
"}}}
" 小于s:fold_enable_line时，关闭折叠功能，开启命令zi，关闭zi"{{{
autocmd BufReadPost * call <SID>Fold()
let s:fold_enable_line = 50
fun! s:Fold() "{{{
    if line('$') > s:fold_enable_line
        set foldenable
    else
        set foldenable!
    endif
endfunction "}}}
"}}}
" 高亮当前所有当前光标所在单词"{{{
autocmd CursorMoved *.c,*.h,*.cpp.,*.vim,*.sh,[Mm]akefile
            \ silent exe printf('match IncSearch ;\<%s\>;', expand('<cword>'))
"}}}
" 打开文件后跳转到最后已知的文件位置"{{{
" \"是转义标记"
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")|exe "normal! g`\""|endif
"}}}
" " 修复在不同的编码环境下，make导致的编码错误 {{{
" au QuickfixCmdPost make call QfMakeConv()
" function! QfMakeConv()
    " let qflist = getqflist()
    " for i in qflist
        " let i.text = iconv(i.text, "cp936", "utf-8")
    " endfor
    " call setqflist(qflist)
" endfunction
" "}}}
" " 自动关闭preview"{{{
" " If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" "}}}
"}}}
" SECTION: Menu && ToolBar"{{{
" 转换格式"{{{
amenu<silent>  ToolBar.My_DosFormat    :call My_DosFormat()<CR>
tmenu ToolBar.My_DosFormat     =>[DOS,GB18030]
amenu<silent>  ToolBar.My_UnixFormat   :call My_UnixFormat()<CR>
tmenu ToolBar.My_UnixFormat    =>[UNIX,UTF-8]
function! My_DosFormat()
    set ff=dos
    set fenc=chinese
    silent exec 'wa'
    echo "[DOS, CHINESE] convert done!"
endfunction
function! My_UnixFormat()
    set ff=unix
    set fenc=utf-8
    silent exec 'wa'
    echo "[UNIX, UTF-8] convert done!"
endfunction
"}}}
"}}}
" SECTION: Plugin"{{{
" A"{{{
map <C-tab> :A<CR>
"}}}
" Airline"{{{
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=1
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
" let g:airline_theme="powerlineish"
" let g:airline#extensions#bufferline#enabled = 1
" let g:airline#extensions#bufferline#overwrite_variables = 1
let g:airline#extensions#ctrlp#show_adjacent_modes = 1
"}}}
" align"{{{
" let g:alignmaps_euronumber = 1
let g:alignmaps_usanumber = 1
"}}}
" auto-pairs"{{{
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutToggle = ""
let g:AutoPairsShortcutFastWrap = "<M-e>"
let g:AutoPairsShortcutJump = ""
let g:AutoPairsShortcutBackInsert = "<M-b>"
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}
"}}}
" BufExplorer"{{{
let g:bufExplorerDefaultHelp=1       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 20  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
"nmap <A-b>  :BufExplorerVerticalSplit<CR>
nnoremap    <A-e>   :BufExplorer<CR>
nnoremap    <A-v>   :vs<CR>:BufExplorer<CR>
nnoremap    <A-m>   :bel sp<CR>:BufExplorer<CR>
"}}}
"Bufferline"{{{
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'
"}}}
" clang_complete"{{{
" let g:clang_auto_select = 1
" let g:clang_library_path = 'E:\OS\CrossPlatform\llvm\build\Release+Asserts\bin'
" let g:clang_complete_copen = 1
" let g:clang_user_options='|| exit 0'
"}}}
" cscope"{{{
" cscope执行程序
if has("unix")
    set csprg=/bin/cscope
else
    set csprg=e:\OS\CrossPlatform\cscope\Tool\cscope.exe
endif
"}}}
" CtrlP"{{{
command! -nargs=0 Mr
            \ CtrlPMRUFiles
""}}}
" EasyAlign"{{{
vnoremap <silent> <Enter> :EasyAlign<Enter>
"}}}
" GitGutter"{{{
let g:gitgutter_enabled = 0
"}}}
" My plugin "{{{
" Ctags"{{{
if has("unix")
    let g:Ctags_bin="ctags"
else
    let g:Ctags_bin="e:/OS/CrossPlatform/ctags/Tool/ctags.exe"
endif
"}}}
"}}}
" NERDTree"{{{
" 使用F9去开/关NERDTree
"let NERDTreeIgnore=['cscope.*$', 'tags$', 'types_c.taghl$', 'taghl_config.txt', '\~$']
"let NERDTreeWinPos = "left"
"imap <F9> <esc>:call NerdTree()<CR>
nmap <F2> :NERDTreeToggle<CR>
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeWinSize = 25
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeCaseSensitiveSort = 1
"let g:NERDTreeChDirMode = 2
"let g:NERDTreeIgnore = ['\.vim$', '\~$']
"let s:NerdIsOpened=0
"function! NerdTree()
"   if(s:NerdIsOpened==0)
"       NERDTree
"       let s:NerdIsOpened=1
"   else
"       NERDTreeClose
"       let s:NerdIsOpened=0
"   endif
"endfunction
"}}}
" " NERDcomment"{{{
" let g:NERDBlockComIgnoreEmpty = 0
" let g:NERDCompactSexyComs = 1
" let g:NERDSpaceDelims = 1
" map <C-\> <plug>NERDCommenterToggle
" let g:NERD_c_alt_style = 1
" "}}}
" Tagbar"{{{
nmap <F9> :TagbarToggle<CR>
let g:tagbar_width = 52
let g:tagbar_sort = 1
if has("win32") || has("win64")
    let g:tagbar_ctags_bin='e:\OS\CrossPlatform\ctags\Tool\ctags.exe'
endif
"}}}
" Tablemode{{{
" 跟align冲突
let g:table_mode_tableize_map=""
"}}}
" tcomment"{{{
map <C-/> :echo
"}}}
" YouCompleteMe"{{{
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_filetype_blacklist = {
            \ 'tagbar' : 1,
            \ 'qf' : 1,
            \ 'notes' : 1,
            \ 'markdown' : 1,
            \ 'mkd' : 1,
            \ 'unite' : 1,
            \ 'text' : 1,
            \ 'vimwiki' : 1,
            \}
"}}}
" autocomplete"{{{
"let g:acp_behaviorSnipmateLength=1
let g:acp_enableAtStartup = 0
let g:acp_enable = 0
let g:acp_completeOption = '.,w,b,k'
let g:acp_behaviorKeywordCommand = "\<C-n>"
" let g:acp_behaviorSnipmateLength = 1
" let g:acp_behaviorPythonOmniLength = 2
" let g:acp_completeoptPreview = 2


inoremap <silent> <A-j> <ESC>:call Acp_lock()<CR>a
fun! Acp_lock()
    normal mm
    if g:acp_enable == 0
        exe 'AcpEnable'
        let g:acp_enable = 1
    else
        exe 'AcpDisable'
        let g:acp_enable = 0
    endif
    normal 'm
endf
"}}}
" authorinfo"{{{
let g:vimrc_author='QianChengLong'
let g:vimrc_email='qian_cheng_long@163.com'
let g:vimrc_homepage='www.QianChengLong.com'
nmap ,au :AuthorInfoDetect<CR>
"}}}
" cmdline-complete"{{{
cmap <A-o> <Plug>CmdlineCompleteForward
cmap <A-p> <Plug>CmdlineCompleteBackward
"}}}
" command-t"{{{
if has("win32") || has("win64")
    let s:ruby_path = 'C:\ruby\bin'
endif
map <A-c>   :CommandT ~/.vim
" let g:CommandTAcceptSelectionTabMap = '<A-c>'
"}}}
" conque_term"{{{
"let g:ConqueTerm_TERM = 'xterm-256color'
"}}}
" " echofunction"{{{
" let g:EchoFuncLangsUsed = ["c", "cpp", "vim", "sh"]
" let g:EchoFuncMaxBalloonDeclarations = 2
" let g:EchoFuncAutoStartBalloonDeclaration = 1
" let g:EchoFuncAutoStartBalloonDeclaration = 1
"}}}
" FencView"{{{
nmap \fv    :FencView<CR>
let g:fencview_autodetect = 0
"}}}
" funComplete"{{{
" let g:completekey = "<C--e>"  "可以实现函数参数自动填写
"}}}
" grep"{{{
map <F4>    :Grep<CR>
"let g:Grep_Path = expand("%:p")
let Grep_Default_Filelist =  expand("%:p")
"}}}
" Session setting"{{{
noremap mks :wa<CR>:call MySession()<CR>
if has("win32") || has("win64")
    let g:session_directory = $HOME . "/.win-sessions"
else
    let g:session_directory = $HOME . "/.linux-sessions"
endif
let g:session_default_to_last = 1
let g:session_autoload = 'no'
let g:session_autosave = 'no'
fun! MySession()
    let n = inputdialog("input session name",'default' )
    if n != ""
        let session_name = n
    endif
    exec 'SaveSession ' . session_name
endfun
"}}}
" minibufexpl"{{{
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"}}}
" supertab"{{{
let g:SuperTabMappingForward = '<A-o>'
let g:SuperTabMappingBackward = '<A-p>'
"let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<C-x><C-o>"
let g:SuperTabClosePreviewOnPopupClose = 1
"}}}
" omni"{{{
" let OmniCpp_GlobalScopeSearch = 1
" let OmniCpp_DefaultNamespaces = []
" let OmniCpp_GlobalScopeSearch = 1 " 0 or 1
" let OmniCpp_NamespaceSearch = 2 " 0 , 1 or 2
" let OmniCpp_DisplayMode = 1
" let OmniCpp_MayCompleteDot = 1 " autocomplete with .
" let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
" let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
" let OmniCpp_SelectFirstItem = 0 " select first item (but don't insert)
" let OmniCpp_ShowPrototypeInAbbr = 1
" let OmniCpp_ShowAccess = 1
" set completeopt=longest,menu
"}}}
" " powerline"{{{
" set laststatus=2   " Always show the statusline
" let g:Powerline_symbols = 'fancy'
" set t_Co=256
" " let g:Powerline_theme = 'solarized256'
" " let g:Powerline_stl_path_style = 'full'
" let g:Powerline_cache_enabled = 1
" let g:Powerline_cache_file=$HOME . '/.cache/Powerline.cache'
" "}}}
" pyflaskes"{{{
if has("gui_running")
    highlight SpellBad term=underline gui=undercurl guisp=Red
endif
"}}}
" python.vim"{{{
let g:python_highlight_all = 1
"}}}
" " python-mode"{{{
" " let g:pymode_rope_local_prefix = "<C-p>r"
" " let g:pymode_rope_global_prefix = "<C-p>g"
" let g:pymode_rope_autoimport_modules = ["os", "shutil", "sys"]

" "}}}
" taglist"{{{
" 让taglist单独在一个标签页输出
"let Tlist_Show_One_File=1
"" 不同时显示多个文件的 tag ，只显示当前文件的
"let Tlist_Show_One_File = 0
"" 如果 taglist 窗口是最后一个窗口，则退出 vim
"let Tlist_Exit_OnlyWindow=1
""让当前不被编辑的文件的方法列表自动折叠起来
"let Tlist_File_Fold_Auto_Close = 0
""显示taglist菜单
"let Tlist_Show_Menu=1
"let s:TlistIsOpened=0
" nmap <F10> :Tlist<CR>
"let Tlist_Use_Right_Window = 0
"let Tlist_WinWidth = 30
"let Tlist_Auto_Open = 0
"let Tlist_Auto_Highlight_Tag = 1
if has("win32") || has("win64")
    let Tlist_Ctags_Cmd = 'e:\OS\CrossPlatform\ctags\Tool\ctags.exe'
endif
"}}}
" " SourceExplorer"{{{
" "// The switch of the Source Explorer
" nmap <F8> :SrcExplToggle<CR>
" "
" " // Set the height of Source Explorer window
" let g:SrcExpl_winHeight = 8
" "
" "" // Set 100 ms for refreshing the Source Explorer
" let g:SrcExpl_refreshTime = 100
" "
" "" // Set "Enter" key to jump into the exact definition context
" let g:SrcExpl_jumpKey = "<ENTER>"
" "" // Set "Space" key for back from the definition context
" let g:SrcExpl_gobackKey = "<SPACE>"
" "
" "" // In order to Avoid conflicts, the Source Explorer should know what plugins
" "" // are using buffers. And you need add their bufname into the list below
" "" // according to the command ":buffers!"
" let g:SrcExpl_pluginList = [
" \ "__Tagbar__",
" \ "_NERD_tree_",
" \ "Source_Explorer"
" \ ]
" "
" "" // Enable/Disable the local definition searching, and note that this is not
" "" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" "" // It only searches for a match with the keyword according to command 'gd'
" let g:SrcExpl_searchLocalDef = 1
" "
" "" // Do not let the Source Explorer update the tags file when opening
" let g:SrcExpl_isUpdateTags = 0
" "
" " // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" " //  create/update a tags file
" "let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
" " // Set "<F12>" key for updating the tags file artificially
" "let g:SrcExpl_updateTagsKey = "<F12>"
" "}}}
" Trainity"{{{
" Open and close all the three plugins on the same time
"nmap <silent> <F8>   :TrinityToggleAll<CR>
" Open and close the srcexpl.vim separately
"nmap <F9>   :TrinityToggleSourceExplorer<CR>
" Open and close the taglist.vim separately
"nmap <F11>  :TrinityToggleTagList<CR>
" Open and close the NERD_tree.vim separately
"nmap \f  :TrinityToggleNERDTree<CR>
"}}}
" word_complete"{{{
" Do not complete words shorter than this length:
"let g:WC_min_len = 1
" Use this key to accept the offered completion:
"let g:WC_accept_key = "<Tab>"
"  If you want to activate the script by default, add the line
"autocmd BufEnter * call DoWordComplete()
"}}}
" neocomplcache"{{{
"so ~/.vim/bundle/neocomplcache-7.0/neo_config.vim
"}}}
" " taghl"{{{
" if ! exists('g:TagHighlightSettings')
" let g:TagHighlightSettings = {}
" endif
" let g:TagHighlightSettings['TagFileName'] = '.tags'
" let g:TagHighlightSettings['CtagsExecutable'] ='ctags'
" "指定配置文件名，为了隐藏文件
" let g:TagHighlightSettings['ProjectConfigFileName'] = '.taghl_config.txt'
" "指定生成的文件名前缀，为了隐藏文件
" let g:TagHighlightSettings['TypesFilePrefix'] = '.types'
" "let g:TagHighlightSettings['DoNotGenerateTags'] = 'ture'
" "let g:TagHighlightSettings['TagHL-ProjectConfigDirModePriority'] = ['~/.vim/bundle/taghighlight_r2.1.4/tagfile']"}}}
" indent guides"{{{
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
nmap <A-i>  :IndentGuidesToggle<CR>
autocmd VimEnter,Colorscheme * hi IndentGuidesOdd  guibg=grey61
autocmd VimEnter,Colorscheme * hi IndentGuidesEven  guibg=grey21
"}}}
" vimwiki"{{{
" 使用鼠标映射
let g:vimwiki_use_mouse = 1
" 不要将驼峰式词组作为 Wiki 词条
let g:vimwiki_camel_case = 0
let g:vimwiki_valid_html_tags='b,i,s,u,p,sub,sup,kbd,br,hr,div,del,code,red,center,left,right,pre,script'
let tlist_vimwiki_settings = 'wiki;h:Headers'
let g:vimwiki_dir_link='index'
let wiki = {}
if has("win32") || has("win64")
    let wiki.path = 'E:\Vim\vimwiki\wiki'
else
    let wiki.path = '/media/study/vimwiki/wiki/'
endif
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let g:vimwiki_list = [{
            \ 'path': '/media/study/vimwiki/wiki/',
            \ 'path_html': '/media/study/vimwiki/html/',
            \ 'auto_export': 1,
            \ 'template_path': '/media/study/vimwiki/templates/my/',
            \ 'template_default': 'default',
            \ 'template_ext': '.tpl',
            \ 'css_name': '../templates/my/style.css',
            \},
            \wiki,
            \]
function! VimwikiLinkHandler(link)
    try
        let browser = '/usr/bin/chromium '
        execute "!" . browser . a:link
        return 1
    catch
        echo "This can happen for a variety of reasons ..."
    endtry
    return 0
endfunction"}}}
"{{{ vim-markdown
" let g:vim_markdown_folding_disabled=0
"}}}
" xpt"{{{
" let g:xptemplate_key = '<A-a>'
" let g:xptemplate_nav_next = '<A-o>'
" let g:xptemplate_nav_prev = '<A-p>'
" let g:xptemplate_always_show_pum = 1
" avoid key conflict
let g:SuperTabMappingForward = '<Plug>supertabKey'
" if nothing matched in xpt, try supertab
let g:xptemplate_fallback = '<Plug>supertabKey'
" trigger key
let g:xptemplate_key = '<A-/>'
imap <A-o> <A-/>
"If more than one snippet starts with( or exactly equals to ) the text
"before cursor, pop up menu shows.
let g:xptemplate_key_force_pum = '<A-f>'
" " use <tab>/<S-tab> to navigate through pum. Optional
let g:xptemplate_pum_tab_nav = 1
" xpt triggers only when you typed whole name of a snippet. Optional
" let g:xptemplate_minimal_prefix = 'full'
let g:xptemplate_vars = "$email=qian_cheng_long@163.com&$author=QianChenglong"
"}}}
" zencoding"{{{
"let g:user_zen_expandabbr_key = '<c-y>'
"}}}
"}}}
" SECTION: Vundle plugins "{{{
Bundle 'tomtom/tcomment_vim'
Bundle 'airblade/vim-gitgutter'
if has("unix")
    Bundle 'Valloric/YouCompleteMe'
endif
" Bundle 'suan/vim-instant-markdown'
" Bundle 'klen/python-mode'
" Bundle 'derekwyatt/vim-fswitch'
" Bundle 'dhruvasagar/vim-table-mode'
" Bundle 'Lokaltog/vim-powerline'
" Bundle 'bling/vim-bufferline'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'kshenoy/vim-signature'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'gmarik/vundle'
Bundle 'junegunn/vim-easy-align'
" Bundle 'Align'
Bundle 'jiangmiao/auto-pairs'
Bundle 'bufexplorer.zip'
Bundle 'CmdlineComplete'
Bundle 'Command-T'
" Bundle 'https://code.google.com/p/conque/'
" Bundle 'echofunc.vim'
Bundle 'FencView.vim'
" Bundle 'EasyGrep'
Bundle 'nathanaelkane/vim-indent-guides'
" Bundle 'plasticboy/vim-markdown'
Bundle 'FromtonRouge/OmniCppComplete'
Bundle 'kevinw/pyflakes-vim'
Bundle 'hdima/python-syntax'
Bundle 'chrisbra/Recover.vim'
" Bundle 'xolox/vim-session'
" vim-session依赖
" Bundle 'xolox/vim-misc'
" Bundle 'wesleyche/SrcExpl'
"
" Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
" Bundle 'taglist.vim'
Bundle "Vimball"
" Bundle "terryma/vim-multiple-cursors"
" Bundle 'vimwiki'
Bundle 'drmingdrmer/xptemplate'
" Bundle 'Valloric/YouCompleteMe'
" Bundle 'mattn/zencoding-vim'
" " non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (ie. when working on your own plugin)
" Bundle 'file:///E:/vim/Setting/vimfiles/bundle/my'
Bundle 'chrisbra/csv.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
"}}}
