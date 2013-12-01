" =============================================================================
"      FileName: cpp.vim
"         Desc: 要编写的文件种类太多了，需要把配置分开，这是为c/c++
"        Author: QianChengLong
"         Email: qian_cheng_long@163.com
"      HomePage: www.QianChengLong.com
"       Version: 1.0
"    LastChange: 2013-04-27 13:04:07
"       History:
" =============================================================================
"SECTION: Initialnization"{{{
if !exists("s:MyCpp_did_load")
    " SECTION: Options"{{{
    " 为C程序提供自动缩进"{{{
    set cindent
    "}}}
    "设置C程序缩进格式"{{{
    set cinoptions+=t0,b1,(0,g0
    "}}}
       " 设置tags"{{{
       set tags+=E:\vim\Setting\vimfiles\tags\cpp\tags,E:\vim\Setting\vimfiles\tags\cppHead\tags,E:\vim\Setting\vimfiles\tags\cppSTL
        "}}}
       " 搜索路径path"{{{
       if has("win32") || has("win64")
           set path+=D:/mingw-GCC4.4/lib/gcc/mingw32/4.4.0/include/c++,
                       \C:/Program\\\ Files\\\ (x86)/Microsoft\\\ Visual\\\ Studio\\\ 11.0/VC/include,
       else
           set path+=/usr/include,
                       \/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.1/../../../../include/c++/4.8.1,
                       \/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.1/../../../../include/c++/4.8.1/x86_64-unknown-linux-gnu,
                       \/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.1/../../../../include/c++/4.8.1/backward,
                       \/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.1/include,
                       \/usr/local/include,
                       \/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.1/include-fixed

       endif
       "}}}

"}}}
    "定义全局变量"{{{
    let s:MyCpp_Filename = expand("%:p") "文件名
    let s:MyCpp_ExecFilename = expand("%:p:r") "执行文件名
    " let s:MyCpp_ExecFilename = expand("%:p:h") . '/main'
    let s:MyCpp_ExecFilename = 'main.exe'
    if has("win32") || has("win64")
        let s:MyCpp_Makefile = 'E:\OS\CrossPlatform\Make\Code\utility\Makefile\C++_Makefile'
    else
        let s:MyCpp_Makefile = '/data/OS/CrossPlatform/Make/Code/utility/Makefile/C++_Makefile'
    endif
    let s:MyCpp_WorkDir = expand("%:p:h") . '/' "工作目录
    let s:MyCpp_MakefileDir = s:MyCpp_WorkDir . '/obj'
    let s:MyCpp_MakefilePathname = s:MyCpp_MakefileDir . '/Makefile'
    let s:MyCpp_MakeProjectPathname = s:MyCpp_WorkDir . '/.project'
    let s:MyCpp_Args = '' "程序执行参数
    let s:MyCpp_APUE_cp_files="/home/qian/code/UNIX环境高级编程/附录B/B1/apue.h
                \/home/qian/code/UNIX环境高级编程/附录B/B2/apue_B2.c "
    let s:MyCpp_MakeLibs = ''
    let s:MyCpp_AutoMakePath = '/data/my_bin/AutoMakefile/cpp/main.sh'
    let s:boost_dir = "E:/Programming/Language/C++/Tool/库/boost/boost_1_53_0/boost"
    "}}}
    "定义映射"{{{
    nnoremap<buffer> <script> <silent> <F1>    :call MyCpp_Help()<CR>
    nmap<buffer>    <F6>    :call <SID>MyCpp_Exec()<CR>
    nmap<buffer>    <F7>    :call <SID>MyCpp_Make()<CR>
    " nmap    <F5>    :call MyCpp_AutoMakefile()<CR>
    " nmap    <F2>    :call MyCpp_ReAutoMakefile()<CR>
    " nmap    <F8>    :call MyCpp_Compile()<CR>
    "为了学习unix(apue)写的
    "if matchstr(s:MyCpp_Filename, "UNIX") != ''
    "    map     <F5> :call MyCpp_UNIXCompile()<CR>
    "    command! -nargs=0   Ucd
    "                \ call MyCpp_Ucd()
    "else
    "    map <F5> call MyCpp_OneFileCompile()<CR>
    "endif
    "}}}
    "定义命令行命令"{{{
    command!    -nargs=0    GDB
                \ call MyCpp_GDB()
    command!    -nargs=0    Clean
                \ call MyCpp_Clean()
    "}}}
    "载入自动命令，当使用时，载入脚本"{{{
    exe printf('autocmd FuncUndefined  MyCpp_* source %s', expand('<sfile>'))
    "}}}
    let s:MyCpp_did_load = 1
else
    finish
endif
"}}}
" SECTION: Funtions"{{{
" Function: MyCpp_Help()"{{{
" 用man查找光标下的单词
function! MyCpp_Help()
    let n = inputdialog("Input which manual to search:", "3")
    if n != ""
        silent! exec "!gnome-terminal -x bash -c 'man " . n . " " . expand("<cword>") ";read -n1'"
    endif
endfunction
"}}}
" Function: MyCpp_Ucd()"{{{
function! MyCpp_Ucd()
    silent! execute "!'/home/qian/my_bin/ucd.sh'"
endfunction
"}}}
" Function: MyCpp_APUE_Cp()"{{{
function! MyCpp_APUE_Cp()
    if !filereadable("apue.h")
        exe "!cp " . s:MyCpp_APUE_cp_files . s:MyCpp_WorkDir
    endif
endfunction"}}}
" Function: MyCpp_UNIXCompile()"{{{
function! MyCpp_UNIXCompile()
    exe "wa"
    call MyCpp_Clean()
    call MyCpp_APUE_Cp()
    set makeprg=gcc\ -g\ -Wall\ -o\ %<\ %\ apue_B2.o
    exe "make"
    "if has errors, open quickfix window, else don't
    exe "cw"
    "echo &filetype
    "if has errors, then jump to the first error
    "echo !filereadable(s:MyCpp_ExecFilename)
    "if &filetype == "qf" || !filereadable(s:MyCpp_ExecFilename)
    "    "exe "cc"
    "else
    "    "echo "successfully!"
    "    "echo s:MyCpp_ExecFilename
    "    "silent! execute "!chmod +x " . s:MyCpp_ExecFilename
    "endif
endfunction"}}}
"Function: MyCpp_Make()"{{{
" 调用Makefile编译程序
function! s:MyCpp_Make()
    exe "wa"
    " echo s:MyCpp_Makefile
    if !filereadable("Makefile")
        exe "!cp " . s:MyCpp_Makefile . " ./Makefile"
    endif
    set makeprg=make
    silent exe "make"
    exe "cw"
    echohl "Fnished"
endfunction"}}}
" Function: MyCpp_OneFileCompile()"{{{
"编译单文件程序
function! MyCpp_OneFileCompile()
    exe "wa"
    call MyCpp_Clean()
    if expand("%:p:h") != getcwd()
        echohl WarningMsg | echo "Fail to compile, no such file in current directory!"
        | echohl none
        exit -1
    endif
    let sourcefile_name = expand("%:t")
    if (sourcefile_name == "" || &filetype != "cpp")
        echohl WarningMsg | echo "It's not a \"cpp\" file!"
        | echohl none
        exit -2
    endif
    " set makeprg=g++\ -std=c++0x\ -g\ -Wall\ -o\ %<\ %
    if has("unix")
        set makeprg=clang++\ -std=c++0x\ -g\ -Wall\ -o\ %<\ %
    else
        set makeprg=clang++\ -std=c++0x\ -g\ -Wall\ -o\ %<\ %\ -IE:/Programming/Language/C++/Tool/lib/boost/boost_1_53_0
    endif
    silent! exe "make"
    echo "Compile finished!"
    "if has errors, open quickfix window, else don't
    exe "cw"
    "echo &filetype
    "if has errors, then jump to the first error
endfunction"}}}
" Function: MyCpp_PassArgs()"{{{
"返回输入参数
function! MyCpp_PassArgs()
    let s:MyCpp_Args = inputdialog("arguments: 1 2 3 ...", s:MyCpp_Args, "cancel")
    return s:MyCpp_Args
endfunction
"}}}
" Function: MyCpp_Exec()"{{{
"执行程序
function! s:MyCpp_Exec()
    if executable(s:MyCpp_ExecFilename) == 0
        if has("win32") || has("win64")
            let s:MyCpp_ExecFilename =  expand("%:r")
        else
            let s:MyCpp_ExecFilename = './' . expand("%:r")
        endif
        if executable(s:MyCpp_WorkDir . s:MyCpp_ExecFilename) == 0
            echohl WarningMsg | echo "NO such file to execute"
            let s:MyCpp_ExecFilename = inputdialog("Execute FileName:", './main', 'cancel')
            if s:MyCpp_ExecFilename == 'cancel'
                return
            elseif executable(s:MyCpp_ExecFilename) == 0
                echohl WarningMsg | echo "NO such file to execute"
                return
            endif
        endif
    endif
    call MyCpp_PassArgs()
    if s:MyCpp_Args == "cancel"
        return
    endif

    if has("win32") || has("win64")
        " silent exe printf("!%s \"%s\" |  c++filt -t & pause",
        " exe iconv(printf("!%s \"%s\" | c++filt -t & pause",
            " \ s:MyCpp_ExecFilename,
            " \ s:MyCpp_Args),
            " \ "utf-8", "chinese")
        silent exe iconv(printf("!%s %s & pause",
            \ s:MyCpp_ExecFilename,
            \ s:MyCpp_Args),
            \ "utf-8", "chinese")
    else
        silent exe printf("!gnome-terminal -x bash -c '%s %s;echo %s ;read -n 1 -p  \"%s\"'",
                    \ s:MyCpp_ExecFilename, s:MyCpp_Args,
                    \ '--------------------------------------------------------------------------------',
                    \ 'press entry exit...')
    endif
endfunction"}}}
" Function: MyCpp_Clean()"{{{
"清理中间文件，以便于重新编译
function! MyCpp_Clean()
    exe 'cclose'
    ""删除单文件编译的程序"{{{
    "if (filereadable(s:MyCpp_ExecFilename))
    "    exe "!rm " . s:MyCpp_ExecFilename
    "endif"}}}
    "进入makefile所在目录执行make clean"{{{
    if isdirectory(s:MyCpp_MakefileDir)
        exe 'lcd ' . s:MyCpp_MakefileDir
        echo s:MyCpp_MakefileDir
        exe '!make clean'
        exe 'lcd ' . s:MyCpp_WorkDir
    endif"}}}
endfunc"}}}
" Function: MyCpp_GDB()"{{{
"调用GDB调试
function! MyCpp_GDB()
    "call MyCpp_OneFileCompile()
    if (executable(s:MyCpp_ExecFilename) == 0)
        echohl WarningMsg | echo "NO such file to debug" | echohl none
        return -2
    else
        silent! execute "!gnome-terminal -e 'gdb "  . s:MyCpp_ExecFilename . "'"
    endif
endfunction
"}}}
" Function: MyCpp_AutoMakefile()"{{{
"自动生成makefile
function! MyCpp_AutoMakefile()
    if matchstr(s:MyCpp_Filename, "UNIX") != ''
        call MyCpp_APUE_Cp()
    endif
    call MyCpp_MakeProject()
    "silent exe '!mkdir obj'
    "exe 'lcd ' . s:MyCpp_MakefileDir
    "exe '!rm ' . MyCpp_WorkDir . '/obj'
    "exe '!rm -rf ' . s:MyCpp_MakefileDir
    exe '!' . s:MyCpp_AutoMakePath . s:MyCpp_MakeLibs
    "exe 'lcd ' . s:MyCpp_WorkDir
endfunction"}}}
" Function: MyCpp_ReAutoMakefile()"{{{
function! MyCpp_ReAutoMakefile()
    "复制apue的一些文件
    if matchstr(s:MyCpp_Filename, "UNIX") != ''
        call MyCpp_APUE_Cp()
    endif
    exe '!rm -rf ' . s:MyCpp_MakefileDir
    exe '!rm -rf ' . s:MyCpp_MakeProjectPathname
    call MyCpp_MakeProject()
    exe '!' . s:MyCpp_AutoMakePath . s:MyCpp_MakeLibs
    echohl Finished | echo 'finish reautomakefile!' | echohl none
endfunction"}}}
" Function: MyCpp_Compile() "{{{
" 单文件生成目标文件
func! MyCpp_Compile()
    exe 'w'
    if &filetype == "c"
        set makeprg=gcc\ -g\ -Wall\ -c\ %
    elseif &filetype == "cpp"
        set makeprg=g++\ -g\ -Wall\ -c\ %
    endif
    exe 'make'
    exe 'cw'
endf "}}}
" Function: MyCpp_MakeProject() "{{{
" 生成项目配置文件
func! MyCpp_MakeProject()
    let s:MyCpp_MakeLibs = input("Libs: ", s:MyCpp_MakeLibs)
endf "}}}
"}}}
