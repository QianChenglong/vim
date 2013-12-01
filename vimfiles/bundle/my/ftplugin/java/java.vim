" =============================================================================
"      FileName: java.vim
"        Author: QianChengLong
"         Email: qian_cheng_long@163.com
"      HomePage: www.QianChengLong.com
"       Version: 1.0
"    LastChange: 2013-07-11 19:55:09
"       History:
" =============================================================================
"SECTION: Initialnization"{{{
if !exists("s:MyJava_did_load")
    " SECTION: Options"{{{
    set cindent
    set cinoptions+=t0,b1,(0,g0
"}}}
    "定义全局变量"{{{
    let s:MyJava_Filename = expand("%:p") "文件名
    let s:MyJava_ExecFilename = expand("%:p:r") "执行文件名
    " let s:MyJava_ExecFilename = expand("%:p:h") . '/main'
    let s:MyJava_ExecFilename = 'a'
    let s:MyJava_WorkDir = expand("%:p:h") . '/' "工作目录
    let s:MyJava_MakefileDir = s:MyJava_WorkDir . '/obj'
    let s:MyJava_MakefilePathname = s:MyJava_MakefileDir . '/Makefile'
    let s:MyJava_MakeProjectPathname = s:MyJava_WorkDir . '/.project'
    let s:MyJava_Args = '' "程序执行参数
    let s:MyJava_APUE_cp_files="/home/qian/code/UNIX环境高级编程/附录B/B1/apue.h
                \/home/qian/code/UNIX环境高级编程/附录B/B2/apue_B2.c "
    let s:MyJava_MakeLibs = ''
    let s:MyJava_AutoMakePath = '/data/my_bin/AutoMakefile/cpp/main.sh'
    let s:boost_dir = "E:/Programming/Language/C++/Tool/库/boost/boost_1_53_0/boost"
    "}}}
    "定义映射"{{{
    nnoremap <script> <silent> <F1>    :call MyJava_Help()<CR>
    nmap    <F6>    :call MyJava_Exec()<CR>
    if has("win32") || has("win64")
        nmap    <F7>    :call MyJava_OneFileCompile()<CR>
    else
        nmap    <F7>    :call MyJava_Make()<CR>
    endif
    nmap    <F5>    :call MyJava_AutoMakefile()<CR>
    nmap    <F2>    :call MyJava_ReAutoMakefile()<CR>
    nmap    <F8>    :call MyJava_Compile()<CR>
    "为了学习unix(apue)写的
    "if matchstr(s:MyJava_Filename, "UNIX") != ''
    "    map     <F5> :call MyJava_UNIXCompile()<CR>
    "    command! -nargs=0   Ucd
    "                \ call MyJava_Ucd()
    "else
    "    map <F5> call MyJava_OneFileCompile()<CR>
    "endif
    "}}}
    "定义命令行命令"{{{
    command!    -nargs=0    GDB
                \ call MyJava_GDB()
    command!    -nargs=0    Clean
                \ call MyJava_Clean()
    "}}}
    "载入自动命令，当使用时，载入脚本"{{{
    exe printf('autocmd FuncUndefined  MyJava_* source %s', expand('<sfile>'))
    "}}}
    let s:MyJava_did_load = 1
else
    finish
endif
"}}}
" SECTION: Funtions"{{{
" Function: MyJava_Help()"{{{
" 用man查找光标下的单词
function! MyJava_Help()
    let n = inputdialog("Input which manual to search:", "3")
    if n != ""
        silent! exec "!gnome-terminal -x bash -c 'man " . n . " " . expand("<cword>") ";read -n1'"
    endif
endfunction
"}}}
"Function: MyJava_Make()"{{{
" 调用Makefile编译程序
function! MyJava_Make()
    exe 'cclose'
    exe "wa"
    if !filereadable(s:MyJava_MakefilePathname)
        echohl WarningMsg | echo "makefile doesn't exist!" | echohl none
        call MyJava_AutoMakefile()
    endif
    exe 'cd ' . s:MyJava_MakefileDir
    set makeprg=make
    exe "make"
    exe "cw"
    "exe "copen"
    exe 'cd ' . s:MyJava_WorkDir
endfunction"}}}
" Function: MyJava_OneFileCompile()"{{{
"编译单文件程序
function! MyJava_OneFileCompile()
    exe "wa"
    call MyJava_Clean()
    if expand("%:p:h") != getcwd()
        echohl WarningMsg | echo "Fail to compile, no such file in current directory!"
        | echohl none
        exit -1
    endif
    let sourcefile_name = expand("%:t")
    if (sourcefile_name == "" || &filetype != "java")
        echohl WarningMsg | echo "It's not a \"java\" file!"
        | echohl none
        exit -2
    endif
    set makeprg=javac\ %
    silent exe "make"
    echo "Compile finished!"
    "if has errors, open quickfix window, else don't
    exe "cw"
    "echo &filetype
    "if has errors, then jump to the first error
endfunction"}}}
" Function: MyJava_PassArgs()"{{{
"返回输入参数
function! MyJava_PassArgs()
    let s:MyJava_Args = inputdialog("arguments: 1 2 3 ...", s:MyJava_Args, "cancel")
    return s:MyJava_Args
endfunction
"}}}
" Function: MyJava_Exec()"{{{
"执行程序
function! MyJava_Exec()
    let s:MyJava_ExecFilename =  "Main"
    call MyJava_PassArgs()
    if s:MyJava_Args == "cancel"
        return
    endif

    if has("win32") || has("win64")
        " silent exe printf("!%s \"%s\" |  c++filt -t & pause",
        silent exe printf("!java %s \"%s\" & pause",
                    \ s:MyJava_ExecFilename,
                    \ s:MyJava_Args)
    else
        exe printf("!gnome-terminal -x bash -c '%s %s;echo %s ;read -n 1 -p  \"%s\"'",
                    \ s:MyJava_ExecFilename, s:MyJava_Args,
                    \ '--------------------------------------------------------------------------------',
                    \ 'press entry exit...')
    endif
endfunction"}}}
" Function: MyJava_Clean()"{{{
"清理中间文件，以便于重新编译
function! MyJava_Clean()
    exe 'cclose'
    ""删除单文件编译的程序"{{{
    "if (filereadable(s:MyJava_ExecFilename))
    "    exe "!rm " . s:MyJava_ExecFilename
    "endif"}}}
    "进入makefile所在目录执行make clean"{{{
    if isdirectory(s:MyJava_MakefileDir)
        exe 'lcd ' . s:MyJava_MakefileDir
        echo s:MyJava_MakefileDir
        exe '!make clean'
        exe 'lcd ' . s:MyJava_WorkDir
    endif"}}}
endfunc"}}}
"}}}
