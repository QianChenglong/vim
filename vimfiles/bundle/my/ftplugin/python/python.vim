"=============================================================================
"     FileName: python.vim
"       Author: QianChenglong
"        Email: qian_cheng_long@163.com
"   LastChange: 2013-04-17 23:33:12
"      History:
"=============================================================================
" SECTION: Initialnization"{{{
if !exists("s:did_load")
    "定义脚本变量
    let s:Args = ''
    let s:ExecFileName = expand("%")
    let s:python_interpreter = 'C:\Python27\python.exe'

    " 配置选项
    set omnifunc=pythoncomplete#Complete
    let b:python_version_2 = 1

    "定义映射
    imap <buffer> <silent>   #!<tab> <ESC>,au<ESC>ggi#! /usr/bin/env python2<CR># coding=utf-8<CR><ESC>Go
    nmap <buffer>   <F6>    :call Execute()<CR>
    nnoremap <script> <silent> <F1>    :call MyPython_Help()<CR>

    "载入自动命令
    let s:did_load = 1
endif
"}}}
" SECTION: Function"{{{
" Function: MyC_Help()"{{{
" 用man查找光标下的单词
function! MyPython_Help()
    let word = inputdialog("Help what?", expand("<cword>"), 'cancel')
    if word == 'cancel'
        return
    endif
    exec printf("!\"%s -c help(\\\"%s\\\")\"",
                \ s:python_interpreter,
                \ word)
endfunction
"}}}
" Function: Execute()"{{{
fun! Execute()
    exe 'wa'
    call PassArgs()
    if s:Args == 'cancel'
        return
    endif
    if has("win32") || has("win64")
        silent exe printf("!%s \"%s %s\" & pause",
                    \ s:python_interpreter,
                    \ s:ExecFileName,
                    \ s:Args)
    else
        silent exe printf("!gnome-terminal -x bash -c '\"./%s\" %s ;echo %s %s'",
                    \ s:ExecFileName,
                    \ s:Args,
                    \ '--------------------------------------------------------------------------------',
                    \ ";read -n 1 -p \"Press anykey to exit...\"",
                    \)
    endif
endf
"}}}
" Function: PassArgs()"{{{
"读取参数
func! PassArgs()
    let s:Args = inputdialog("Args:", s:Args, 'cancel')
    return s:Args
endf "}}}
"}}}
