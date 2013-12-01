"=============================================================================
"     FileName: my_asm.vim
"         Desc: ����е�����
"       Author: QianChenglong
"        Email: qian_cheng_long@163.com
"     HomePage: waiting...
"      Version: 0.0.1
"   LastChange: 2012-03-03 15:00:51
"      History:
"=============================================================================
"tab�����ó�8���ո�
set tabstop=8
"����ģʽ��: ���� <Tab> ʱʹ�ú��������Ŀո�
set expandtab
"ÿ�α����ļ�ʱ���Զ�ת����ʽ�ͱ���
"autocmd BufWritePost *.asm :call BufWritePost_function()
"function BufWritePost_function()
"	execute "set fileformat=dos"
"	execute "set fileencoding=gb18030"
"endfunction
"========================================================
" Highlight semicolon
"========================================================
syn match       semicolon         display ";"
syn match       cheseSemicolon    display "��"

hi semicolon             guifg=#8B8B7A
hi cheseSemicolon    gui=standout       guifg=#FFFFFF

let g:SuperTabDefaultCompletionType = "<c-x><c-p>"


nmap    <F5>    :call NASM_One_File_Compile()<CR>

" Function: MyC_OneFileCompile()"{{{
"���뵥�ļ�����
function! NASM_One_File_Compile()
    exe "wa"
    set makeprg=nasm\ -o\ %<\ %
    exe "make"
endfunction"}}}
