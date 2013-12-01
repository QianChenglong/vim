" =============================================================================
"      FileName: ruby.vim
"          Desc:
"        Author: QianChengLong
"         Email: qian_cheng_long@163.com
"      HomePage: www.QianChengLong.com
"       Version: 1.0
"    LastChange: 2013-05-08 16:44:24
"       History:
" =============================================================================
" SECTION: Initialnization"{{{
if !exists("s:did_load")
    "定义脚本变量
    let s:Args = ''
    let s:ExecFileName = expand("%:p")
    let s:ruby_interpreter = 'C:\\ruby\\bin\\ruby.exe'

    "定义映射
    imap <buffer> <silent>   #!<tab> #! /usr/bin/env ruby<CR>
    nmap <buffer>   <F6>    :call Execute()<CR>

    "载入自动命令
    let s:did_load = 1
endif
"}}}
" SECTION: Function"{{{
" Function: Execute()"{{{
fun! Execute()
    exe 'wa'
    call PassArgs()
    if s:Args == 'cancel'
        return
    endif
    if has("win32") || has("win64")
        silent exe printf("!%s \"%s %s\" & pause",
                    \ s:ruby_interpreter,
                    \ s:ExecFileName,
                    \ s:Args)
    else
        silent exe printf("!gnome-terminal -x bash -c '\"%s\" %s ;echo %s %s'",
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
