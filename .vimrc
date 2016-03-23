set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'
" Plugin 'majutsushi/tagbar'
" Plugin 'hallettj/jslint.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"


" syntastic related setting
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"let g:syntastic_javascript_checkers = ['jslint']

" Jayhuang set for personal
" add the line number
set number
" auto tab
set ai
" highlight cursor
set cursorline


" Load the nerdtree plugin
nnoremap <silent> <F5> :NERDTree<CR>

"Set the key map
imap <c-d> <esc>ddi
imap <c-u> <esc>viwui
"imap <c-U> <esc>viwUi

" set the actions for enter/leave the vim
fu! SaveSess()
  execute 'mksession! ' . getcwd() . '/.session.vim'
endfunction

fu! RestoreSess()
  if filereadable(getcwd() . '/.session.vim')
    execute 'so ' . getcwd() . '/.session.vim'
      if bufexists(1)
        for l in range(1, bufnr('$'))
	  if bufwinnr(l) == -1
	    exec 'sbuffer ' . l
	  endif
        endfor
      endif
  endif
  syntax on
endfunction


"  autocmd VimLeave * NERDTreeClose
"  autocmd VimLeave * call SaveSess()

" In home folder, we don't want to use project tree view....
if 0
if getcwd() != $HOME
  autocmd VimEnter * call RestoreSess()
  autocmd VimEnter * NERDTree
endif
endif
" Customization command Ss: Save the session state
command Ss NERDTreeClose | call SaveSess() | NERDTree

"set for vim-javascript
set regexpengine=1
syntax enable

"set for indent-guides

"??

"set for tern_for_vim
let tern_show_signature_in_pum = 1
let tern_show_argument_hints = 'on_hold'
autocmd FileType javascript nnoremap <leader>d :TernDef<CR>
autocmd FileType javascript setlocal omnifunc=tern#Complete
