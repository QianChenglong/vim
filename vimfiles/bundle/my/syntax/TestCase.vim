syntax clear
syntax case ignore

syntax match TestCaseComment /^\s*#.*$/ contains=TestCaseTodo
syntax region TestCaseString start=/"/ skip=/\\"/ end=/"/
syntax keyword TestCaseTodo TODO contained

highlight link TestCaseComment Comment
highlight link TestCaseString String
