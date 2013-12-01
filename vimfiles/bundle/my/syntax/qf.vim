" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" A bunch of useful C keywords
syn match   qfFileName  "^[^|]*" nextgroup=qfSeparator1
syn match   qfSeparator1 "|" nextgroup=qfLineNr contained
syn match   qfLineNr    "[^|]*" nextgroup=qfSeparator2 contained
syn match   qfSeparator2 "|"  nextgroup=qfError contained contains=qfError,qfWarning,qfNote
syn match   qfError     "error.*"
syn match   qfWarning     "warning.*"
syn match   qfNote     "note.*"

" The default highlighting.
hi def link qfFileName  Directory
"hi def link qfLineNr    LineNr
"hi def link qfError     Error
"hi def link qfWarning     Error

hi  qfLineNr        guifg=cyan
hi  qfError         guifg=red
hi  qfWarning       guifg=#FF1493
hi  qfNote         guifg=#FFB5C5

let b:current_syntax = "qf"
