"=============================================================================
"     FileName: Ctags.vim
"         Desc: ctags setting
"       Author: QianChenglong
"        Email: qian_cheng_long@163.com
"      Version: 1.0
"   LastChange: 2012-08-01 20:44:48
"      History:
"=============================================================================
" SECTION: Init"{{{
if exists("g:loaded_Ctags")
    finish
endif

let g:loaded_Ctags = 1
let s:save_cpo = &cpo
set cpo&vim
"}}}
" SECTION: Varibles"{{{
if !exists("g:Ctags_bin")
    finish
endif
let s:bin=g:Ctags_bin
"}}}
" SECTION: Maps"{{{
nnoremap <Plug>Ctags    :call <SID>Ctags()<CR>
"}}}
" SECTION: Default maps"{{{
if !hasmapto("<Plug>Ctags", "n")
    nmap <unique>  <A-t>    <Plug>Ctags
endif
"}}}
" SECTION: Functions"{{{
" Function: Ctags()"{{{
fun! s:Ctags()
    if !exists("g:Ctags_option")
        let g:Ctags_option=""
    endif
    let s:option=g:Ctags_option
    if !exists("g:Ctags_ignore")
        let g:Ctags_ignore=""
    endif

    if g:Ctags_ignore != ""
        let s:option="-I" . g:Ctags_ignore . s:option
    endif
    exe 'wa'
    exe printf("!%s %s .",
    \ s:bin,
    \ s:option)
    echohl Finished | echo 'Ctags finished' | echohl none
endf "}}}
"}}}
let &cpo = s:save_cpo
