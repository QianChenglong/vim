"=============================================================================
"     FileName: make.vim
"       Author: QianChenglong
"        Email: qian_cheng_long@163.com
"     HomePage: waiting...
"      Version: 0.0.1
"   LastChange: 2013-07-25 23:38:45
"      History:
"=============================================================================
" SECTION: Initiallization"{{{
let s:Args = ''
" 定义脚本变量
let s:ExecFileName = expand("%:p")
"}}}
" SECTION: Options"{{{
set textwidth=110
set lines=30 columns=114
set noexpandtab
"设置最大列数，超出后自动换行
"set colorcolumn=111
"}}}
"}}}
" SECTION: Maps"{{{
nnoremap <buffer>   <F6>    :call MyMake_Exec()<CR>
nnoremap <buffer>   <F1>    :help <C-R>=expand("<cword>")<CR><C-D>
"}}}
" SECTION: Functions"{{{
" Function: MyMake_Exec()"{{{
fun! MyMake_Exec()
    exe 'wa'
    call PassArgs()
    if s:Args == 'cancel'
        return
    endif

    if has("win32")
        silent exe printf("!make %s & pause",
                    \ s:Args)
    else
        silent exe printf("!make %s",
                    \ s:Args)
    endif
endfun
"}}}
" Function: PassArgs()"{{{
"读取参数
func! PassArgs()
    let s:Args = inputdialog("Args:", s:Args, 'cancel')
    return s:Args
endf "}}}

"}}}
