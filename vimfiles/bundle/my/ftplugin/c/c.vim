"=============================================================================
"     FileName: c.vim
"         Desc: 要编写的文件种类太多了，需要把配置分开，这是为c/c++
"       Author: QianChenglong
"        Email: qian_cheng_long@163.com
"   LastChange: 2012-07-07 10:22:24
"=============================================================================
"SECTION: Init"{{{
if &filetype == 'cpp'
    finish
endif
"}}}
if !exists("s:MyC_did_load")
    " SECTION: Options"{{{
    " " 为C程序提供自动缩进"{{{
    " set cindent
    " "}}}
    "设置C程序缩进格式"{{{
    set cinoptions+=t0,b1,(0
    "}}}
    " 设置文件编码"{{{
    if has("win32") || has("win64")
        set fileformat=dos
        set fileencoding=chinese
    endif
    " Plugin"{{{
    " Ctags"{{{
    set tags+=./.tags,../.tags
    let g:Ctags_ignore="__attribute_malloc__,__THROW,__THROWNL,__nonnull+,__wur,__attribute_pure__"
    let g:Ctags_option= "--sort=yes --c-kinds=+pxlt --fields=+S -f.tags --extra=+fq -R "
    ""}}}
    "}}}
    "}}}
    " 搜索路径path"{{{
    if has("win32") || has("win64")
        set path+=D:/mingw-GCC4.4/lib/gcc/mingw32/4.4.0/include/c++,
                    \C:/Program\\\ Files\\\ (x86)/Microsoft\\\ Visual\\\ Studio\\\ 11.0/VC/include,
    else
        set path+=/usr/local/include,
                    \/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.1/include,
                    \/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.1/include-fixed,
                    \/usr/include,
    endif
    "}}}

    "}}}
    " SECTION: Maps"{{{
    "创建一个段落折叠"{{{
    nnoremap    zp  zfa{
    "}}}
    "定义全局变量"{{{
    let s:MyC_Filename = expand("%:p") "文件名
    let s:MyC_ExecFilename = expand("%:p:h") . '/main'
    let s:MyC_WorkDir = expand("%:p:h") . '/' "工作目录
    let s:MyC_MakefileDir = s:MyC_WorkDir . '/obj'
    let s:MyC_MakefilePathname = s:MyC_MakefileDir . '/Makefile'
    let s:MyC_MakeProjectPathname = s:MyC_WorkDir . '/.project'
    let s:MyC_Args = '' "程序执行参数
    let s:MyC_APUE_cp_files="/home/qian/code/UNIX环境高级编程/附录B/B1/apue.h
                \/home/qian/code/UNIX环境高级编程/附录B/B2/apue_B2.c "
    let s:MyC_MakeLibs = ''
    "}}}
    "切换到当前目录"{{{
    "exe 'cd ' . s:MyC_WorkDir
    "}}}
    "定义映射"{{{
    nnoremap <script> <silent> <F1>    :call MyC_Help()<CR>
    nmap    <F6>    :call MyC_Exec()<CR>
    nmap    <F7>    :call MyC_Make()<CR>
    " nmap    <F5>    :call MyC_AutoMakefile()<CR>
    " nmap    <F2>    :call MyC_ReAutoMakefile()<CR>
    " nmap    <F8>    :call MyC_Compile()<CR>
    "为了学习unix(apue)写的
    "if matchstr(s:MyC_Filename, "UNIX") != ''
    "    map     <F5> :call MyC_UNIXCompile()<CR>
    "    command! -nargs=0   Ucd
    "                \ call MyC_Ucd()
    "else
    "    map <F5> call MyC_OneFileCompile()<CR>
    "endif
    "}}}
    "定义命令行命令"{{{
    command!    -nargs=0    GDB
                \ call MyC_GDB()
    command!    -nargs=0    Clean
                \ call MyC_Clean()
    "}}}
    "获得脚本的sid"{{{
    "let s:MyC_SID = matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID$')
    "}}}
    "载入自动命令，当使用时，载入脚本"{{{
    exe printf('autocmd FuncUndefined  MyC_* source %s', expand('<sfile>'))
    "}}}
    "}}}
    " SECTION: Varible"{{{
    let s:MyC_AutoMakePath = '/data/my_bin/AutoMakefile/c/main.sh'
    if has("win32") || has("win64")
        let s:My_makefile = 'e:\OS\CrossPlatform\Make\Code\utility\Makefile\C_Makefile'
    else
        let s:My_makefile = '/data/OS/CrossPlatform/Make/Code/utility/Makefile/C_Makefile'
    endif

    "}}}
    let s:MyC_did_load = 1
else
    finish
endif
"}}}
" SECTION: Funtions"{{{
" Function: MyC_Help()"{{{
" 用man查找光标下的单词
function! MyC_Help()
    let n = inputdialog("Input which manual to search:", "3")
    if n != ""
        silent! exec "!gnome-terminal -x bash -c 'man " . n . " " . expand("<cword>") ";read -n1'"
    endif
endfunction
"}}}
" Function: MyC_Ucd()"{{{
function! MyC_Ucd()
    silent! execute "!'/home/qian/my_bin/ucd.sh'"
endfunction
"}}}
" Function: MyC_APUE_Cp()"{{{
function! MyC_APUE_Cp()
    if !filereadable("apue.h")
        exe "!cp " . s:MyC_APUE_cp_files . s:MyC_WorkDir
    endif
endfunction"}}}
" Function: MyC_UNIXCompile()"{{{
function! MyC_UNIXCompile()
    exe "wa"
    call MyC_Clean()
    call MyC_APUE_Cp()
    set makeprg=gcc\ -std=c99\ -g\ -Wall\ -o\ %<\ %\ apue_B2.o
    exe "make"
    "if has errors, open quickfix window, else don't
    exe "cw"
    "echo &filetype
    "if has errors, then jump to the first error
    "echo !filereadable(s:MyC_ExecFilename)
    "if &filetype == "qf" || !filereadable(s:MyC_ExecFilename)
    "    "exe "cc"
    "else
    "    "echo "successfully!"
    "    "echo s:MyC_ExecFilename
    "    "silent! execute "!chmod +x " . s:MyC_ExecFilename
    "endif
endfunction"}}}
"Function: MyC_Make()"{{{
" 调用Makefile编译程序
function! MyC_Make()
    exe 'cclose'
    exe "wa"
    if !filereadable("Makefile")
        exe '!cp ' . s:My_makefile . ' ./Makefile'
    endif
    set makeprg=make
    silent exe "make"
    exe "cw"
    "exe "copen"
endfunction"}}}
" Function: MyC_OneFileCompile()"{{{
"编译单文件程序
function! MyC_OneFileCompile()
    exe "wa"
    call MyC_Clean()
    if expand("%:p:h") != getcwd()
        echohl WarningMsg | echo "Fail to compile, no such file in current directory!"
        | echohl none
        exit -1
    endif
    set makeprg=gcc\ -g\ -Wall\ -o\ %<\ %
    exe "make"
    exe "cw"
endfunction"}}}
" Function: MyC_PassArgs()"{{{
"返回输入参数
function! MyC_PassArgs()
    let s:MyC_Args = inputdialog("arguments: 1 2 3 ...", s:MyC_Args, "cancel")
    return s:MyC_Args
endfunction
"}}}
" Function: MyC_Exec()"{{{
"执行程序
function! MyC_Exec()
    if executable(s:MyC_ExecFilename) == 0
        if has("win32") || has("win64")
            let s:MyC_ExecFilename =  expand("%:r")
        else
            let s:MyC_ExecFilename = './' . expand("%:r")
        endif

        if executable(s:MyC_WorkDir . s:MyC_ExecFilename) == 0
            echohl WarningMsg | echo "NO such file to execute"
            let s:MyC_ExecFilename = inputdialog("Execute FileName:", './main', 'cancel')
            if s:MyC_ExecFilename == 'cancel'
                return
            elseif executable(s:MyC_ExecFilename) == 0
                echohl WarningMsg | echo "NO such file to execute"
                return
            endif
        endif
    endif
    call MyC_PassArgs()
    if s:MyC_Args == "cancel"
        return
    endif
    "echo s:MyC_Args
    "silent! execute "!gnome-terminal -x bash -c '" . s:MyC_ExecFilename . " "
    "\ . s:MyC_Args . ";echo  '';read -p 'exit...''"
    if has("win32") || has("win64")
        " silent exe printf("!%s \"%s\" |  c++filt -t & pause",
        silent exe iconv(printf("!\"%s\" %s & pause",
                    \ s:MyC_ExecFilename,
                    \ s:MyC_Args),
                    \ "utf-8", "chinese")
    else
        silent exe printf("!gnome-terminal -x bash -c '%s %s;echo %s ;read -n 1 -p  \"%s\"'",
                    \ s:MyC_ExecFilename, s:MyC_Args,
                    \ '--------------------------------------------------------------------------------',
                    \ 'press entry exit...')
    endif
endfunction"}}}
" Function: MyC_Clean()"{{{
"清理中间文件，以便于重新编译
function! MyC_Clean()
    exe 'cclose'
    ""删除单文件编译的程序"{{{
    "if (filereadable(s:MyC_ExecFilename))
    "    exe "!rm " . s:MyC_ExecFilename
    "endif"}}}
    "进入makefile所在目录执行make clean"{{{
    if isdirectory(s:MyC_MakefileDir)
        exe 'lcd ' . s:MyC_MakefileDir
        echo s:MyC_MakefileDir
        exe '!make clean'
        exe 'lcd ' . s:MyC_WorkDir
    endif"}}}
endfunc"}}}
" Function: MyC_GDB()"{{{
"调用GDB调试
function! MyC_GDB()
    "call MyC_OneFileCompile()
    if (executable(s:MyC_ExecFilename) == 0)
        echohl WarningMsg | echo "NO such file to debug" | echohl none
        return -2
    else
        silent! execute "!gnome-terminal -e 'gdb "  . s:MyC_ExecFilename . "'"
    endif
endfunction
"}}}
" Function: MyC_AutoMakefile()"{{{
"自动生成makefile
function! MyC_AutoMakefile()
    if matchstr(s:MyC_Filename, "UNIX") != ''
        call MyC_APUE_Cp()
    endif
    call MyC_MakeProject()
    "silent exe '!mkdir obj'
    "exe 'lcd ' . s:MyC_MakefileDir
    "exe '!rm ' . MyC_WorkDir . '/obj'
    "exe '!rm -rf ' . s:MyC_MakefileDir
    exe '!' . s:MyC_AutoMakePath . s:MyC_MakeLibs
    "exe 'lcd ' . s:MyC_WorkDir
endfunction"}}}
" Function: MyC_ReAutoMakefile()"{{{
function! MyC_ReAutoMakefile()
    "复制apue的一些文件
    if matchstr(s:MyC_Filename, "UNIX") != ''
        call MyC_APUE_Cp()
    endif
    exe '!rm -rf ' . s:MyC_MakefileDir
    exe '!rm -rf ' . s:MyC_MakeProjectPathname
    call MyC_MakeProject()
    exe '!' . s:MyC_AutoMakePath . s:MyC_MakeLibs
    echohl Finished | echo 'finish reautomakefile!' | echohl none
endfunction"}}}
" Function: MyC_Compile() "{{{
" 单文件生成目标文件
func! MyC_Compile()
    exe 'w'
    if &filetype == "c"
        set makeprg=gcc\ -std=c99\ -g\ -Wall\ -c\ %
    elseif &filetype == "cpp"
        set makeprg=g++\ -g\ -Wall\ -c\ %
    endif
    exe 'make'
    exe 'cw'
endf "}}}
" Function: MyC_MakeProject() "{{{
" 生成项目配置文件
func! MyC_MakeProject()
    let s:MyC_MakeLibs = input("Libs: ", s:MyC_MakeLibs)
endf "}}}
"}}}
