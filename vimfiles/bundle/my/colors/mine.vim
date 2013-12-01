" Vim color file
"
hi clear

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let g:colors_name="mine"

" vimwiki"{{{
"hi VimwikiHeader1 guifg=#FF0000
"hi VimwikiHeader2 guifg=#00FF00
"hi VimwikiHeader3 guifg=#0000FF
"hi VimwikiHeader4 guifg=#FF00FF
"hi VimwikiHeader5 guifg=#00FFFF
"hi VimwikiHeader6 guifg=#FFFF00
"}}}
" taghl"{{{
hi Class            guifg=#4876FF
hi def link DefinedName      Constant
hi Enumerator       guifg=blue
hi Function         guifg=#55B24A       gui=bold
hi def link EnumeratorName  Type
hi Member           guifg=lightgreen
hi def link EnumerationValue Member
hi def link Structure        Type
hi def link Union            Type
hi GlobalVariable   guifg=yellow
hi LocalVariable    guifg=darkgreen
hi Extern           guifg=#FFC125
"}}}
" complete menu"{{{
" 普通项
hi Pmenu           guifg=#66D9EF guibg=#000000
" 选中项
hi PmenuSel        guifg=black   guibg=cyan gui=bold
" 滚动条
hi PmenuSbar                     guibg=#8B8878
" 滚动条拇指
hi PmenuThumb      guifg=#8A2BE2
"}}}
hi Anchor           guifg=black guibg=white
hi AutoCommand           guifg=black guibg=white
hi BlockData           guifg=black guibg=white
hi Command           guifg=black guibg=white
hi CommonBlocks           guifg=black guibg=white
hi Component           guifg=black guibg=white
hi Data           guifg=black guibg=white
hi Domain           guifg=black guibg=white
hi Entity           guifg=black guibg=white
hi EntryPoint           guifg=black guibg=white
hi Enumeration           guifg=black guibg=white
hi EnumerationName           guifg=black guibg=white
hi Event            guifg=black guibg=white
hi Feature            guifg=black guibg=white
hi Field             guifg=black guibg=white
hi File             guifg=black guibg=white
hi FileDescription             guifg=black guibg=white
hi Format             guifg=black guibg=white
hi Fragment             guifg=black guibg=white
hi FunctionObject             guifg=black guibg=white
hi GlobalConstant             guifg=black guibg=white
hi GroupItem             guifg=black guibg=white
hi Import             guifg=black guibg=white
hi Index             guifg=black guibg=white
hi Interface             guifg=black guibg=white
hi InterfaceComponent             guifg=black guibg=white
hi Map              guifg=black guibg=white
hi Method              guifg=black guibg=white
hi Module              guifg=black guibg=white
hi Namelist              guifg=black guibg=white
hi Namespace              guifg=black guibg=white
hi NetType        guifg=black guibg=white
hi Package        guifg=black guibg=white
hi Paragraph      guifg=black guibg=white
hi Pattern        guifg=black guibg=white
hi Port           guifg=black guibg=white
hi Program        guifg=black guibg=white
hi Property       guifg=black guibg=white
hi Prototype      guifg=black guibg=white
hi Publication    guifg=black guibg=white
hi Record         guifg=black guibg=white
hi RegisterType   guifg=black guibg=white
hi Section        guifg=black guibg=white
hi Service        guifg=black guibg=white
hi Set            guifg=black guibg=white
hi Signature      guifg=black guibg=white
hi Singleton      guifg=black guibg=white
hi Slot           guifg=black guibg=white
hi SqlCursor      guifg=black guibg=white
hi Subroutine     guifg=black guibg=white
hi Synonym        guifg=black guibg=white
hi Table          guifg=black guibg=white
hi Task           guifg=black guibg=white
hi Trigger        guifg=black guibg=white
hi TypeComponent  guifg=black guibg=white
hi Variable       guifg=black guibg=white
hi View           guifg=black guibg=white
hi VirtualPattern guifg=black guibg=white

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi Finished         guifg=green     gui=bold
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi cBlock           guifg=black

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi Ignore           guifg=grey40
hi Special          guifg=navajowhite
hi Boolean          guifg=#AE81FF
hi Character        guifg=#E6DB74
hi Number           guifg=#AE81FF
hi String           guifg=#E6DB74
hi Conditional      guifg=#F92672               gui=bold
hi Constant         guifg=#AE81FF               gui=bold
hi Cursor           guifg=#000000 guibg=#F8F8F0
hi Debug            guifg=#BCA3A3               gui=bold
hi Define           guifg=#66D9EF
hi Delimiter        guifg=#8F8F8F
hi DiffAdd                       guibg=#13354A
hi DiffChange       guifg=#89807D guibg=#4C4745
"hi DiffChange      guibg=#E8E8E8 guibg=#9C9C9C
hi DiffDelete       guifg=#960050 guibg=#1E0010
"hi DiffText        guibg=#4C4745 gui=italic,bold
hi DiffText         guibg=#FF0000 gui=italic,bold

hi Directory        guifg=#A6E22E               gui=bold
hi Error            guifg=#960050 guibg=#1E0010
hi ErrorMsg         guifg=#F92672 guibg=#232526 gui=bold
hi Exception        guifg=#A6E22E               gui=bold
hi Float            guifg=#AE81FF
hi FoldColumn       guifg=#465457 guibg=#000000
hi Folded           guifg=#465457 guibg=#000000
hi Identifier       guifg=#FD971F
hi Ignore           guifg=#808080 guibg=bg
hi IncSearch        gui=underline
hi FirstOperator    guifg=#DE3317

hi Keyword          guifg=#F92672               gui=bold
hi Label            guifg=#E6DB74               gui=none
hi Macro            guifg=#C4BE89               gui=italic
hi SpecialKey       guifg=#66D9EF               gui=italic

hi MatchParen       guifg=#000000 guibg=#FD971F gui=bold
hi ModeMsg          guifg=#E6DB74
hi MoreMsg          guifg=#E6DB74
hi Operator         guifg=#F92672


hi PreCondit       guifg=#A6E22E               gui=bold
hi PreProc         guifg=#A6E22E
hi Question        guifg=#66D9EF
hi Repeat          guifg=#F92672               gui=bold
hi Search          guifg=#FFFFFF guibg=#455354
" marks column
hi SignColumn      guifg=#A6E22E guibg=#232526
hi SpecialChar     guifg=#F92672               gui=bold
hi SpecialComment  guifg=#465457               gui=bold
hi Special         guifg=#66D9EF guibg=bg      gui=italic
if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif
hi Statement       guifg=#F92672               gui=bold
"hi StatusLine      guifg=#455354 guibg=fg
"hi StatusLine      guifg=blue guibg=fg
hi StatusLineNC     guifg=#808080 guibg=#080808
hi StorageClass     guifg=#FD971F               gui=italic
hi Structure        guifg=#66D9EF
hi Tag              guifg=#F92672               gui=italic
hi Title            guifg=#ef5939
hi Todo             guifg=#FFFFFF guibg=bg      gui=bold

hi Typedef          guifg=#66D9EF
hi Type             guifg=#66D9EF               gui=none
hi Underlined       guifg=#808080               gui=underline

hi VertSplit        guifg=#808080 guibg=#080808 gui=bold
hi VisualNOS                      guibg=#403D3D
hi Visual                         guibg=#403D3D
hi WarningMsg       guifg=#FF1493 gui=bold
hi WildMenu         guifg=#66D9EF guibg=#000000

hi Normal           guifg=#F8F8F2 guibg=#1B1D1E
hi Comment          guifg=#465457               gui=italic
" hi CursorLine       guibg=#1B1D1E               gui=underline
hi CursorLine       guibg=black
hi CursorColumn                   guibg=#293739
hi ColorColumn                    guibg=black
hi LineNr           guifg=grey61 guibg=#232526
hi NonText          guifg=LightBlue guibg=grey21
hi SpecialKey       guifg=#465457

"
" Support for 256-color terminal
"
if &t_Co > 255
    hi Boolean         ctermfg=135
    hi Character       ctermfg=144
    hi Number          ctermfg=135
    hi String          ctermfg=144
    hi Conditional     ctermfg=161               cterm=bold
    hi Constant        ctermfg=135               cterm=bold
    hi Cursor          ctermfg=16  ctermbg=253
    hi Debug           ctermfg=225               cterm=bold
    hi Define          ctermfg=81
    hi Delimiter       ctermfg=241

    hi DiffAdd                     ctermbg=24
    hi DiffChange      ctermfg=181 ctermbg=239
    hi DiffDelete      ctermfg=162 ctermbg=53
    hi DiffText                    ctermbg=102 cterm=bold

    hi Directory       ctermfg=118               cterm=bold
    hi Error           ctermfg=219 ctermbg=89
    hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
    hi Exception       ctermfg=118               cterm=bold
    hi Float           ctermfg=135
    hi FoldColumn      ctermfg=67  ctermbg=16
    hi Folded          ctermfg=67  ctermbg=16
    hi Function        ctermfg=118
    hi Identifier      ctermfg=208               cterm=none
    hi Ignore          ctermfg=244 ctermbg=232
    hi IncSearch       ctermfg=193 ctermbg=16

    hi Keyword         ctermfg=161               cterm=bold
    hi Label           ctermfg=229               cterm=none
    hi Macro           ctermfg=193
    hi SpecialKey      ctermfg=81

    hi MatchParen      ctermfg=16  ctermbg=208 cterm=bold
    hi ModeMsg         ctermfg=229
    hi MoreMsg         ctermfg=229
    hi Operator        ctermfg=161

    " complete menu
    hi Pmenu           ctermfg=81  ctermbg=16
    hi PmenuSel                    ctermbg=244
    hi PmenuSbar                   ctermbg=232
    hi PmenuThumb      ctermfg=81

    hi PreCondit       ctermfg=118               cterm=bold
    hi PreProc         ctermfg=118
    hi Question        ctermfg=81
    hi Repeat          ctermfg=161               cterm=bold
    hi Search          ctermfg=253 ctermbg=66

    " marks column
    hi SignColumn      ctermfg=118 ctermbg=235
    hi SpecialChar     ctermfg=161               cterm=bold
    hi SpecialComment  ctermfg=245               cterm=bold
    hi Special         ctermfg=81  ctermbg=232

    hi Statement       ctermfg=161               cterm=bold
    hi StatusLine      ctermfg=238 ctermbg=253
    hi StatusLineNC    ctermfg=244 ctermbg=232
    hi StorageClass    ctermfg=208
    hi Structure       ctermfg=81
    hi Tag             ctermfg=161
    hi Title           ctermfg=166
    hi Todo            ctermfg=231 ctermbg=232   cterm=bold

    hi Typedef         ctermfg=81
    hi Type            ctermfg=81                cterm=none
    hi Underlined      ctermfg=244               cterm=underline

    hi VertSplit       ctermfg=244 ctermbg=232   cterm=bold
    hi VisualNOS                   ctermbg=238
    hi Visual                      ctermbg=235
    hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold
    hi WildMenu        ctermfg=81  ctermbg=16

    hi Normal          ctermfg=252 ctermbg=233
    hi Comment         ctermfg=59
    hi CursorLine                  ctermbg=234   cterm=none
    hi CursorColumn                ctermbg=234
    hi ColorColumn                 ctermbg=234
    hi LineNr          ctermfg=250 ctermbg=234
    hi NonText         ctermfg=59
    hi SpecialKey      ctermfg=59
end

