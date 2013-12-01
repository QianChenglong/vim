" =============================================================================
"      FileName: registry.vim
"          Desc:
"        Author: QianChengLong
"         Email: qian_cheng_long@163.com
"      HomePage: www.QianChengLong.com
"       Version: 1.0
"    LastChange: 2013-07-31 01:16:57
"       History:
" =============================================================================
" SECTION: Initialnization"{{{
if !exists("s:did_load")
    "定义脚本变量"{{{
    let s:ExecFileName = expand("%:p")
    "}}}
    " 配置选项"{{{
    set ff=dos
    set fileencoding=chinese
    "}}}
    "定义映射"{{{
    imap <buffer>   #!<tab>  Windows Registry Editor Version 5.00<CR><CR>
    nmap <buffer>   <F6>    :call <SID>Execute()<CR>
    "}}}
    "载入自动命令
    let s:did_load = 1
endif
"}}}
" SECTION: Function"{{{
" Function: Execute()"{{{
fun! s:Execute()
    exe 'wa'
    silent exe iconv(printf("!%s & pause",
                \ s:ExecFileName),
                \ "utf-8", "chinese")
endf
"}}}
