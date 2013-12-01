"=============================================================================
"     FileName: perl.vim
"         Desc: 为学习perl写的辅助脚本
"       Author: QianChenglong
"        Email: qian_cheng_long@163.com
"   LastChange: 2012-07-22 08:06:51
"      History:
"=============================================================================

if !exists("s:MyPerl_did_load")
    "定义脚本变量
    let s:MyPerl_Args = ''
    let s:MyPerlExecFilename = expand("%:p")

    "定义映射
    imap <buffer> <silent>   #!<tab> #! /usr/bin/env perl<ESC>,au
    nmap <buffer>   <F5>    :call MyPerl_Execute()<CR>
    
    "载入自动命令
    let s:MyPerl_did_load = 1
    exe 'autocmd FuncUndefined MyPerl* source ' . expand("<sfile>")
endif

"执行Perl脚本"{{{
fun! MyPerl_Execute()
    exe 'wa'
    silent! exe "!chmod +x " . s:MyPerlExecFilename
    call MyPerl_PassArgs()
    if s:MyPerl_Args == 'cancel'
        return
    endif
    silent! exe "!gnome-terminal -x bash -c '" . s:MyPerlExecFilename . " " . s:MyPerl_Args . ";read'"
endf"}}}

"读取参数"{{{
func! MyPerl_PassArgs() 
    let s:MyPerl_Args = inputdialog("MyPerl_Args:", s:MyPerl_Args, 'cancel')
    return s:MyPerl_Args
endf "}}}
