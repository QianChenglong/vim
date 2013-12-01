" =============================================================================
"      FileName: autohotkey.vim
"        Author: QianChengLong
"         Email: qian_cheng_long@163.com
"      HomePage: www.QianChengLong.com
"       Version: 1.0
"    LastChange: 2013-07-30 22:49:24
"       History:
" =============================================================================
"SECTION: Initialnization"{{{
if !exists("s:MyAHK_did_load")
    " SECTION: Options"{{{
    set autoindent
    set commentstring=;%s;
    "}}}
    " 变量定义"{{{
    let s:ExecFileName = expand("%")

    let s:AHK_interpreter = "E:/Programming/Language/AutoHotKey/Tool/AutoHotkey.exe"
    "}}}
    "}}}
    "载入自动命令，当使用时，载入脚本"{{{
    exe printf('autocmd FuncUndefined  MyAHK_* source %s', expand('<sfile>'))
    "}}}
    " 映射定义
    " :
    nmap <buffer>   <F6>    :call <SID>Execute()<CR>

    let s:MyAHK_did_load = 1
else
    finish
endif
"}}}
" SECTION: Funtions"{{{
" Function: MyAHK_Help()"{{{
" 用man查找光标下的单词
function! MyAHK_Help()
    let n = inputdialog("Input which manual to search:", "3")
    if n != ""
        silent! exec "!gnome-terminal -x bash -c 'man " . n . " " . expand("<cword>") ";read -n1'"
    endif
endfunction"}}}
" Function: Execute()"{{{
fun! s:Execute()
    exe 'wa'
    exe printf("!%s \"%s\"",
                \ s:AHK_interpreter,
                \ s:ExecFileName)
endf
"}}}
"}}}
