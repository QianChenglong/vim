if exists("b:did_list_ftplugin")
    finish
endif
let b:did_list_ftplugin = 1

autocmd BufWritePre,FileWritePre <buffer> :call <SID>Adjust()

" Function: s:Adjust() "{{{
" 调用EasyAlign对齐字段
function s:Adjust()
    exe "%EasyAlign * \\ "
endfunction "}}}
