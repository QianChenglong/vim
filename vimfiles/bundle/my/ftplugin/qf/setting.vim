"=============================================================================
"     FileName: setting.vim
"         Desc: setting for quickfix
"       Author: QianChenglong
"        Email: qian_cheng_long@163.com
"      Version: 1.0
"   LastChange: 2012-08-01 16:38:38
"      History:
"=============================================================================
if exists("b:did_ftplugin")"{{{
    finish
endif
let b:did_ftplugin = 1
"}}}
"为quickfix窗口定义映射"{{{
nnoremap <buffer> <unique>   p   :cp<CR>
nnoremap <buffer> <unique>   n   :cn<CR>
nnoremap <buffer> <unique>   co  :col<CR>
nnoremap <buffer> <unique>   cn  :cnew<CR>
"}}}
"options"{{{
"setlocal modifiable
            "\ | silent exe 'g/^/s//\=line(".")." "/'
            "\ | setlocal nomodifiable
"}}}
