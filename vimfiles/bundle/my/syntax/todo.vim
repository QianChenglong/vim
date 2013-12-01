" Vim syntax file
" Language: question
" Maintainer: QianChenglong
" Latest Revision: 2013-12-01

if exists("b:current_syntax")
  finish
endif

syntax clear
syntax case ignore

syntax match quesionContent /^.\{-}\ze|/  nextgroup=questionDelimiter
syntax match questionDelimiter /|/ nextgroup=questionStartTime skipwhite
syntax match questionStartTime /[-0-9:]\+/ contained nextgroup=questionDelimiter skipwhite
" syntax match questionFinishTime /[-0-9:]\+$/ contained

let b:current_syntax = "todo"

highlight link questionDelimiter Delimiter
" highlight link questionDelimiter Error
highlight link quesionContent String
highlight link questionStartTime Number
highlight link questionFnishTime Error
