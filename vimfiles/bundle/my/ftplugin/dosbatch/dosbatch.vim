" =============================================================================
"      FileName: dosbatch.vim
"          Desc:
"        Author: QianChengLong
"         Email: qian_cheng_long@163.com
"      HomePage: www.QianChengLong.com
"       Version: 1.0
"    LastChange: 2013-07-30 23:55:05
"       History:
" =============================================================================
" SECTION: Initialnization"{{{
if !exists("s:did_load")
    "定义脚本变量
    let s:Args = ''
    let s:ExecFileName = expand("%:p")

    " 配置选项"{{{
    set ff=dos
    set fileencoding=chinese
    "}}}
    "定义映射
    nmap <buffer>   <F6>    :call Execute()<CR>
    imap #!<TAB>    <ESC>,au<ESC>ggi@echo off<CR><ESC>Go

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
    silent exe iconv(printf("!%s \"%s\" & pause",
                \ s:ExecFileName,
                \ s:Args), "utf-8", "chinese")
endf
"}}}
" Function: PassArgs()"{{{
"读取参数
func! PassArgs()
    let s:Args = inputdialog("Args:", s:Args, 'cancel')
    return s:Args
endf "}}}
"}}}
