"=============================================================================
"     FileName: vbs.vim
"       Author: QianChenglong
"        Email: qian_cheng_long@163.com
"   LastChange: 2013-04-23 22:51:38
"      History:
"=============================================================================
" SECTION: Initialnization"{{{
if !exists("s:did_load")
    " SECTION : Options"{{{
    set cindent
    set fileencoding=chinese
    set commentstring='%s'
    "}}}
    "定义脚本变量
    let s:Args = ''
    let s:ExecFileName = expand("%:p")

    "定义映射
    nmap <buffer>   <F6>    :call Execute()<CR>

    "载入自动命令
    let s:did_load = 1
    exe 'autocmd FuncUndefined MyShell* source ' . expand("<sfile>")
endif
"}}}
" SECTION: Function"{{{
" Function: Execute()"{{{
fun! Execute()
    silent exe 'wa'
    call PassArgs()
    if s:Args == 'cancel'
        return
    endif
    silent exe printf("!\"%s\" %s",
                \ s:ExecFileName,
                \ s:Args,
                \)
endf
"}}}
" Function: PassArgs()"{{{
"读取参数
func! PassArgs()
    let s:Args = inputdialog("Args:", s:Args, 'cancel')
    return s:Args
endf "}}}
"}}}
