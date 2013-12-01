" =============================================================================
"      FileName: sed.vim
"          Desc: sed setting
"        Author: QianChenglong
"         Email: qian_cheng_long@163.com
"       Version: 1.0
"    LastChange: 2012-08-10 10:29:45
"       History:
" =============================================================================
" SECTION: Initialnization"{{{
if !exists("s:MySed_did_load")
    "定义脚本变量
    let s:MySed_Args = ''
    let s:MySed_ExecFilename = expand("%:p")

    "定义映射
    imap <buffer> <silent>   #!<tab> #! /usr/bin/sed -f<ESC>,au
    nmap <buffer>   <F6>    :call MySed_Execute()<CR>

    "载入自动命令
    let s:MySed_did_load = 1
    exe 'autocmd FuncUndefined MySed* source ' . expand("<sfile>")
endif"}}}
" SECTION: Option"{{{
" SECTION: Map"{{{
iunmap {
"}}}
"}}}
" SECTION: Function"{{{
" Function: MySed_Execute()"{{{
" 执行awk脚本
fun! MySed_Execute()
    silent exe 'wa'
    silent exe "!chmod +x '" . s:MySed_ExecFilename . "'"
    call MySed_PassArgs()
    if s:MySed_Args == 'cancel'
        return
    endif
    exe printf("!gnome-terminal -x bash -c 'sed -f %s %s ;echo %s %s'",
                \ s:MySed_ExecFilename,
                \ s:MySed_Args,
                \ '--------------------------------------------------------------------------------',
                \ ";read -n 1 -p \"press anykey exit...\"",
                \)
endf"}}}
" Function: MySed_PassArgs()"{{{
" 读取参数
func! MySed_PassArgs() 
    let s:MySed_Args = inputdialog("MySed_Args:", s:MySed_Args, 'cancel')
    return s:MySed_Args
endf "}}}
"}}}
