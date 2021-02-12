set autoindent
set number relativenumber
syntax on
set hlsearch
set mouse=a
set nopaste
set backspace=indent,eol,start
set tabstop=2 
set colorcolumn=81

" Only expand tabs if not in a Makefile
let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
set noexpandtab
else
set shiftwidth=2
set expandtab
endif

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

let branchname=StatuslineGit()

" Always enable status line
set laststatus=2

" Status line params
set statusline=
set statusline+=%#PmenuSel#
"set statusline+=%{StatuslineGit()}
set statusline+=%{branchname}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\
au Bufenter,BufRead,BufnewFile *.p4 set filetype=p4
au Bufenter,BufRead,BufnewFile *.p4 source ~/.vim/p4.vim

" Format go code on save, but do it silently
au BufNewFile,BufRead *.go setlocal autoread
au BufWritePost *.go silent! !gofmt -w %
