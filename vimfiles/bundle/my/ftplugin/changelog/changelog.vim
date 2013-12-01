" =============================================================================
"      FileName: changelog.vim
"        Author: QianChengLong
"         Email: qian_cheng_long@163.com
"      HomePage: www.QianChengLong.com
"       Version: 1.0
"    LastChange: 2013-09-05 19:44:47
"       History:
" =============================================================================
"SECTION: Init"{{{
if exists("b:did_changelog_ftplugin")
    finish
endif
let b:did_changelog_ftplugin = 1
"}}}

" SECTION: Options"{{{
setlocal commentstring=;%s;
"}}}
"SECTION: Variable"{{{
let g:changelog_username = "QianChengLong   <qian_cheng_long@163.com>"
let g:changelog_spacing_errors = 0

"}}}
