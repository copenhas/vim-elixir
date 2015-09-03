" Vim compiler file
" Language:     ExUnit
" Maintainer:   Rein Henrichs <rein.henrichs@gmail.com>
" URL:          https://github.com/elixir-lang/vim-elixir

if exists("current_compiler")
  finish
endif
let current_compiler = "exunit"

if exists(":CompilerSet") != 2    " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=mix\ test
CompilerSet errorformat=%E==\ Compilation\ error\ %.%#,%C**\ (%[%^)]%#)\ %f:%l:\ %m,%-C\ \ \ \ (%.%#,%E\ \ %*\\d)\ %.%#,%C\ \ \ \ \ stacktrace:,%C\ \ \ \ \ \ \ (elixir)\ %[%^:]%#:%*\\d:\ %m,%C\ \ \ \ \ \ \ (%[%^)]%#)\ %f:%l:\ %.%#,%C\ \ \ \ \ \ \ %f:%l,%C\ \ \ \ \ %[%^:]%#:%*\\d,%C\ \ \ \ \ %m,%-G%.%#,%-A%.%#

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: nowrap sw=2 sts=2 ts=8:
