" =============================================================================
"      FileName: vimwiki.vim
"          Desc: 定制vimwiki
"        Author: QianChenglong
"         Email: qian_cheng_long@163.com
"       Version: 1.0
"    LastChange: 2012-09-09 09:52:35
"       History:
" =============================================================================

" SECTION: Funtions"{{{
" Function: VimwikiLinkHandler(link)"{{{
function! VimwikiLinkHandler(link)
    try
        let browser = '/usr/bin/chromium '
        execute "browser" . "a:link"
        return 1
    catch
        echo "This can happen for a variety of reasons ..."
    endtry
    return 0
endfunction"}}}
"}}}
