"=============================================================================
"     FileName: ArchPkgInstall.vim
"       Author: QianChenglong
"        Email: qian_cheng_long@163.com
"   LastChange: 2013-08-31 13:01:19
"      History:
"=============================================================================
" SECTION: Initialnization"{{{
if !exists("s:did_load")
    "定义脚本变量
    let s:Args = ''
    let s:ExecFileName = expand("%")

    " 配置选项

    "载入自动命令
    let s:did_load = 1
endif
"}}}
" SECTION: Function"{{{
" Function: MyC_Help()"{{{
" 用man查找光标下的单词
function! MyPython_Help()
    let word = inputdialog("Help what?", expand("<cword>"), 'cancel')
    if word == 'cancel'
        return
    endif
    exec printf("!\"%s -c help(\\\"%s\\\")\"",
                \ s:python_interpreter,
                \ word)
endfunction
"}}}
"}}}
