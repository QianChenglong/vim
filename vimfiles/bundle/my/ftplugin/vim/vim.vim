"=============================================================================
"     FileName: my_vim.vim
"         Desc: 为了学习vim脚本
"       Author: QianChenglong
"        Email: qian_cheng_long@163.com
"     HomePage: waiting...
"      Version: 0.0.1
"   LastChange: 2012-03-10 21:46:49
"      History:
"=============================================================================
" SECTION: Initiallization"{{{
if exists("b:MyVim_did_ftplugin")
    finish
endif
let b:MyVim_did_ftplugin = 1
"}}}
" SECTION: Options"{{{
" set textwidth=110
" set lines=30 columns=114
"设置最大列数，超出后自动换行
"set colorcolumn=111
" 显示tab和换行"{{{
set list
"tab 显示成>-,结尾处的空格显示-
set listchars=tab:>-,trail:-
" 不要自动在新行添加注释
setlocal formatoptions-=r
setlocal formatoptions-=o
"}}}
"}}}
" SECTION: Maps"{{{
nnoremap <buffer>   <F6>    :call MyVim_Exec()<CR>
nnoremap <buffer>   <F1>    :help <C-R>=expand("<cword>")<CR><C-D>
"}}}
" SECTION: Functions"{{{
" Function: MyVim_Exec()"{{{
fun! MyVim_Exec()
    exe 'wa'
    let name = expand("%:p")
    echo name
    exec 'so ' . name
endfun"}}}
"}}}
