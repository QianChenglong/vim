if v:version < 700
    finish
endif

" Variable Definitions: {{{1
" options, define them as you like in vimrc:
if !exists("g:completekey")
    let g:completekey = "<tab>"   "hotkey
endif

" Autocommands: {{{1
" 主要是载入映射
autocmd BufReadPost,BufNewFile * call CodeCompleteStart()

function! CodeCompleteStart()
    exec "silent! iunmap  <buffer> ".g:completekey
    exec "inoremap <buffer><silent> ".g:completekey." <c-r>=CodeComplete()<cr>"
endfunction



function! FunctionComplete(fun)
    "找到含a:fun的那条记录，返回时字典列表
    let ftags=taglist("^".a:fun."$")
    "echo ftags
    "检测返回值类型
    if type(ftags)==type(0) || ((type(ftags)==type([])) && ftags==[])
        return ''
    endif
    let tmp=''
    "遍历列表内部成员（字典）
    for i in ftags
        "echo i.name
        "echo i.signature
        "如果有相应的记录
        if has_key(i,'kind') && has_key(i,'name') && has_key(i,'signature')
                       "echo 1
            if (i.kind=='p' || i.kind=='f') && i.name==a:fun  " p is declare, f is definition
                               "echo 2
                "当参数不为void且不为空白时
                if match(i.signature,'(\s*void\s*)')<0 && match(i.signature,'(\s*)')<0
                                       "echo 3
                    return substitute(i.signature,'(','','')
                else
                                       "echo 4
                    return ")"
                endif
            endif
        else
            "echo 5
            return ')'
        endif
    endfor
endfunction



function! CodeComplete()
    let function_name = matchstr(getline('.')[:(col('.')-2)],'\zs\w*\ze\s*(\s*$')
    "echo getline('.')[:(col('.')-2)]
    "当输入函数名在接'('后，光标位置-2为函数名
    "echo col('.')
    "echo function_name
    if function_name != ''
        return FunctionComplete(function_name)
    else
        return '    '
    endif
endfunction

