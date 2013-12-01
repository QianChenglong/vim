" Vim syntax file
" Language:     Markdown
" Maintainer:   Tim Pope <vimNOSPAM@tpope.org>
" Filenames:    *.markdown
" Last Change:  2013 May 30

if exists("b:current_syntax")
  finish
endif

syn clear

if !exists('main_syntax')
  let main_syntax = 'markdown'
endif

runtime! syntax/html.vim
unlet! b:current_syntax

syn sync linebreaks=1
syn case ignore

" Atex文件头
syn region markdownH1       start="^\s*#"                   end="\($\|#\+\)" contains=@Spell
syn region markdownH2       start="^\s*##"                  end="\($\|#\+\)" contains=@Spell
syn region markdownH3       start="^\s*###"                 end="\($\|#\+\)" contains=@Spell
syn region markdownH4       start="^\s*####"                end="\($\|#\+\)" contains=@Spell
syn region markdownH5       start="^\s*#####"               end="\($\|#\+\)" contains=@Spell
syn region markdownH6       start="^\s*######"              end="\($\|#\+\)" contains=@Spell
" Setext文件头
syn match  markdownH1       /^.\+\n=\+$/ contains=@Spell
syn match  markdownH2       /^.\+\n-\+$/ contains=@Spell


" 粗体和斜体
syn region markdownItalic start="\\\@<!\*\S\@=" end="\S\@<=\\\@<!\*" keepend oneline
syn region markdownItalic start="\(^\|\s\)\@<=_\|\\\@<!_\([^_]\+\s\)\@=" end="\S\@<=_\|_\S\@=" keepend oneline
syn region markdownBold start="\S\@<=\*\*\|\*\*\S\@=" end="\S\@<=\*\*\|\*\*\S\@=" keepend oneline
syn region markdownBold start="\S\@<=__\|__\S\@=" end="\S\@<=__\|__\S\@=" keepend oneline
syn region markdownBoldItalic start="\S\@<=\*\*\*\|\*\*\*\S\@=" end="\S\@<=\*\*\*\|\*\*\*\S\@=" keepend oneline
syn region markdownBoldItalic start="\S\@<=___\|___\S\@=" end="\S\@<=___\|___\S\@=" keepend oneline

" [link](URL) | [link][id] | [link][]
syn region markdownFootnotes matchgroup=markdownDelimiter start="\[^"    end="\]"
syn region markdownID matchgroup=markdownDelimiter        start="\["    end="\]" contained oneline
syn region markdownURL matchgroup=markdownDelimiter       start="("     end=")"  contained oneline
syn region markdownLink matchgroup=markdownDelimiter      start="\\\@<!\[" end="\]\ze\s*[[(]" contains=@Spell nextgroup=markdownURL,markdownID skipwhite oneline
" markdown  inline links:           protocol   optional  user:pass@       sub/domain                 .com, .co.uk, etc      optional port   path/querystring/hash fragment
"                            ------------ _____________________ --------------------------- ________________________ ----------------- __
syntax match   markdownInlineURL /https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/

" Link definitions: [id]: URL (Optional Title)
" TODO handle automatic links without colliding with htmlTag (<URL>)
syn region markdownLinkDef matchgroup=markdownDelimiter   start="^ \{,3}\zs\[" end="]:" oneline nextgroup=markdownLinkDefTarget skipwhite
syn region markdownLinkDefTarget start="<\?\zs\S" excludenl end="\ze[>[:space:]\n]"   contained nextgroup=markdownLinkTitle,markdownLinkDef skipwhite skipnl oneline
syn region markdownLinkTitle matchgroup=markdownDelimiter start=+"+     end=+"+  contained
syn region markdownLinkTitle matchgroup=markdownDelimiter start=+'+     end=+'+  contained
syn region markdownLinkTitle matchgroup=markdownDelimiter start=+(+     end=+)+  contained

"define Markdown groups
syn match  markdownLineContinue ".$" contained
syn match  markdownLineBreak    /  \+$/
syn region markdownBlockquote   start=/^\s*>/                   end=/$/ contains=markdownLineBreak,markdownLineContinue,@Spell
syn region markdownCode         start=/\(\([^\\]\|^\)\\\)\@<!`/ end=/\(\([^\\]\|^\)\\\)\@<!`/
syn region markdownCode         start=/\s*``[^`]*/              end=/[^`]*``\s*/
syn region markdownCode         start=/^```\s*\w*\s*$/          end=/^```\s*$/
syn region markdownCode         start="<pre[^>]*>"              end="</pre>"
syn region markdownCode         start="<code[^>]*>"             end="</code>"
syn region markdownFootnote     start="\[^"                     end="\]"
syn match  markdownCode         /^\s*\n\(\(\s\{8,}[^ ]\|\t\t\+[^\t]\).*\n\)\+/
syn match  markdownIndentCode   /^\s*\n\(\(\s\{4,}[^ ]\|\t\+[^\t]\).*\n\)\+/ contained
syn match  markdownListItem     "^\s*[-*+]\s\+"
syn match  markdownListItem     "^\s*\d\+\.\s\+"
syn region markdownNonListItemBlock start="\n\(\_^\_$\|\s\{4,}[^ ]\|\t+[^\t]\)\@!" end="^\(\s*\([-*+]\|\d\+\.\)\s\+\)\@=" contains=@markdownNonListItem
syn match  markdownRule         /^\s*\*\s\{0,1}\*\s\{0,1}\*$/
syn match  markdownRule         /^\s*-\s\{0,1}-\s\{0,1}-$/
syn match  markdownRule         /^\s*_\s\{0,1}_\s\{0,1}_$/
syn match  markdownRule         /^\s*-\{3,}$/
syn match  markdownRule         /^\s*\*\{3,5}$/


syn cluster markdownNonListItem contains=markdownItalic,markdownBold,markdownBoldItalic,markdownFootnotes,markdownID,markdownURL,markdownLink,markdownLinkDef,markdownLineBreak,markdownBlockquote,markdownCode,markdownIndentCode,markdownListItem,markdownRule,markdownH1,markdownH2,markdownH3,markdownH4,markdownH5,markdownH6

"highlighting for Markdown groups
highlight def link markdownString        String
highlight def link markdownCode          String
highlight def link markdownIndentCode    String
highlight def link markdownFootnote      Comment
highlight def link markdownBlockquote    Comment
highlight def link markdownLineContinue  Comment
highlight def link markdownListItem      Identifier
highlight def link markdownRule          Identifier
highlight def link markdownLineBreak     Todo
highlight def link markdownFootnotes     htmlLink
highlight def link markdownLink          htmlLink
highlight def link markdownURL           htmlString
highlight def link markdownInlineURL     htmlLink
highlight def link markdownID            Identifier
highlight def link markdownLinkDef       markdownID
highlight def link markdownLinkDefTarget markdownURL
highlight def link markdownLinkTitle     htmlString
highlight def link markdownDelimiter     Delimiter

hi def link markdownH1                    htmlH1
hi def link markdownH2                    htmlH2
hi def link markdownH3                    htmlH3
hi def link markdownH4                    htmlH4
hi def link markdownH5                    htmlH5
hi def link markdownH6                    htmlH6
hi def link markdownHeadingRule           markdownRule
hi def link markdownHeadingDelimiter      Delimiter
hi def link markdownOrderedListMarker     markdownListMarker
hi def link markdownListMarker            htmlTagName
hi def link markdownBlockquote            Comment
hi def link markdownRule                  PreProc
hi def link markdownCode htmlH1
hi def link markdownLineBreak htmlH1

hi def link markdownLinkText              htmlLink
hi def link markdownIdDeclaration         Typedef
hi def link markdownId                    Type
hi def link markdownAutomaticLink         markdownUrl
hi def link markdownUrl                   Float
hi def link markdownUrlTitle              String
hi def link markdownIdDelimiter           markdownLinkDelimiter
hi def link markdownUrlDelimiter          htmlTag
hi def link markdownUrlTitleDelimiter     Delimiter

hi def link markdownItalic                htmlItalic
hi def link markdownBold                  htmlBold
hi def link markdownBoldItalic            htmlBoldItalic

hi def link markdownEscape                Special
hi def link markdownError                 Error

let b:current_syntax = "markdown"
if main_syntax ==# 'markdown'
  unlet main_syntax
endif

" vim:set sw=2:
