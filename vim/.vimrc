set autoindent
set number relativenumber
syntax on
set hlsearch
set mouse=a
set nopaste
set background=dark
set backspace=indent,eol,start
set tabstop=2 
set colorcolumn=81
set background=dark
set guicursor=i:block " Keep cursor as block in insert mode

" Only expand tabs if not in a Makefile
let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
set noexpandtab
else
set shiftwidth=2
set expandtab
endif

" Status line
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
set re=0

" Tab line
"function! Tabline()
"  let s = ''
"  for i in range(tabpagenr('$'))
"    let tab = i + 1
"    let winnr = tabpagewinnr(tab)
"    let buflist = tabpagebuflist(tab)
"    let bufnr = buflist[winnr - 1]
"    let bufname = bufname(bufnr)
"    let bufmodified = getbufvar(bufnr, "&mod")
"
"    let s .= '%' . tab . 'T'
"    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
"    let s .= ' ' . tab .':'
"		if isdirectory(bufname)
"    	let s .= (bufname != '' ? '['. fnamemodify(bufname, ':p:h:h:t') . '/' . fnamemodify(bufname, ':t') . '] ' : '[No Name] ')
"		else 
"    	let s .= (bufname != '' ? '['. fnamemodify(bufname, ':p:h:t') . '/' . fnamemodify(bufname, ':t') . '] ' : '[No Name] ')
"		endif
"
"    if bufmodified
"      let s .= '[+] '
"    endif
"  endfor
"
"  let s .= '%#TabLineFill#'
"  if (exists("g:tablineclosebutton"))
"    let s .= '%=%999XX'
"  endif
"  return s
"endfunction

" Set tabline
set showtabline=2
"set tabline=%!Tabline()

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

" Format go code on save, but do it silently
au BufNewFile,BufRead *.go setlocal autoread
au BufWritePost *.go silent! !gofmt -w % 2> /dev/null

" Format rust code on save, but do it silently
au BufNewFile,BufRead *.rs setlocal autoread
au BufWritePost *.rs silent! !rustfmt --edition 2024 % 2> /dev/null

" Format python code on save, but do it silently
au BufNewFile,BufRead *.py setlocal autoread
au BufWritePost *.py silent! !black % > /dev/null 2>&1

" Format C/C++ code on save, but do it silently
au BufNewFile,BufRead *.c,*.cc,*.cpp,*.h,*.hpp setlocal autoread
au BufWritePost *.c,*.cc,*.cpp,*.h,*.hpp silent! !clang-format -i % > /dev/null 2>&1

" Format JS/TS/JSON on save using prettier
au BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx,*.json,*.jsonc setlocal autoread
au BufWritePost *.js,*.jsx,*.ts,*.tsx,*.json,*.jsonc silent! !prettier --write % > /dev/null 2>&1
