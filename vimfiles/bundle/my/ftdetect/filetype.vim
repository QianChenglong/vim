" =============================================================================
"      FileName: filetype.vim
"          Desc: 添加自定义的文件类型
"        Author: QianChengLong
"         Email: qian_cheng_long@163.com
"      HomePage: www.QianChengLong.com
"       Version: 1.0
"    LastChange: 2013-08-09 10:27:16
"       History:
" =============================================================================

if exists("s:my_did_load_filetypes")
    finish
endif
let s:my_did_load_filetypes = 1

augroup filetypedetect
au! BufNewFile,BufRead */TestCase setf TestCase
au! BufNewFile,BufRead *.reg      setf Registry
au! BufNewFile,BufRead *.bxrc     setf BochsConfig
au! BufNewFile,BufRead *.install  setf ArchPkgInstall
au! BufNewFile,BufRead .tags      setf tags
au! BufNewFile,BufRead *.csv      setf csv
" au! BufNewFile,BufRead todo,todo.txt,Todo,Todo.txt      setf todo
au! BufNewFile,BufRead todo,Todo      setf todo
au! BufNewFile,BufRead Question      setf question
au! BufNewFile,BufRead *List      setf list
augroup END
