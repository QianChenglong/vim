"=============================================================================
"     FileName: pyclewn.vim
"         Desc: Pyclewn setting
"       Author: QianChenglong
"        Email: qian_cheng_long@163.com
"      Version: 1.0
"   LastChange: 2012-08-01 21:40:00
"      History:
"=============================================================================
" SECTION: Commands"{{{
command!    -nargs=? -complete=file D
            \ call <SID>GDB(<f-args>)
"载入文件
command!    -nargs=0 -complete=file CF
            \ call <SID>File()
"载入映射
command!    -nargs=0 CMap
            \ call <SID>Map()
"撤消映射
command!    -nargs=0 CUnmap
            \ call <SID>Unmap()
"}}}
" SECTION: Functions"{{{
" Function: s:Init()"{{{
func! s:Init()
    if exists('g:pyclewn_did_init')
        return
    endif
    let g:pyclewn_did_init = 1
    "设置输出选项"{{{
    silent exe '!read -t0.3'
    exe "Cset print pretty"
    silent exe '!read -t0'
    exe "Cset print address"
    silent exe '!read -t0.1'
    exe "Cset print array"
    "}}}
    "载入c功能
    so /home/qian/.vim/bundle/my/ftplugin/c/c.vim

    let s:var_fmt = {'b': 'binary', 'd': 'decimal', 'h': 'hexadecimal', 'o': 'octal', 'n': 'natural'}
    "默认变量格式
    let s:default_var_fmt = 'n'
    let s:watch_buffer_name = '(clewn)_dbgvar'
    let s:console_buffer_name = '(clewn)_console'

    call <SID>Map()
    autocmd BufReadPost * CMap
    call <SID>LoadPopupMenu()
    autocmd BufEnter * call <SID>LoadPopupMenu()
endf "}}}
" Function: s:File()"{{{
"载入文件
func! <SID>File()
    if !executable(s:exec_filename)
        let s:exec_filename = expand("%:p:h") . '/main')
        if !executable(s:exec_filename)
            let s:exec_filename = expand("%:p:r")
            if !executable(s:exec_filename)
                let s:exec_filename = input('Debug file : ', expand("%:p:h"), "file")
                if !executable(s:exec_filename)
                    echohl WarningMsg | echo "No such file!" | echohl None
                    return
                endif
            endif
        endif
    endif
    "载入调试文件
    exe "Cfile " . s:exec_filename
endfunction"}}}
" Function: s:LoadPopupMenu() "{{{
" 载入Popup菜单
function! s:LoadPopupMenu()
   if bufname("%") == s:watch_buffer_name
       call <SID>LoadWatchMenu()
   elseif bufname("%") == s:console_buffer_name
       call <SID>LoadConsoleMenu()
   else
       call <SID>LoadNormalMenu()
   endif
endfunction "}}}
" Function: s:LoadWatchMenu() "{{{
" 自定义监视缓冲区的popup菜单
function! s:LoadWatchMenu()
    silent! unmenu PopUp
    nmenu PopUp.DeleteVar  :call <SID>DeleteVar()<CR>
    nmenu PopUp.SetVarBase :call <SID>SetVarBase()<CR>
endfunction "}}}
" Function: s:LoadNormalMenu() "{{{
" 自定义普通popup菜单
function! s:LoadNormalMenu()
    silent! unmenu PopUp
    amenu PopUp.&AddBreakpoint  :call <SID>AddBreakpoint()<CR>
    amenu PopUp.&RemoveBreakpoint :call <SID>RemoveBreakpoint()<CR>
    amenu PopUp.&ClearBreakpoint :call <SID>ClearBreakpoint()<CR>
    amenu PopUp.-SPE1- :
    amenu PopUp.&RunToCursor :call <SID>RunToCursor()<CR>
    amenu PopUp.-SPE2- :
    amenu PopUp.&Disassemble :call <SID>Disassemble()<CR>
endfunction "}}}
" Function: s:LoadConsoleMenu() "{{{
"
function!s:LoadConsoleMenu()
    silent! unmenu PopUp
endfunction "}}}
" Function: s:Map()"{{{
function! <SID>Map()
    "定义快速键入命令行
    nmap <buffer>    d   :C
    "添加变量
    vmap <buffer>    a :call <SID>AddVar()<CR>
    "删除变量
    nmap <buffer>    <A-u> :Cdelvar var
    "下断点
    nmap <buffer>    b   :call <SID>AddBreakpoint()<CR>
    "清除断点
    nmap <buffer>    c  :call <SID>RemoveBreakpoint()<CR>
    "run
    nmap <buffer>    R  :Crun<CR>
    "打印变量
    vmap <buffer>    p :call <SID>PrintVar()<CR>
    "开始调试
    nmap <buffer>    T :Cstart<CR>
    "结束调试，重新读取文件
    nmap <buffer>    Q :Cquit<CR>:call <SID>File()<CR>
    "info
    nmap <buffer>    I   :Cinfo
    "next
    nmap <buffer>    n   :Cnext<CR>
    "setp
    nmap <buffer>    s   :Cstep<Cr>
    "set
    "nmap <buffer>    S   :Cset
    "up
    nmap <buffer>    U   :Cup<CR>
    "down
    nmap <buffer>    D   :Cdown<CR>
    "nexti
    nmap <buffer>    N   :Cnexti<CR>
    "setpi
    nmap <buffer>    S   :Cstepi<CR>
    "frame
    nmap <buffer>    f   :Cframe<CR>
    "PrintVar
    nmap <buffer>    p   :Cprint
    "continue
    nmap <buffer>    C   :Ccontinue<CR>
    "info locals
    nmap <buffer>    L   :Cinfo locals<CR>
    "run to cursor
    nmap <buffer>    J   :call <SID>RunToCursor()<CR>
    "finish
    nmap <buffer>   F   :Cfinish<CR>
endfunction"}}}
" Function: s:Unmap()"{{{
"撤消自己的映射
func! s:Unmap()
    silent! nunmap <buffer>  d
    "添加变量
    silent! vunmap <buffer>  A
    "删除变量
    silent! nunmap <buffer>    <A-u>
    "下断点
    silent! nunmap <buffer>  b
    "清除断点
    silent! nunmap <buffer> c
    "run
    silent! nunmap <buffer> R
    "打印变量
    silent! vunmap <buffer>  p
    "开始调试
    silent! nunmap <buffer> T
    "结束调试，重新读取文件
    silent! nunmap <buffer> Q
    "info
    silent! nunmap <buffer>    I
    "next
    silent! nunmap <buffer>    n
    "setp
    silent! nunmap <buffer>    s
    "set
    "silent! nunmap <buffer>    S
    "up
    silent! nunmap <buffer>    U
    "down
    silent! nunmap <buffer>    D
    "nexti
    silent! nunmap <buffer>    N
    "setpi
    silent! nunmap <buffer>      S
    "frame
    silent! unmap <buffer>    f
    "PrintVar
    silent! unmap <buffer>   p
    "continue
    silent! unmap <buffer>   C
    "info locals
    silent! unmap <buffer>   L
    "jump
    silent! nunmap <buffer>  J
endf "}}}
" Function: s:GDB()"{{{
"调用pyclewngdb
function! <SID>GDB(...)
    if a:0 == 1
        let s:exec_filename = a:1
        if s:exec_filename[0] != '/'
            let s:exec_filename = getcwd() . '/' . s:exec_filename
        endif
    else
        let s:exec_filename = expand("%:p:r")
        if !filereadable(s:exec_filename)
            let s:exec_filename = expand("%:p:h") . '/main'
            while !filereadable(s:exec_filename)
                echohl WarningMsg | echo "No such file!" | echohl None
                let s:exec_filename = input('Debug file : ', expand("%:p:h") . '/', "file")
            endwhile
        endif
    endif
    exe "Cfile " . s:exec_filename
    call s:Init()
endfunction"}}}
" Function: s:AddVar()"{{{
"添加所选择的变量
function! s:AddVar()
    let var = getreg('*')
    exe "Cdbgvar " . var
endfunction"}}}
" Function: s:DeleteVar() "{{{
" 删除指定变量
function!s:DeleteVar()
    let line = getline(line('.'))
    let var = matchstr(line, '\<var\d')
    if var == ""
        return
    endif
    exe "Cdelvar " . var
endfunction "}}}
" Function: s:SetVarBase() "{{{
" 设置变量进制
function!s:SetVarBase()
    let line = getline(line('.'))
    let var = matchstr(line, '\<var\d')
    if var == ""
        return
    endif
    let fmt = input(var . "format {b:binary | d:decimal | h:hexadecimal | o:octal | n:natural} : ",
                \ s:default_var_fmt)
    if get(s:var_fmt, fmt) != ''
        exe 'Csetfmtvar ' . var . ' ' . get(s:var_fmt, fmt)
        " echohl Success | echo 'Add ' . var . ':' . fmt | echohl none
    " else
        " echohl WarningMsg | echo 'Cancel add ' . var . ':' . fmt | echohl none
    endif
endfunction "}}}
" Function: s:ClearVar() "{{{
"
function!s:ClearVar()
    echo "ClearVar()"
endfunction "}}}
" Function: s:PrintVar()"{{{
"打印选择的变量
fun! s:PrintVar()
    exe "Cprint " . getreg('*')
endf"}}}
" Function: s:RunToCursor() "{{{
"
function!s:RunToCursor()
    let location = expand("%:p") . ":" . line('.')
    exe 'Cdisable breakpoints'
    silent exe '!read -t0.03'
    exe 'Cbreak ' . location
    silent exe '!read -t0.03'
    exe 'Crun'
    silent exe '!read -t0.05'
    exe 'Cclear ' . location
    silent exe '!read -t0.03'
    exe 'Cenable breakpoints'
endfunction "}}}
" Function: s:AddBreakpoint() "{{{
"
function! s:AddBreakpoint()
    let location = expand("%:p") . ":" . line(".")
    exe 'Cbreak ' . location
endfunction "}}}
" Function: s:RemoveBreakpoint() "{{{
"
function! s:RemoveBreakpoint()
    exe 'Cclear ' . expand("%:p") . ":" . line(".")
endfunction "}}}
" Function: s:ClearBreakpoint() "{{{
"
function! s:ClearBreakpoint()
    exe "Cdelete"
endfunction "}}}
"}}}
