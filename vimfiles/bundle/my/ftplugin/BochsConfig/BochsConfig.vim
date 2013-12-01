" =============================================================================
"      FileName: BochsConfig.vim
"          Desc:
"        Author: QianChengLong
"         Email: qian_cheng_long@163.com
"      HomePage: www.QianChengLong.com
"       Version: 1.0
"    LastChange: 2013-08-28 10:20:59
"       History:
" =============================================================================
" SECTION: Initialnization"{{{
if !exists("s:did_load")
    "定义脚本变量
    let s:Args = ''
    let s:ExecFileName = expand("%:p")
    let s:bochs = 'E:\OS\CrossPlatform\Bochs\Tool\Win\Bochs-2.6.2\bochs.exe'

    " 配置选项"{{{
    set ff=unix
    set fileencoding=utf-8
    set comments=:#
    "}}}
    "定义映射
    nmap <buffer>   <F6>    :call <SID>Execute()<CR>
    imap #!<TAB>    <ESC>,au<ESC>ggi@echo off<CR><ESC>Go

    "载入自动命令
    let s:did_load = 1
endif
"}}}
" SECTION: Function"{{{
" Function: Execute()"{{{
fun! s:Execute()
    exe 'wa'
    if has("win32") || has("win64")
        silent exe iconv(
                    \printf("!%s -f \"%s\"", s:bochs, s:ExecFileName,),
                    \"utf-8", "chinese")
    endif
endf
"}}}
