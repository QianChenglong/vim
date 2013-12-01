"========================================================
" Highlight All Function
"========================================================
"syn match   cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1

hi cFunction  guifg=#55B24A gui=bold
"hi cFunction  guifg=blue
"========================================================
" Highlight All Operators
"========================================================
"  operators
syn match   FirstOperator   display "\]\|\[\|(\|)\|->\|\."
syn match   SecondOperator  display "[!~]\|++\|--\|&\h\@=\|*"
syn match   ThirdOperator   display "-\([->]\)\@!\|+\([+=]\)\@!\|\s\@<=\*\s\@=\|/\([=]\)\@!\|%\([=]\)\@!"
syn match   ShiftOperator   display "<<\|>>"
syn match   FifthOperator   display "[=!><]=\|<\|>"
syn match   SixthOperator   display "\s\@<=&\s\@=\|\^\([=]\)\@!\||\@<!|\([|=]\)\@!"
syn match   SeventhOperator display "&&\|||"
"syn match  EeigthOperator  display "?\(.*\)\@<=:" "how?
syn match   EeigthOperator  display "\s\@<=?\s\@=\|\s\@<=:\s\@="
syn match   NinthOperator   display "\([+-/%]\|\*\|[&^|]\|<<\|>>\)=\|\s\@<==\s\@="

hi FirstOperator    guifg=#DE3317
hi SecondOperator   guifg=#EA29E1
hi ThirdOperator    guifg=#C204FE
hi ShiftOperator    guifg=#9B85A1
hi FifthOperator    guifg=#407CBC
hi SixthOperator    guifg=#A281D9
hi SeventhOperator  guifg=#0217F4
hi EeigthOperator   guifg=#4F58B8
hi NinthOperator    guifg=#DB8E10

syn match       cheseSemicolon    display "；，"
hi cheseSemicolon    gui=standout       guifg=#FFFFFF
syn match       semicolon         display ";\|,\|:"
hi semicolon         guifg=#8B8B7A
