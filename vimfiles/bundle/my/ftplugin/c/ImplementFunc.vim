if exists("g:My_ImplementFunction")
    finish
endif

let g:My_ImplementFunction = 1

function! CreateFunctionDef()
    let a:curline = line(".")
    let a:lines = getline(a:curline, search(';'))
    let a:ln = join(a:lines, "\n")

    let a:ln = substitute(a:ln, '^\s\+', "", "")
    let a:ln = substitute(a:ln, 'virtual\s\+', "", "")
    let a:ln = substitute(a:ln, ';', "", "")

    let a:class = search('class', 'b')
    let a:class = getline(a:class)
    if strlen(a:class)>0
        let a:class = matchlist(a:class, 'class\s\+\([a-zA-Z]\+\)')[1]
        let a:ln = substitute(a:ln, '\([a-zA-Z]\+\s\+\)*\(.*\)', '\1'.a:class.'::\2', '')
    endif

    let a:hname = bufname("%")
    let a:cppname = matchlist(a:hname, '\(.*/\)*\(.*\)\.h')[2] . ".cpp"
    let a:datas = readfile(a:cppname)
    let a:datas += split(a:ln, "\n")
    let a:datas = add(a:datas, '{')
    let a:datas = add(a:datas, '}')
    call writefile(a:datas, a:cppname)
    execute 'e '.a:cppname
    normal gg=G
    normal GO
endfunction

map <A-i> :call CreateFunctionDef()<CR>
