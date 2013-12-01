"=============================================================================
"     FileName: my_asm.vim
"         Desc: 汇编中的配置
"       Author: QianChenglong
"        Email: qian_cheng_long@163.com
"     HomePage: waiting...
"      Version: 0.0.1
"   LastChange: 2012-03-03 15:00:51
"      History:
"=============================================================================
"tab键设置成8个空格
set tabstop=8
"插入模式里: 插入 <Tab> 时使用合适数量的空格
set expandtab
"每次保存文件时，自动转换格式和编码
"autocmd BufWritePost *.asm :call BufWritePost_function()
"function BufWritePost_function()
"	execute "set fileformat=dos"
"	execute "set fileencoding=gb18030"
"endfunction
"========================================================
" Highlight semicolon
"========================================================
syn match       semicolon         display ";"
syn match       cheseSemicolon    display "；"

hi semicolon             guifg=#8B8B7A
hi cheseSemicolon    gui=standout       guifg=#FFFFFF

let g:SuperTabDefaultCompletionType = "<c-x><c-p>"


nmap    <F5>    :call NASM_One_File_Compile()<CR>

" Function: MyC_OneFileCompile()"{{{
"编译单文件程序
function! NASM_One_File_Compile()
    exe "wa"
    set makeprg=nasm\ -o\ %<\ %
    exe "make"
endfunction"}}}
