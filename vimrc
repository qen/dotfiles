" %s/\"\([^"]*\)\"/'\1'/g " change double quote to single quote
" *********************************************************
if $VIMSLIM==''
" *********************************************************

set nocompatible " be iMproved, required
filetype off     " required

" =====================
" Plugins
" =====================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'

" Vim airline theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

let g:airline_theme                           = 'luna'
let g:airline_powerline_fonts                 = 1
let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tmuxline#enabled     = 0
let g:tmuxline_theme                          = 'airline'
let g:airline#extensions#tabline#enabled      = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod     = ':t' " Show just the filename

" FZF
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/vim-emoji'

Plugin 'pangloss/vim-javascript'

Plugin 'mxw/vim-jsx'

Plugin 'Yggdroot/indentLine'
let g:indentLine_enabled    = 1
let g:indentLine_color_term = 237
let g:indentLine_char       = '¦'

Plugin 'slim-template/vim-slim.git'

Plugin 'tpope/vim-haml'

Plugin 'airblade/vim-gitgutter'

Plugin 'hail2u/vim-css3-syntax'

Plugin 'vim-ruby/vim-ruby'
let g:no_ruby_maps = 0

Plugin 'tpope/vim-rails'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 0
let NERDTreeShowLineNumbers                 = 1 " enable line numbers

Plugin 'chr4/nginx.vim'
au BufRead,BufNewFile *nginx/*.conf set ft=nginx

" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plugin 'godlygeek/tabular'

Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_conceal = 0

Plugin 'scrooloose/nerdcommenter'
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
let g:NERDSpaceDelims            = 1 " Add spaces after comment delimiters by default
let g:NERDCreateDefaultMappings  = 1 " disable default mapping https://github.com/scrooloose/nerdcommenter/blob/master/plugin/NERD_commenter.vim#L3009
let g:NERDCustomDelimiters={ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' } }

Plugin 'tpope/vim-surround'
let g:surround_no_insert_mappings = 0
set timeout timeoutlen=3000 ttimeoutlen=100

Plugin 'jiangmiao/auto-pairs'
let g:AutoPairsFlyMode = 1

Plugin 'tpope/vim-endwise'

Plugin 'wincent/scalpel'

Plugin 'justinmk/vim-sneak'
let g:sneak#s_next = 1
" let g:sneak#label = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

Plugin 'tpope/vim-fugitive'

Plugin 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css,jsx,php,erb,javascript EmmetInstall

" All of your Plugins must be added before the following line
call vundle#end()

" =====================
" Scripts
" =====================

" retain cursor position
" autocmd BufEnter * silent! normal! g;g,zz

" sink function in fzf
function! CreateOrOpenFile(prefix, files)
  let files = filter(a:files[1:], '!empty(v:val)')
  if len(files) == 0
    execute 'e '.a:prefix.'/'.a:files[0]
  else
    for file in files
      execute 'e '. file
    endfor
  endif
endfunction

" confirm quit
" https://stackoverflow.com/a/32239265/3288608
function! ConfirmQuit(writeFile)
  if (a:writeFile)
    if (expand('%:t')=="")
      echo "Can't save a file with no name."
      return
    endif
    :write
  endif

  if (winnr('$')==1 && tabpagenr('$')==1)
    if (confirm("Do you really want to quit?", "&Yes\n&No", 2)==1)
      :quit
    endif
  else
    :quit
  endif
endfu
cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'call ConfirmQuit(0)' : 'q')<CR>

function! ConfirmDelete()
  if (confirm("Confirm to delete the file ".expand('%')."?", "&Yes\n&No", 2)==1)
    :call delete(expand('%')) | bdelete!
  endif
endfu

" delete file with confirmation
nnoremap <leader><BS> :call ConfirmDelete()<CR>

" save with auto create directory
" https://stackoverflow.com/a/4294176/3288608
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" https://stackoverflow.com/a/6271254/3288608
function! GetVisualSelection() range
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

function! s:input_visual_cword(visual)
  if a:visual == '0'
    call inputsave()
    let needle = input('Search: ',  expand('<cword>'), 'tag')
    call inputrestore()
    return needle
  else
    return GetVisualSelection()
  endif
endfunction

function! AgProjectDirectories(visual) range
  let needle = s:input_visual_cword(a:visual)
  if needle != ''
    call fzf#vim#ag_raw("--path-to-ignore ".getcwd()."/.ignore ".needle)
  endif
endfunction

" code search to all files limited to the current buffer file extension, ag --list-file-types
let g:ag_known_file_types = { 'ruby': '--ruby --rake', 'javascript': '--js', 'javascript.jsx': '--js', 'css': '--css --sass', 'scss': '--css --sass', 'php': '--php', 'haml': '--haml --ruby' }
function! AgSimilarFile(visual) range
  let needle = s:input_visual_cword(a:visual)
  if needle != ''
    let agftype = get(g:ag_known_file_types, &ft, '-G "\.('. expand('%:e') .')$"')
    call fzf#vim#ag_raw("--path-to-ignore ".getcwd()."/.ignore ".agftype.' '.needle)
  endif
endfunction

function! CodeReplaceSelection(range, target) range
  let target = a:target
  let suffix = a:range == 1 ? '[in range]' : ''

  if (a:range == 1)
    echo GetVisualSelection()
  else
    echo "Find and Replace Text"
  endif
  if a:target == 'current_word'
    let target = expand('<cword>')
  endif
  if a:target == 'selected_word'
    let target = GetVisualSelection()
  endif

  if target == ''
    call inputsave()
    let target = input('Search'.suffix.': ')
    call inputrestore()
  endif
  if target == ''
    return ''
  endif

  call inputsave()
  let replace = input('Replace'.suffix.' '.target.' : ')
  call inputrestore()
  if replace == ''
    return ''
  endif

  if a:range == 1
    " execute ":'<,'>Scalpel/\\\v<".target.'>/'.replace."/"
    execute ":'<,'>Scalpel/".target.'/'.replace."/"
  else
    " execute ":Scalpel/\\\v<".target.'>/'.replace."/"
    execute ":Scalpel/".target.'/'.replace."/"
  endif
endfunction

" Zoom / Restore window.
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-W>z :ZoomToggle<CR>

" =====================
" Function Command
" =====================

function! SaveAs()
  call inputsave()
  let file = input("Save as file: ".getcwd()."/", expand('%:h').'/', "dir")
  call inputrestore()
  if file != ''
    execute ':w '.file
    execute ':e '.file
  endif
endfunction
command! SaveAs call SaveAs()
nnoremap <F2> :call SaveAs()<CR>

function! RenameFile()
  let current_file = expand('%')
  call inputsave()
  let file = input("Rename file as: ".getcwd()."/", current_file, "dir")
  call inputrestore()
  if file != ''
    execute ':w '.file
    call delete(current_file) | bdelete!
    execute ':e '.file
  endif
endfunction
command! RenameFile call RenameFile()
nnoremap <F3> :call RenameFile()<CR>

function! OpenDirectory()
  call inputsave()
  let dir = input("Open Directory: ".getcwd()."/", expand('%:h'), "dir")
  call inputrestore()
  call system("open '". dir ."'")
endfunction
" open of current working directory
nnoremap <F4> :call OpenDirectory()<CR>

" scalpel find and replace word
nmap <F5> <Plug>(Scalpel)

set pastetoggle=<F6>

" Copy full path filename with path to clipboard
nmap <F7> :let @*=expand("%")<CR>
nmap <F8> :let @*=expand("%:p")<CR>

" fix mix-indent
nmap <F9> mzgg=G`z

" http://dhruvasagar.com/2013/03/28/vim-better-foldtext
function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()

" =====================
" Keyboard Setup
" =====================

" reload current file
nnoremap <Leader>r :e!<CR>

" reload vimrc
nnoremap <Leader>R :so $MYVIMRC<CR>:nohlsearch<CR>

" save file
nnoremap <silent> <leader>w :w<CR>
" inoremap <silent> <leader>w <ESC>:w<CR>

" unbind shift-k, its annoying
map <S-k> <Nop>

function! s:QuickFolder(...)
  let g:quickfolder = a:1
  if a:1 == ''
    call inputsave()
    let g:quickfolder = fnamemodify(input("Quick Folder: ", expand('%:h'), "dir"), ':h')
    call inputrestore()
  endif
  call fzf#vim#files(g:quickfolder, { 'options': '--print-query', 'sink*': function('CreateOrOpenFile', [g:quickfolder]) } )
endfunction
command! -nargs=* -complete=dir -complete=dir QuickFolder call s:QuickFolder(<q-args>)
nnoremap <c-\> :QuickFolder<space><C-R>=quickfolder<CR>

" https://github.com/junegunn/fzf.vim/issues/27#issuecomment-185761539
" AgIn dir query
function! s:AgIn(...)
  call fzf#vim#ag_raw(join(a:000[1:]).' '.a:1)
endfunction
command! -nargs=+ -complete=dir AgIn call s:AgIn(<f-args>)
nnoremap <c-space> :AgIn<space><C-R>=quickfolder<CR>

" --------------------
" Tab shortcut to operate on files
" --------------------

let agsource     = "ag -g '' --path-to-ignore ".getcwd()."/.ignore "
let fzfwindow    = "30new" " vertical botright 140new
let g:fzf_layout = { 'window': '30new' }
let quickfolder  = expand('%:h')

" buffer navigation uses Tab
nnoremap <Tab>h :bprev!<CR>
nnoremap <Tab>l :bnext!<CR>
nnoremap <Tab>j :b#<CR>
nnoremap <Tab>q :bd!<CR>

" open files
nnoremap <c-g> :GFiles<space>
nnoremap <c-o> :Files <C-R>=fnamemodify(@%, ':h')<CR>/
nnoremap <c-n> :e <C-R>=fnamemodify(@%, ':h')<CR>/

" open app project files and test
nnoremap <silent> <Tab>p :call fzf#vim#files('', { 'source': agsource.'app spec', 'options': '--print-query -i', 'window': fzfwindow } )<CR>

" search files to the current directory of the opened file
nnoremap <silent> <Tab>o :call fzf#vim#files( expand('%:h'), { 'source': agsource, 'options': "--print-query -i", 'window': fzfwindow } ) <CR>

" - quickfolder
nnoremap <silent> <Tab><Leader> :call fzf#vim#files(quickfolder, { 'options': '--print-query -i', 'window': fzfwindow } )<CR>

" search files to all open buffers, and current files in the open buffer directory
nnoremap <silent> <Tab><Tab> :call fzf#vim#buffers('', { 'options': '--print-query -i', 'window': fzfwindow }) <CR>

" - react javascript / assets
nnoremap <silent> <Leader><Leader> :call fzf#vim#files('', { 'source': agsource.'app/javascript app/assets', 'options': '--print-query -i', 'window': fzfwindow } )<CR>

" - mvc
nnoremap <silent> <Enter><Enter> :call fzf#vim#files('', { 'source': agsource.'app/models app/controllers app/views', 'options': '--print-query -i', 'window': fzfwindow } )<CR>

" find file selected text in project directories, limit to file extensions
vnoremap <silent> <c-f><c-p> :call fzf#vim#files('', { 'source': agsource.get(g:ag_known_file_types, &ft, '-G "\.('. expand('%:e') .')$"')." app spec", 'options': '-i -q "'.GetVisualSelection().'"', 'window': fzfwindow } )<CR>

nnoremap <silent> <c-f><c-p> :call fzf#vim#files('', { 'source': agsource.get(g:ag_known_file_types, &ft, '-G "\.('. expand('%:e') .')$"')." app spec", 'options': '-i -q '.expand('%:t:r:r'), 'window': fzfwindow } )<CR>

" nnoremap <silent> <ctrl>n :e <CR>
" --------------------
"  Code Search using space as suffix
" --------------------

" code search in current open file
nnoremap <silent> <space><space> :call fzf#vim#buffer_lines()<CR>

" code search selected text on current file
vnoremap <silent> <space><space> :call fzf#vim#buffer_lines( GetVisualSelection() )<CR>

" code search all project files with similar extensions
nnoremap <silent> <c-f><c-space> :call AgSimilarFile(0)<CR>

" code search selected text, all project files with similar extensions
vnoremap <silent> <c-f><c-space> :call AgSimilarFile(1)<CR>

" code search on current word to all files in current directory
" nnoremap <silent> <leader><space> :call AgProjectDirectories(0)<CR>

" code search selected text to all files in current directory
" vnoremap <silent> <leader><space> :call AgProjectDirectories(1)<CR>

" --------------------
"  Find and Replace
" --------------------

" replace text found in current buffer
nnoremap RR :call CodeReplaceSelection(0, '')<CR>

" replace text found in selected text range
vnoremap RR :call CodeReplaceSelection(1, '')<CR>

" replace text current word found in current buffer
nnoremap RT :call CodeReplaceSelection(0, 'current_word')<CR>

" replace text selected text found in current buffer
vnoremap RT :call CodeReplaceSelection(0, 'selected_word')<CR>

" --------------------
" Format code using tabularize
" --------------------

" code formating, using Tabularize, must have an existing selected text
" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
vnoremap FF :Tab/
vnoremap F= :Tab/^[^=]*\zs=<CR>
" vnoremap F: :Tab/^[^:]*\zs:<CR>
" vnoremap F: :Tab/^[^:]*\zs:/r0<CR>
vnoremap F: :Tab/: \zs<CR>
vnoremap F, :Tab/,\zs<CR>
vnoremap FM :Tab/from<CR>

" --------------------
"  Vimdiff fugitive
" --------------------
nnoremap <BS>r :diffget REMOTE<CR>
nnoremap <BS>R :%diffget REMOTE<CR>
nnoremap <BS>l :diffget LOCAL<CR>
nnoremap <BS>L :%diffget LOCAL<CR>
nnoremap <BS>2 :diffget //2<CR>
nnoremap <BS>3 :diffget //3<CR>

" --------------------

" remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e
" convert all tab to spaces on save
autocmd BufWritePre * :retab

" *********************************************************
endif " VIMSLIM END
" *********************************************************

" =====================
" keymap helper settings
" =====================

" additional ESC, on insert and visual mode
imap <c-c> <ESC>
vmap <c-c> <ESC>
nnoremap <c-q> <Esc>
" vmap jk <ESC>

" repeat last colon command
" nnoremap `` q:SF<CR>

" https://stackoverflow.com/a/6923282/3288608
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" Movement in insert mode
inoremap <C-h> <c-o>h
inoremap <C-l> <c-o>l
inoremap <C-j> <c-o>j
inoremap <C-k> <c-o>k

" search forward to a character, in edit mode
inoremap <C-f> <C-o>w
" search backward to a character, in edit mode
inoremap <C-b> <C-o>b

" center current active line in edit mode
inoremap <C-z> <C-o>zz

" auto file completion
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" remap omnicomplete to ctrl-space
" inoremap <c-space><c-space> <c-x><c-o><c-p>
" inoremap <c-@><c-@> <c-x><c-o><c-p>
set omnifunc=syntaxcomplete#Complete

" shortcut for nerd comment
nnoremap <silent> <BS><BS> :call NERDComment('n', 'Toggle')<CR>
vnoremap <silent> <BS><BS> :call NERDComment('v', 'Toggle')<CR>

" select text till end of line
vnoremap . g_

" =====================
" Settings
" =====================
"
syntax on
filetype plugin indent on    " required

set backspace=indent,eol,start
set nobackup                    " do not keep a backup file, use versions instead
set history=1000                " keep 50 lines of command line history
set encoding=utf-8
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set showmode
set incsearch                   " do incremental searching
set relativenumber
set number
" set mouse=a
" set cursorline
" set term=xterm
set swapfile
set dir=~/.vim/tmp
set hidden
set novisualbell
set noerrorbells
set hlsearch
set clipboard=unnamed
set cmdheight=1
set laststatus=2
set nowrap
set confirm

set autoindent                  " always set autoindenting on
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" code folding, :help usr_28 zi(toggle enable/disable folding)
set foldcolumn=1
set foldmethod=syntax " za(open/close folding) zO(open) zC(lose)
set foldlevel=1 " zr reduce folding, zm increase folding
set foldnestmax=5

" Split settings
set splitbelow
set splitright

" yank is also copied to clipboard:  https://stackoverflow.com/a/9166988/3288608
set guioptions+=a
set shellcmdflag=-c

" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
colorscheme Tomorrow-Night-Eighties
highlight LineNr term=NONE cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight CursorLineNR term=NONE cterm=NONE ctermfg=Yellow ctermbg=NONE gui=NONE guifg=Yellow guibg=NONE
highlight Sneak ctermfg=235 ctermbg=222
" highlight Visual ctermbg=245
" highlight Visual cterm=reverse

set scrolloff=3

" redifine keyword definition, include dash, https://woss.name/articles/vim-iskeyword/
" set iskeyword=@,!,?,48-57,_,192-255,-

" globpath wildignore
" https://stackoverflow.com/questions/25167894/how-to-exclude-files-when-using-globpath-function
if filereadable($HOME.'/.agignore')
  let &wildignore=join(readfile($HOME.'/.agignore'),',')
else
  set wildignore=*.gif,*.png,*.jpg,*.jpeg,*.eot,*.svg,*.ttf,*.woff,*.woff2,*.min.js,*.min.css,*.cache,*.swp,*~,*.sock,*.git,.git
endif

set clipboard=unnamed
