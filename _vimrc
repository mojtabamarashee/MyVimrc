
syntax on
syntax enable
syntax on
set number 
set showcmd 
set noswapfile
"set cursorline
"set showmatch
set incsearch
"set hlsearch  
let mapleader="."
set foldmethod=manual
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader><leader>f :set foldmethod=indent<CR>
noremap tn :10000tabnew 
 
noremap tc :tabclose 
nnoremap tm :tabmove  
"nnoremap <C-]> <C-W><C-]> 
"set ignorecase
set nowrap
set tabstop=4
set shiftwidth=4
set scrolloff=111110
set sidescroll=1
:function! ToggleWrapp()
: if (&wrap == 1)
:   windo set nowrap
: else
:   windo set wrap
: endif
:endfunction
map <leader>w :call ToggleWrapp()<CR>
map! <leader>w ^[:call ToggleWrapp()<CR>
set ignorecase
set autoindent
set history=10000
set smartindent
filetype indent on
filetype plugin on
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,longest
nmap s :wa<cr>
imap ii <Esc>

"set guifont=Consolas:h10:cANSI

let g:lasttab2 = []
let g:lasttab = 1
let g:i12 = -1
let g:flag = 0
nmap tp :call GoPreviousTab()<CR>
"nmap tn :call GoNextTab()<CR>
nmap ttl :tablast<CR>
nmap ttf :tabfirst<CR>
au TabLeave * call TabLeaveDo()
"au TabLeave * let g:lasttab=tabpagenr() | let g:lasttab2[0]
:nmap <leader>v :100vimgrep /<C-R><C-W>/j %:p:h/**/*.c %:p:h/**/*.h <cr>:cw <cr>
:nmap <F3> :let e = expand('%:e')<cr>:vimgrep /<C-R><C-W>/ %:p:h/*.c %:p:h/*.h 
:nmap <F2> :100vimgrep /<C-R><C-W>/j %:p:h/**/*.m <cr>:cw <cr>
:vmap <leader>a "Ay"A"\r"


vmap y ygv<Esc>

execute pathogen#infect()
set laststatus=2
let g:neocomplcache_enable_at_startup = 1

nmap <leader><CR> o<Esc>
nmap <s-Enter> O<Esc>
nmap <space> a <Esc>


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_vhdl_checkers=['gcc', 'clang_check']

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" Highlight Function names.  From
" http://stackoverflow.com/questions/736701/class-function-names-highlighting-in-vim/773392#773392
syn match    cCustomParen    "(" contains=cParen contains=cCppParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
hi def link cCustomFunc  Function
hi Function term=bold gui=bold

function! HighFunc()

	" Highlight Function names.  From
	" http://stackoverflow.com/questions/736701/class-function-names-highlighting-in-vim/773392#773392
	syn match    cCustomParen    "(" contains=cParen contains=cCppParen
	syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
	hi def link cCustomFunc  Function
	hi Function term=bold gui=bold
	echo "hi"
endfunction
"call HighFunc()

set switchbuf+=usetab,newtab

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
nmap <leader>f :call ShowFuncName() <CR>

nmap j gj
nmap k gk

nmap <leader>r :set relativenumber!<cr>
vmap <c-j> <Plug>MoveBlockDown
vmap <c-k> <Plug>MoveBlockUp
nmap <c-j> <Plug>MoveLineDown
nmap <c-k> <Plug>MoveLineUp

runtime macros\matchit.vim

let g:ctrlp_funky_sort_by_mru = 1
let g:ctrlp_funky_multi_buffers = 1
let g:ctrlp_funky_nerdtree_include_files = 1

autocmd BufEnter * highlight normal guibg=white
autocmd BufEnter *.m highlight normal guibg=#FFFFEE
autocmd BufEnter *.h highlight normal guibg=#EEFFFF

"set shell=C:\Git\git-bash.exe  



"let base16colorspace=256  " Access colors present in 256 colorspace
"colorscheme base16-ocean

" AIRLINE SETTINGS
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#fnamemod = ':::tt'
let g:airline#extensions#syntastic#enabled = 0
let g:airline_detect_iminsert=1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#tagbar#enabled = 1
" END AIRLINE SETTINGS

set guifont=Consolas:h13
nnoremap <Leader><Leader>f :CtrlPFunky<Cr>

function! Test()
	execute "e temp.txt"
	execute "normal 10000dd"
	vimgrep /nextmissileActiveflag1/jg *.c
	for d in getqflist()
		execute "tabnew " .bufname(d.bufnr)
		execute "normal" .d.lnum ."gg[[kyyZZ"
		"echo bufname(d.bufnr) ':' @0 ':'
		let t = bufname(d.bufnr) ':' @0 ':' d.lnum '=' d.text
	endfor

endfunction

function! JumpDef()
	execute "normal vimgrep /<C-R><C-W>(.*\_s{/ **/*.c <cr>"
endfunction

nmap <F8> :vimgrep /<C-R><C-W>(.*\_s{/ %:h/*.c <cr>
nmap <leader>c yiwoprintf("<c-r>0 = %d\n", <c-r>0);<Esc>==
nmap <leader>j yiwoconsole.log("<c-r>0 = ", <c-r>0);<Esc>==

let g:ctrlp_mruf_default_order = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:200,results:200'
let g:ctrlp_mruf_max = 1000
let g:ctrlp_extensions = []
nmap <C-n> :NERDTreeToggle<CR>
nmap [[ [[kw

"#noremap y "+y
"#noremap yy "+yy
"#noremap p "+p
"#noremap P "+P
vnoremap // y/<C-R>"<CR>




xnoremap <silent> p p:let @"=@0<CR>
nmap <F9> :TagbarToggle<cr>


let g:tagbar_ctags_bin = 'C:\Users\Administrator\Downloads\ctags58\ctags58\ctags.exe'
nnoremap <silent><C-]> <C-w><C-]><C-w>T
highlight Pmenu guibg=brown gui=bold
nmap <F10> :CtrlPYankring<cr>

function! CloseDuplicateTabs() 
	let cnt = 0
	let i = 1

	let tpbufflst = []
	let dups = []
	let tabpgbufflst = tabpagebuflist(i)
	while type(tabpagebuflist(i)) == 3
		if index(tpbufflst, tabpagebuflist(i)) >= 0
			call add(dups,i)
		else
			call add(tpbufflst, tabpagebuflist(i))
		endif

		let i += 1
		let cnt += 1
	endwhile

	call reverse(dups)

	for tb in dups
		exec "tabclose ".tb
	endfor

endfunction

nmap CloseDupTabs :call CloseDuplicateTabs()

function! s:MyBufList()
  set nomore
  let buf_count = bufnr("$")
  echo buf_count
  for i in range(1, buf_count)
    if getbufvar(l:i, '&buflisted') > 0
      let path = bufname(i)
      let filename = fnamemodify(path, ":t")
      let folder = fnamemodify(path, ":h")
      echo filename . "\t(" . folder . ")"
	  echo tabpagenr()
    endif
  endfor
  set more
endfunction

command! MBL call s:MyBufList()

set autoread



function! GoPreviousTab()
		let g:flag = 1
		execute "tabn ".g:lasttab2[g:i12]
		let g:i12 = g:i12 - 1
		if g:i12 == -1
			let g:i12 = 0
			echom "end of list"
		endif
endfunction

function! GoNextTab()
	
	let g:i12 = g:i12 + 1
	let g:flag = 1
	let temp = len(g:lasttab2)
	if g:i12 > (temp - 1)
		let g:i12 = 0
	endif

	echo g:i12
	execute "tabn ".g:lasttab2[g:i12]
endfunction

function! TabLeaveDo()
	let a = tabpagenr()
	if g:flag == 0
		let g:lasttab2 = g:lasttab2 + [a]
		let g:i12 = len(g:lasttab2) - 1
		"echo "in Test4"
	endif 
	let g:flag = 0
endfunction

set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.o



let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'

let g:ctrlp_by_filename=0
au BufWrite * call BufWriteF()
function! BufWriteF()
	let g:LAST_INSERT_FILE = expand('%:p')
	let g:CURSOR_POS = getpos('.')
endfunction

nmap gii  :execute "O ".g:LAST_INSERT_FILE<cr>:call cursor(CURSOR_POS[1], CURSOR_POS[2])<cr>

set viminfo+=!

autocmd! VimLeave * mksession! ~/mysession.vim
"autocmd! VimEnter * source ~/vim74/Session.vim
"au GUIEnter * simalt ~x

function! s:SetMark()
    let m=getchar()
    if type(m)==type(0)
        let m=nr2char(m)
    endif
    if m=~#'^[A-Z]$'
        let pos=getpos("'".m)
        if pos[1]
            echohl Error
            echon "Mark ".m." is arleady set. Overwrite?"
            echohl None
            let c=getchar()
            if type(c)==type(0)
                let c=nr2char(c)
            endif
            echo
            if c!=?'y'
                return "<C-l>"
            endif
        endif
    endif
    return "m".m
endfunction
nnoremap <special><expr> m <SID>SetMark()


function! Test()
	call writefile(g:testlist, "test.test", "b")
	call writefile(g:testlist2, "test.test", "b")
	let cur_file_name = expand('%:p:r')
	echo cur_file_name
	"execute "tabnew ".cur_file_name
endfunction

command! -nargs=1 -complete=file O tab drop <args>

autocmd BufEnter * lcd %:p:h"

cabbrev <expr> h ((getcmdtype() == ':' && getcmdpos() <= 2)? 'bot h' : 'h')
cabbrev <expr> sess 'source ~/mysession.vim'

autocmd FileType html nnoremap <buffer> <leader>/ ^i<!--<esc>$a--><esc>
autocmd FileType html vnoremap <buffer> <leader>/ o<esc>^i<!--<esc>gvo<esc>$a--><esc>

let c=  system('date /t')
let c=  system('python test.py')
nmap p p==



let g:airline_section_c = '%{getcwd()}'
"let g:airline_section_c = '%{echo expand("%:p")}'
let g:airline_section_error='%{tabpagenr()}'
let g:airline_section_warning=''

nnoremap w :call search('\<\w', 'W')<cr>
nnoremap b :call search('\<\w', 'bW')<cr>
nnoremap e :call search('\w\>', 'W')<cr>


nmap fj :set filetype=javascript<cr>
nmap fh :set filetype=html<cr>







