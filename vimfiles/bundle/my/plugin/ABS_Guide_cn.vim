"=============================================================================
"     FileName: ABS_Guide_cn.vim
"         Desc: 为学习ABS_Guide_cn写的脚本
"       Author: QianChenglong
"        Email: qian_cheng_long@163.com
"      Version: 1.0
"   LastChange: 2012-07-27 13:53:34
"      History:
"=============================================================================

"SECTION: Script init stuff"{{{
if exists("g:loaded_ABS_Guide_cn")
    finish
endif

let g:loaded_ABS_Guide_cn = 1

if matchstr(expand("%:p"), "ABS_Guide_cn") == ''
    finish
endif
"}}}
"SECTION: Set options"{{{
let s:save_cpo = &cpo
set cpo&vim
let &cpo = s:save_cpo
"}}}
"SECTION: Maps"{{{
nnoremap <Plug>ClearNumbersAndLines    :call <SID>ABS_Guide_cn_ClearNumbersAndLines()<CR>
"}}}
"SECTION: Default maps"{{{
if !hasmapto("<Plug>ClearNumbersAndLines", "n")
    nmap <unique>  <F6>    <Plug>ClearNumbersAndLines
endif
"}}}
"SECTION: Functions"{{{
" Function: s:ABS_Guide_cn_ClearNumbersAndLines() "{{{
" clear line numbers and null line
function s:ABS_Guide_cn_ClearNumbersAndLines()
    normal mm
    "clear numbers
    silent! exe '%s;^\d\+\s*;;g'
    "clear <space>#<space>
    silent! exe '%s;^\s*#\s*$;;g'
    "clear null lines
    silent! exe '%s;^\n$;;g'
    normal gg=G
    normal 'm
endfunction "}}}
"}}}

