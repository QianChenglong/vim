if exists("b:did_ftplugin")
    finish
endif
let b:did_todo_ftplugin = 1

autocmd BufWritePre,FileWritePre <buffer> :call <SID>Adjust()

" Function: s:Adjust() "{{{
" 调用EasyAlign对齐字段
function s:Adjust()
    exe '%EasyAlign * |'
endfunction "}}}
