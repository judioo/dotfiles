nnoremap <silent> <F8> :Tlist<CR>
set incsearch
set ai sm
set ts=2
set sw=2
set sts=2
set et


"" turn on clolured highlighting
if &t_Co > 2 || has("gui_running")
	set hlsearch
endif

"" map F5 to :W (syntax checking from perl)
map <F1> :w ! perl<CR>
map <F2> <C-W>+
map <F3> <C-W>-
map <F4> <C-W>_
map <F5> <C-W>=
map <F6> :W<CR>
map <F9> <C-W>>
map <F10> <C-W><
"nmap <C-T> :tabnew<CR>
map! <C-Left> <Nop>
map <C-Left> zc
map <C-Right> zo

" auto create a pm template
" autocmd BufNewFile *.pm 0r /home/uo/.vim/skeleton.pm
autocmd BufNewFile *.pm so /home/uo/.vim/skeleton.pm
autocmd BufNewFile *.pm exe "1," . 2 . "g+package .*+s++package ".expand("%")
autocmd BufNewFile *.pm silent! exe "1," . 2 . "g+lib/+s++"
autocmd BufNewFile *.pm silent! exe "1," . 2 . "g+perl/+s++"
autocmd BufNewFile *.pm silent! exe "1," . 2 . "g+/+s++::+g"
autocmd BufNewFile *.pm silent! exe "1," . 2 . "g/.pm/s//;"


"" http://vimcasts.org/episodes/aligning-text-with-tabular-vim
"" https://gist.github.com/287147
let mapleader=','
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

execute pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype plugin indent on
