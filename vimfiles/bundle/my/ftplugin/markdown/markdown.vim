if exists("b:did_markdowndown_ftplugin")
  finish
endif
let b:did_markdowndown_ftplugin = 1

if has("unix")
    let s:chrome="google-chrome-stable"
else
    let s:chrome="C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe"
endif

let s:options="--new-window"

setlocal textwidth=80
setlocal autoindent

map <A-p> :call <SID>Preview()<CR>
imap <C-CR> <SPACE><SPACE><CR>

function s:Preview()
    if has("unix")
        silent exe printf("!%s %s %s", s:chrome, s:options, expand("%"))
    else
        silent exe iconv(printf("!start \"%s\" %s %s",
                    \ s:chrome,
                    \ s:options,
                    \ expand("%:p")),
                    \ "utf-8", "chinese")
    endif
endfunction

" Section: Plugins{{{
" auto-pairs"{{{
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
"}}}
"}}}
