"=============================================================================
"     FileName: shell.vim
"         Desc: 为学习shell写的辅助脚本
"       Author: QianChenglong
"        Email: qian_cheng_long@163.com
"   LastChange: 2012-06-28 21:24:50
"      History:
"=============================================================================
" SECTION: Initialnization"{{{
if !exists("s:MyShell_did_load")
    "定义脚本变量
    let s:MyShell_Args = ''
    let s:MyShell_ExecFilename = expand("%:p")

    "定义映射
    imap <buffer> <silent>   #!<tab> #! /bin/bash<ESC>,au
    nmap <buffer>   <F6>    :call MyShell_Execute()<CR>

    "载入自动命令
    let s:MyShell_did_load = 1
    exe 'autocmd FuncUndefined MyShell* source ' . expand("<sfile>")
endif
"}}}
" SECTION: Function"{{{
" Function: MyShell_Execute()"{{{
" 执行shell脚本
fun! MyShell_Execute()
    silent exe 'wa'
    silent exe "!chmod +x '" . s:MyShell_ExecFilename . "'"
    call MyShell_PassArgs()
    if s:MyShell_Args == 'cancel'
        return
    endif
    silent exe printf("!gnome-terminal -x bash -c '\"%s\" %s \;%s'",
                \ s:MyShell_ExecFilename,
                \ s:MyShell_Args,
                \ "read -n 1")
                " \ '--------------------------------------------------------------------------------',
                " \ ";read -n 1 -p \"press anykey exit...\"")
endf
"}}}
" Function: MyShell_PassArgs()"{{{
"读取参数
func! MyShell_PassArgs()
    let s:MyShell_Args = inputdialog("MyShell_Args:", s:MyShell_Args, 'cancel')
    return s:MyShell_Args
endf "}}}
"}}}
