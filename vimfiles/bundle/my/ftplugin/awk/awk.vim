" =============================================================================
"      FileName: awk.vim
"          Desc: awk setting
"        Author: QianChenglong
"         Email: qian_cheng_long@163.com
"       Version: 1.0
"    LastChange: 2012-08-09 18:41:33
"       History:
" =============================================================================
" SECTION: Initialnization"{{{
if !exists("s:MyAwk_did_load")
    "定义脚本变量
    let s:MyAwk_Args = ''
    let s:MyAwk_ExecFilename = expand("%:p")

    "定义映射
    imap <buffer> <silent>   #!<tab> #! /usr/bin/awk -f<ESC>,au
    nmap <buffer>   <F6>    :call MyAwk_Execute()<CR>

    "载入自动命令
    let s:MyAwk_did_load = 1
    exe 'autocmd FuncUndefined MyAwk* source ' . expand("<sfile>")
endif"}}}
" SECTION: Option"{{{
" SECTION: Map"{{{
" iunmap! {
"}}}
"}}}
" SECTION: Function"{{{
" Function: MyAwk_Execute()"{{{
" 执行awk脚本
fun! MyAwk_Execute()
    silent exe 'wa'
    silent exe "!chmod +x '" . s:MyAwk_ExecFilename . "'"
    call MyAwk_PassArgs()
    if s:MyAwk_Args == 'cancel'
        return
    endif
    exe printf("!gnome-terminal -x bash -c 'awk -f %s %s ;echo %s %s'",
                \ s:MyAwk_ExecFilename,
                \ s:MyAwk_Args,
                \ '--------------------------------------------------------------------------------',
                \ ";read -n 1 -p \"press anykey exit...\"",
                \)
endf"}}}
" Function: MyAwk_PassArgs()"{{{
" 读取参数
func! MyAwk_PassArgs()
    let s:MyAwk_Args = inputdialog("MyAwk_Args:", s:MyAwk_Args, 'cancel')
    return s:MyAwk_Args
endf "}}}
"}}}
