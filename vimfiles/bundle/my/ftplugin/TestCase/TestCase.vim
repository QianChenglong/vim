"=============================================================================
"     FileName: TestCase.vim
"       Author: QianChenglong
"        Email: qian_cheng_long@163.com
"   LastChange: 2013-08-09 10:33:05
"      History:
"=============================================================================
" SECTION: Initialnization"{{{
if !exists("s:did_load")
    "定义脚本变量
    let s:ExecFileName = expand("%")

    " 设置选项"{{{
    set commentstring=#%s
    "}}}
    "定义映射
    nmap <buffer>   <F6>    :call <SID>Execute()<CR>

    "载入自动命令
    let s:did_load = 1
endif
"}}}
" SECTION: Function"{{{
" Function: Execute()"{{{
fun! s:Execute()
    exe 'wa'
    silent exe iconv('!"E:/Programming/Language/Python/Code/my/调用驱动/Test.py" & pause', 'utf-8', 'chinese')
endf
"}}}
"}}}
