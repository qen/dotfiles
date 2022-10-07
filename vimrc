"
" ctags --languages=ruby -R -f ./.git/tags.rb .
" ctags --languages=javascript -R -f ./.git/tags.js .
"
" alias ctags-ruby='ctags --languages=ruby -R -f ./.git/tags.rb .'
" alias ctags-js='ctags --languages=javascript -R -f ./.git/tags.js .'
"
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" :CocInstall coc-tsserver coc-json coc-html coc-css coc-solargraph coc-sql coc-yaml coc-xml coc-tag :coc-syntax
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme                           = 'papercolor'
let g:airline_powerline_fonts                 = 1
let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tmuxline#enabled     = 0
let g:tmuxline_theme                          = 'airline'
let g:airline#extensions#tabline#enabled      = 1 " Enable the list of buffers
" let g:airline#extensions#tabline#fnamemod     = ':t' " Show just the filename
let g:airline#extensions#tabline#fnamemod     = ':p:.:s?app/??:s?javascript/??:s?models/??:s?controllers/??:s?views/??' " Show just the filename

" languages
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'airblade/vim-gitgutter'
Plug 'hail2u/vim-css3-syntax'
Plug 'vim-ruby/vim-ruby'
" Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'chr4/nginx.vim'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
" let g:vim_markdown_fenced_languages = ['viml=vim', 'bash=sh', 'ini=dosini']
" Plug 'tpope/vim-endwise'
" Plug 'alvan/vim-closetag'

" Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'Mofiqul/dracula.nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'nxvu699134/vn-night.nvim'
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
" Plug 'nvim-treesitter-endwise'
Plug 'theHamsta/nvim-treesitter-pairs'
Plug 'andymass/vim-matchup'
Plug 'windwp/nvim-ts-autotag'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" :TSInstall javascript html json ruby yaml dockerfile sql markdown bash graphql css regex scss

Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-refactor'

" Plug 'drybalka/tree-climber.nvim'
" Plug 'ziontee113/syntax-tree-surfer'
" Plug 'phaazon/hop.nvim'
" Plug 'mfussenegger/nvim-treehopper'
let g:no_ruby_maps = 0
let g:jsx_ext_required = 0
let g:vim_jsx_pretty_colorful_config = 1 " default 0
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = "*.html,*.xhtml,*.jsx,*.js"

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = "*.html,*.xhtml,*.jsx,*.js"

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

Plug 'godlygeek/tabular'
Plug 'wincent/scalpel'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rhubarb'
" Plug 'tommcdo/vim-fubitive'
" let g:fugitive_bitbucket_domains = [ 'talkpush' ]
" let g:fugitive_browse_handlers = [ { 'repo': 'talkpush' } ]

Plug 'scrooloose/nerdcommenter'
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
let g:NERDSpaceDelims            = 1 " Add spaces after comment delimiters by default
let g:NERDCreateDefaultMappings  = 1 " disable default mapping https://github.com/scrooloose/nerdcommenter/blob/master/plugin/NERD_commenter.vim#L3009
let g:NERDCustomDelimiters={ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' } }

Plug 'tpope/vim-surround'
let g:surround_no_insert_mappings = 0
set timeout timeoutlen=3000 ttimeoutlen=100

Plug 'windwp/nvim-autopairs'
" Plug 'jiangmiao/auto-pairs'
" let g:AutoPairsFlyMode = 1

Plug 'justinmk/vim-sneak'
" let g:sneak#s_next = 1
" let g:sneak#label = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css,jsx,php,erb,javascript,javascript.jsx EmmetInstall

" https://andrew.stwrt.ca/posts/vim-ctags/
" brew install ctags
" alias ctags="`brew --prefix`/bin/ctags"
" ctags -R -f ./.git/tags .
" set tags^=.git/tags;~

" ctags --languages=ruby -R -f ./.git/tags.rb .
" ctags-ruby
" autocmd BufEnter *.rb set tags=.guttentags;,.git/tags.rb
" autocmd BufEnter *.rb let g:gutentags_ctags_tagfile='.git/tags.rb'

" ctags --languages=javascript -R -f ./.git/tags.js .
" ctags-js
" autocmd BufEnter *.jsx,*.js set tags=.guttentags;,.git/tags.js
"
" also see ~/.ctags config file
" debug tagfiles used :echo tagfiles()
"

" vim shortcuts:
"   c-] = find tag
"   c-t = climb back up
" commands
" :GutentagsUpdate
" :GutentagsUpdate!
"
" Plug 'https://github.com/ludovicchabant/vim-gutentags'
" set statusline+=%{gutentags#statusline()}
" let g:gutentags_enabled=1
" let g:gutentags_ctags_tagfile='.guttentags'
" let g:gutentags_generate_on_write=0 " disable it and just run the :GutentagsUpdate manually
" let g:gutentags_ctags_auto_set_tags = 0
" let g:gutentags_trace = 1

Plug 'Yggdroot/indentLine'
let g:indentLine_enabled    = 1
let g:indentLine_color_term = 236
" https://github.com/morhetz/gruvbox/blob/master/colors/gruvbox.vim
" let g:indentLine_color_gui  = '#504945'
" let g:indentLine_color_gui  = '#32302f'
" let g:indentLine_char       = '┆'
" let g:indentLine_char_list = ['|', '┊', '⁞', '┆', '¦', '⁞', '┊', '⁞', '┆', '¦', '⁞', '┊', '⁞', '┆', '¦', '⁞', '┊', '⁞', '┆', '¦', '⁞']
let g:indentLine_char_list = ['|', '┊', '¦', '┆', '┊', '¦', '┆', '┊', '¦', '┆', '┊', '¦', '┆', '┊', '¦', '┆', '┊', '¦', '┆', '┊', '¦', '┆']

" forc nginx config
au BufRead,BufNewFile *nginx/*.conf set ft=nginx
" force ruby for .jbuilder
au BufRead,BufNewFile Guardfile,Gemfile,*.jbuilder set ft=ruby
" force yaml for .yml
au BufRead,BufNewFile *.yml set ft=yaml
" forc Dockerfile
au BufRead,BufNewFile Dockerfile.* set ft=dockerfile

Plug 'jparise/vim-graphql'

Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-dispatch'
" let g:rspec_command = "Dispatch bin/rspec {spec}"
" let g:rspec_command = "Dispatch bundle exec rspec {spec}"
let g:rspec_command = "Dispatch! bundle exec rspec -I . {spec}"
let g:rspec_runner = "os_x_iterm2"
" autocmd WinNew * wincmd L
au FileType qf wincmd L
let g:dispatch_tmux_height = '50%'
function! FocusRunNearestSpec()
  if search("binding\.pry") != 0
    let g:rspec_command = "Start bundle exec rspec -I . {spec}"
    call RunNearestSpec()
    let g:rspec_command = "Dispatch! bundle exec rspec -I . {spec}"
  else
    call RunNearestSpec()
  end
endfunction
function! PryRunNearestSpec()
  if match(getline('.'), "binding\.pry") == -1
    execute "normal \<s-O>binding.pry\<ESC>:w\<CR>"
  end
  call FocusRunNearestSpec()
endfunction
" run focus if there is binding.pry
noremap <Leader>t :call FocusRunNearestSpec()<CR>
" shortcut key to insert binding.pry for ruby files
noremap <leader>d :call PryRunNearestSpec()<CR>
noremap <Leader>TT :call RunCurrentSpecFile()<CR>
noremap <Leader>TD :Start specg dbmigrate<CR>
noremap <Leader>TL :Start specg dbload<CR>
noremap <Leader>RC :Start bundle exec rails console<CR>
noremap <Leader>RD :Dispatch! bundle exec rails db:migrate<CR>
noremap <Leader>RT :Dispatch! bundle exec rails i18n:js:export<CR>
noremap <Leader>Z :Start zsh<CR>

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        vertical Copen
    else
        cclose
    endif
endfunction

nmap <silent> <Leader><Leader> :call ToggleQuickFix()<CR>
nmap <silent> <c-\> :Copen<CR>
" Initialize plugin system
call plug#end()
" --------------------------------------------------------------------------------

" INSPIRED BY from https://www.youtube.com/watch?v=-I1b8BINyEw

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gb :Git blame<CR>
nmap <leader>gh :History<CR>

" gruvbox https://github.com/morhetz/gruvbox/wiki/Usage
nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

" my specific global config
let appignore = ''

if filereadable(getcwd().'/.appignore')
  let appignore = " --path-to-ignore ".getcwd()."/.appignore "
endif

let agsource = "ag -g ''".appignore

let appmvc    = ''
let appassets = ''
let appspec   = 'app spec jest features'
if filereadable(getcwd().'/.appfolders')
  let appfolders = readfile(getcwd().'/.appfolders')
  if (get(appfolders, 0, -1) >= 0) | let appmvc    = appfolders[0] | endif
  if (get(appfolders, 1, -1) >= 0) | let appassets = appfolders[1] | endif
  if (get(appfolders, 2, -1) >= 0) | let appspec   = appfolders[2] | endif
endif

" shortcut for nerd comment
nnoremap <silent> <BS><BS> :call nerdcommenter#Comment('n', 'Toggle')<CR>
vnoremap <silent> <BS><BS> :call nerdcommenter#Comment('v', 'Toggle')<CR>
" nerdcommenter#Comment()
" COC Config
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#improve-the-completion-experience
" inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" inoremap <silent><expr> <space> coc#pum#visible() ? coc#pum#confirm() : "\<space>"

" inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#use-tab-or-custom-key-for-trigger-completion
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <Leader> to accept selected completion item or notify coc.nvim to format
" inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

" show suggestions
inoremap <silent><expr> <c-space> coc#pum#visible() ? coc#pum#confirm() : coc#refresh()

" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" set coc suggestions dropdown height
set pumheight=15

" remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e
" convert all tab to spaces on save
autocmd BufWritePre * :retab

" select text till end of line
vnoremap $ g_

" start of string instead
nnoremap 0 ^
vnoremap 0 ^

" =====================
" Inline functions extensions
" =====================
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
nmap <F5> <Plug>(Scalpel)

set pastetoggle=<F6>

" Copy full path filename with path to clipboard
nmap <F7> :let @*=expand("%")<CR>
nmap <F8> :let @*=expand("%:p")<CR>
" copy to system clipboard: "*y
" paste from system clipboard: "*p

" fix mix-indent
nmap <F9> mzgg=G`z

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

" https://coderwall.com/p/usd_cw/a-pretty-vim-foldtext-function
function! FoldText()
  let l:lpadding = &fdc
  redir => l:signs
    execute 'silent sign place buffer='.bufnr('%')
  redir End
  let l:lpadding += l:signs =~ 'id=' ? 2 : 0
  if exists("+relativenumber")
    if (&number)
      let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
    elseif (&relativenumber)
      let l:lpadding += max([&numberwidth, strlen(v:foldstart - line('w0')), strlen(line('w$') - v:foldstart), strlen(v:foldstart)]) + 1
    endif
  else
    if (&number)
      let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
    endif
  endif
  " expand tabs
  let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
  let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')
  let l:info = ' (' . (v:foldend - v:foldstart) . ')'
  let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
  let l:width = winwidth(0) - l:lpadding - l:infolen
  let l:separator = ' … '
  let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
  let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
  let l:text = l:start . ' … ' . l:end
  return l:text . repeat(' ', l:width - strlen(substitute(l:text, ".", "x", "g"))) . l:info
endfunction
set foldtext=FoldText()

" https://github.com/junegunn/fzf.vim/issues/27#issuecomment-185761539
" AgIn dir query
function! s:AgIn(...)
  call fzf#vim#ag_raw(join(a:000[1:]).' '.a:1)
endfunction
command! -nargs=+ -complete=dir AgIn call s:AgIn(<f-args>)

function! RelativeParentFileSearch(path)
  let path = a:path
  let folders = split(expand(path), '/') | let parent = '' | let query = expand(path).'/'
  if len(folders) > 2
    let parent = join(folders[0:1], '/')
    let query  = join(folders[2:], '/').'/'
  endif

  " let filename = fnamemodify(expand('%:t'), ':r')
  " if filename == 'index'
  "   let query  = join(folders[2:-2], '/').'/'
  " endif

  " call fzf#vim#files(parent,  { 'source': g:agsource,  'options': '--print-query -i --no-hscroll -q "'.(query).'"' } )
  call fzf#vim#files(parent,  { 'source': g:agsource,  'options': '-i --no-hscroll -q "'.(query).'"' } )
endfunction

function! SimilarFilenameSearch(visualrange)
  if a:visualrange == '0'
    let query = fnamemodify(expand('%:t'), ':r')
    if query == 'index'
      let query = expand('%:h:t')
    endif
  else
    let query = GetVisualSelection()
  endif

  call fzf#vim#files('', { 'source': AgSourceSimilar(), 'options': '-i --no-hscroll -q "'.(query).'"' } )
endfunction

let g:ag_known_file_types = {
  \ 'ruby'            : ' "\.(rb|rake|slim|erb|haml|jbuilder|json|feature|js|jsx)$"',
  \ 'yaml'            : ' "\.(rb|rake|slim|erb|haml|jbuilder|json|feature|js|jsx|yml)$"',
  \ 'eruby.yaml'      : ' "\.(rb|rake|slim|erb|haml|jbuilder|json|feature|js|jsx|yml)$"',
  \ 'slim'            : ' "\.(rb|rake|slim|erb|haml|jbuilder|json|js|jsx)$"',
  \ 'javascriptreact' : ' "\.(js|jsx|css|sass|scss|rb|jbuilder|json|slim|erb)$"',
  \ 'javascript'      : ' "\.(js|jsx|css|sass|scss|rb|jbuilder|json|slim|erb)$"',
  \ 'javascript.jsx'  : ' "\.(js|jsx|css|sass|scss|rb|jbuilder|json|slim|erb)$"',
  \ 'css'             : ' "\.(css|sass|scss|js|jsx|rb|jbuilder|json|slim|erb)$"',
  \ 'scss'            : ' "\.(css|sass|scss|js|jsx|rb|jbuilder|json|slim|erb)$"',
  \ 'php'             : ' "\.(php)$"',
  \ 'haml'            : ' "\.(slim|jbuilder|json|erb|haml|rb|rake|js|jsx|css|sass|scss)$"',
  \ 'markdown'        : ' "\.(md|rb)$"' }

function! AgSimilarFile(visual) range
  let needle = s:input_visual_cword(a:visual)
  if needle != ''
    let agftype = get(g:ag_known_file_types, &ft, ' "\.('. expand('%:e') .')$"')
    call fzf#vim#ag_raw(g:appignore.' -G '.agftype.' "'.needle.'"')
  endif
endfunction

function! AgSourceSimilar()
  let agftype = get(g:ag_known_file_types, &ft, '')
  if agftype == ''
    let agftype = ' "\.('. expand('%:e') .'|js|jsx|css|sass|scss|rb|jbuilder|json|slim|erb)$" '
  endif

  " globpath('app', '*')
  return "ag -g ".agftype." ".g:appignore
endfunction

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

" =====================
" Shortcut keys
" =====================

" reload current file and update tag file
" nnoremap <Leader>r :e! <bar> :GutentagsUpdate! <CR>

" unbind shift-k, its annoying
map <S-k> <Nop>

" save file
nnoremap <C-s> :w<CR>
" nnoremap <leader>w :w<CR>

" buffer navigation uses Tab
nnoremap <Tab>h :bprev!<CR>
nnoremap <Tab>l :bnext!<CR>
nnoremap <Tab>j :b#<CR>
nnoremap <Tab>q :bd!<CR>
" cloase all buffer except the current one
nnoremap <Tab>c :w <bar> %bd <bar> e# <bar> bd# <CR>

" remap ctrl-i ( because tab is remapped ) jump to ctrl-l instead, ctrl-o still works as usual
nnoremap <C-l> <C-i>
" remap ctrl-^ more reachable keymap
nnoremap <C-j> <C-^>

"
" new file
nnoremap <c-n><c-f> :e <C-R>=fnamemodify(@%, ':h')<CR>/
nnoremap <c-n><c-n> :e<space>

" open files
nnoremap <c-f><c-p> :Files <C-R>=fnamemodify(@%, ':h')<CR>/
" nnoremap <c-f><c-p> :Files<space>
nnoremap <c-f><c-g> :GFiles?<CR>
" search similar file name
nnoremap <c-f><c-f> :call SimilarFilenameSearch('0')<CR>
vnoremap <c-f><c-f> :call SimilarFilenameSearch( GetVisualSelection() )<CR>

" search files to all OPENED files/buffers
nnoremap <silent> <Tab>o :Buffers <CR>

" open current folder and 3 other parent folder
nnoremap <silent> <Tab><Tab> :call RelativeParentFileSearch('%:h')<CR>
nnoremap <silent> <S-Tab><S-Tab> :call RelativeParentFileSearch('%:h:h')<CR>

" - app mvc
" nnoremap <silent> <Enter><Enter> :call fzf#vim#files('app', { 'source': agsource.appmvc, 'options': '--print-query -i' } )<CR>
" nnoremap <silent> <Enter><Enter> :call fzf#vim#files('app', { 'source': agsource.appmvc } )<CR>
nnoremap <silent> <Enter><Enter> :GFiles<CR>
" nnoremap <silent> <s-f><s-f> :call fzf#vim#files('', { 'source': g:agsource, 'options': '--print-query -i --no-hscroll -q "'.(fnamemodify(expand('%:t'), ':r')).'"' } )<CR>

" - app react javascript / assets
" nnoremap <silent> <Leader><Leader> :call fzf#vim#files('app', { 'source': agsource.appassets, 'options': '--print-query -i' } )<CR>
" nnoremap <silent> <Leader><Leader> :call fzf#vim#files('app', { 'source': agsource.appassets } )<CR>

" - app spec similar file
" nnoremap <silent> <C-p> :call fzf#vim#files('', { 'source': AgSourceSimilar().appspec, 'options': '--print-query -i' } )<CR>
nnoremap <silent> <C-p> :call fzf#vim#files('', { 'source': AgSourceSimilar().appspec } )<CR>

" --------------------
"  Code Search using space as suffix
" --------------------

" code search in current open file
nnoremap <silent> <space><space> :call fzf#vim#buffer_lines()<CR>
nnoremap <silent> <c-space> :call fzf#vim#buffer_lines( expand('<cword>') )<CR>
nnoremap <silent> <tab><space> :call fzf#vim#lines( expand('<cword>') )<CR>
" nnoremap <silent> <space><space> :echom "normal /" . expand('<cword>') . "/e+1\<cr>"
vnoremap <silent> <c-space> :call fzf#vim#buffer_lines( GetVisualSelection() )<CR>

" code search all project files with similar extensions
" nnoremap <silent> <c-f><space> :call AgSimilarFile(0)<CR>
vnoremap <c-f><space> :call AgSimilarFile(1)<CR>

nnoremap <c-f><space> :AgIn<space><C-R>=fnamemodify(@%, ':h:h')<CR>

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
nnoremap <BS>1 :diffget 1<CR>
nnoremap <BS>2 :diffget 2<CR>
nnoremap <BS>3 :diffget 3<CR>

" additional ESC, on insert and visual mode
imap <c-c> <ESC>
vmap <c-c> <ESC>
nnoremap <c-q> <Esc>

" select all
nnoremap <c-a> ggVG

" https://stackoverflow.com/a/6923282/3288608
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
cnoremap <c-k> <Up>
cnoremap <c-j> <Down>
cnoremap <c-h> <Left>
cnoremap <c-l> <Right>

" Movement in insert mode
inoremap <c-h> <c-o>h
inoremap <c-l> <c-o>l
inoremap <c-j> <c-o>j
inoremap <c-k> <c-o>k

" =====================
" Settings
" =====================
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
" set wrap
set confirm

set autoindent                  " always set autoindenting on
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" code folding, :help usr_28 zi(toggle enable/disable folding)
set foldcolumn=0
" set foldmethod=syntax " za(open/close folding) zO(open) zC(lose)
" set foldmethod=nvim_treesitter#foldexpr() " za(open/close folding) zO(open) zC(lose)
set foldlevel=1 " zr reduce folding, zm increase folding
set foldnestmax=5
" set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

set scrolloff=3
set sidescrolloff=30

" globpath wildignore
" https://stackoverflow.com/questions/25167894/how-to-exclude-files-when-using-globpath-function
if filereadable($HOME.'/.agignore')
  let &wildignore=join(readfile($HOME.'/.agignore'),',')
else
  set wildignore=*.gif,*.png,*.jpg,*.jpeg,*.eot,*.svg,*.ttf,*.woff,*.woff2,*.min.js,*.min.css,*.cache,*.swp,*~,*.sock,*.git,.git
endif

" disable vim netrw
let loaded_netrwPlugin = 1

" set colorscheme gruvbox
colorscheme gruvbox
" " configure nvcode-color-schemes
" let g:nvcode_termcolors=256
" syntax on
" colorscheme nvcode " Or whatever colorscheme you make
" " checks if your terminal has 24-bit color support
" if (has("termguicolors"))
"     set termguicolors
"     hi LineNr ctermbg=NONE guibg=NONE
" endif
" colorscheme dracula
" colorscheme github_dark_default
" colorscheme github_dimmed
colorscheme vn-night
" colorscheme gruvbox-baby

" override folded color
" highlight LineNr term=NONE cterm=NONE ctermfg=2C2F33 ctermbg=NONE gui=NONE guifg=2C2F33 guibg=NONE
" highlight LineNr term=NONE cterm=NONE  ctermbg=NONE gui=NONE guibg=NONE guifg=66899D ctermfg=66899D
" highlight CursorLineNr term=NONE cterm=NONE ctermfg=White ctermbg=NONE gui=NONE guifg=White guibg=NONE
highlight LineNr term=NONE cterm=NONE ctermfg=Gray ctermbg=NONE gui=NONE guifg=Gray guibg=NONE
highlight Folded term=NONE cterm=NONE ctermfg=Grey ctermbg=NONE gui=NONE guifg=Grey guibg=NONE

" using luna theme for modified files
au VimEnter * let g:airline#themes#papercolor#palette.normal_modified = g:airline#themes#luna#palette.normal_modified
au VimEnter * let g:airline#themes#papercolor#palette.insert_modified = g:airline#themes#luna#palette.insert_modified
au VimEnter * let g:airline#themes#papercolor#palette.visual_modified = g:airline#themes#luna#palette.visual_modified
au VimEnter * let g:airline#themes#papercolor#palette.tabline = { 'airline_tabmod': ['#ffffff', '#780000', 231, 88, ''] }
au VimEnter * :AirlineRefresh

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END



" At the bottom of your init.vim, keep all configs
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable=true
  },
  -- pairs = {
  --   enable = true,
  --   disable = {},
  --   highlight_pair_events = {}, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
  --   highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
  --   goto_right_end = false, -- whether to go to the end of the right partner or the beginning
  --   fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
  --   keymaps = {
  --     goto_partner = "<leader>%",
  --     delete_balanced = "X",
  --   },
  --   delete_balanced = {
  --     only_on_first_char = false, -- whether to trigger balanced delete when on first character of a pair
  --     fallback_cmd_normal = nil, -- fallback command when no pair found, can be nil
  --     longest_partner = false, -- whether to delete the longest or the shortest pair when multiple found.
  --                              -- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
  --   }
  -- },
  autotag = {
    enable = true,
    filetypes = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript', 'javascript.jsx',
      'xml',
      'php',
      'markdown',
      'glimmer','handlebars','hbs'
    },
  },
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- you can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      },
      -- You can choose the select mode (default is charwise 'v')
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding xor succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      include_surrounding_whitespace = true,
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]k"] = "@class.outer",
      },
      goto_next_end = {
        ["]F"] = "@function.outer",
        ["]K"] = "@class.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[k"] = "@class.outer",
      },
      goto_previous_end = {
        ["[F"] = "@function.outer",
        ["[K"] = "@class.outer",
      },
    },
  },
  refactor = {
    highlight_definitions = {
      enable = false,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
    highlight_current_scope = { enable = false },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "gR",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gd",
        list_definitions = "gD",
        list_definitions_toc = "gO",
        goto_next_usage = "gn",
        goto_previous_usage = "gp",
      },
    },
  },
}

local npairs = require('nvim-autopairs')
-- add option map_cr
npairs.setup({ map_cr = true })

npairs.add_rules(require('nvim-autopairs.rules.endwise-elixir'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))

-- npairs.setup({ map_bs = false, map_cr = false })
-- vim.g.coq_settings = { keymap = { recommended = false } }
--
-- local remap = vim.api.nvim_set_keymap
-- -- these mappings are coq recommended mappings unrelated to nvim-autopairs
-- -- remap('i', '<esc>', [[coc#pum#visible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
-- -- remap('i', '<c-c>', [[coc#pum#visible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
-- remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
-- -- remap('i', '<s-tab>', [[coc#pum#visible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })
--
-- -- skip it, if you use another global object
-- _G.MUtils= {}
--
-- MUtils.CR = function()
--   if vim.fn.pumvisible() ~= 0 then
--     if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
--       return npairs.esc('<c-y>')
--     else
--       return npairs.esc('<c-e>') .. npairs.autopairs_cr()
--     end
--   else
--     return npairs.autopairs_cr()
--   end
-- end
-- remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })
--
-- MUtils.BS = function()
--   if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
--     return npairs.esc('<c-e>') .. npairs.autopairs_bs()
--   else
--     return npairs.autopairs_bs()
--   end
-- end
-- remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })


-- local remap = vim.api.nvim_set_keymap
-- remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
-- remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
-- remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
-- remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

-- -- tree climber
-- local keyopts = { noremap = true, silent = true }
-- vim.keymap.set({'n', 'v', 'o'}, 'H', require('tree-climber').goto_parent, keyopts)
-- vim.keymap.set({'n', 'v', 'o'}, 'L', require('tree-climber').goto_child, keyopts)
-- vim.keymap.set({'n', 'v', 'o'}, 'J', require('tree-climber').goto_next, keyopts)
-- vim.keymap.set({'n', 'v', 'o'}, 'K', require('tree-climber').goto_prev, keyopts)
-- vim.keymap.set({'v', 'o'}, 'in', require('tree-climber').select_node, keyopts)
-- vim.keymap.set('n', '<c-k>', require('tree-climber').swap_prev, keyopts)
-- vim.keymap.set('n', '<c-j>', require('tree-climber').swap_next, keyopts)

-- -- Syntax Tree Surfer
-- local opts = {noremap = true, silent = true}
--
-- -- Normal Mode Swapping:
-- -- Swap The Master Node relative to the cursor with it's siblings, Dot Repeatable
-- vim.keymap.set("n", "vU", function()
--   vim.opt.opfunc = "v:lua.STSSwapUpNormal_Dot"
--   return "g@l"
-- end, { silent = true, expr = true })
-- vim.keymap.set("n", "vD", function()
--   vim.opt.opfunc = "v:lua.STSSwapDownNormal_Dot"
--   return "g@l"
-- end, { silent = true, expr = true })
--
-- -- Swap Current Node at the Cursor with it's siblings, Dot Repeatable
-- vim.keymap.set("n", "vd", function()
--   vim.opt.opfunc = "v:lua.STSSwapCurrentNodeNextNormal_Dot"
--   return "g@l"
-- end, { silent = true, expr = true })
-- vim.keymap.set("n", "vu", function()
--   vim.opt.opfunc = "v:lua.STSSwapCurrentNodePrevNormal_Dot"
--   return "g@l"
-- end, { silent = true, expr = true })
--
-- --> If the mappings above don't work, use these instead (no dot repeatable)
-- -- vim.keymap.set("n", "vd", '<cmd>STSSwapCurrentNodeNextNormal<cr>', opts)
-- -- vim.keymap.set("n", "vu", '<cmd>STSSwapCurrentNodePrevNormal<cr>', opts)
-- -- vim.keymap.set("n", "vD", '<cmd>STSSwapDownNormal<cr>', opts)
-- -- vim.keymap.set("n", "vU", '<cmd>STSSwapUpNormal<cr>', opts)
-- --
-- -- Visual Selection from Normal Mode
-- vim.keymap.set("n", "vx", '<cmd>STSSelectMasterNode<cr>', opts)
-- vim.keymap.set("n", "vn", '<cmd>STSSelectCurrentNode<cr>', opts)
-- --
-- -- Select Nodes in Visual Mode
-- vim.keymap.set("x", "J", '<cmd>STSSelectNextSiblingNode<cr>', opts)
-- vim.keymap.set("x", "K", '<cmd>STSSelectPrevSiblingNode<cr>', opts)
-- vim.keymap.set("x", "H", '<cmd>STSSelectParentNode<cr>', opts)
-- vim.keymap.set("x", "L", '<cmd>STSSelectChildNode<cr>', opts)
--
-- -- Swapping Nodes in Visual Mode
-- vim.keymap.set("x", "<A-j>", '<cmd>STSSwapNextVisual<cr>', opts)
-- vim.keymap.set("x", "<A-k>", '<cmd>STSSwapPrevVisual<cr>', opts)


-- -- Targeted Jump with virtual_text
-- local sts = require("syntax-tree-surfer")
-- vim.keymap.set("n", "gv", function() -- only jump to variable_declarations
--   sts.targeted_jump({ "variable_declaration" })
-- end, opts)
-- vim.keymap.set("n", "gfu", function() -- only jump to functions
--   sts.targeted_jump({ "function", "arrrow_function", "function_definition" })
--   --> In this example, the Lua language schema uses "function",
--   --  when the Python language uses "function_definition"
--   --  we include both, so this keymap will work on both languages
-- end, opts)
-- vim.keymap.set("n", "gif", function() -- only jump to if_statements
--   sts.targeted_jump({ "if_statement" })
-- end, opts)
-- vim.keymap.set("n", "gfo", function() -- only jump to for_statements
--   sts.targeted_jump({ "for_statement" })
-- end, opts)
-- vim.keymap.set("n", "gj", function() -- jump to all that you specify
--   sts.targeted_jump({
--     "function",
--     "if_statement",
--     "else_clause",
--     "else_statement",
--     "elseif_statement",
--     "for_statement",
--     "while_statement",
--     "switch_statement",
--   })
-- end, opts)

-- require("tsht").config.hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }
--
-- -- place this in one of your configuration file(s)
-- require'hop'.setup()
-- vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
-- vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
-- vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
-- vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})

EOF

