"------------------------------------------------------------
" Features {{{1
"
" Vi互換モードをオフ（Vimの拡張機能を有効）
set nocompatible

" ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
filetype indent plugin on

" 色づけをオン
syntax on

"------------------------------------------------------------
" Must have options {{{1
"
" バッファを保存しなくても他のバッファを表示できるようにする
set hidden

" コマンドライン補完を便利に
set wildmenu

" タイプ途中のコマンドを画面最下行に表示
set showcmd

" 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
set hlsearch

" インクリメンタルサーチ
set incsearch
" <http://www.vim.org/scripts/script.php?script_id=1876>.
" 歴史的にモードラインはセキュリティ上の脆弱性になっていたので、
" オフにして代わりに上記のsecuremodelinesスクリプトを使うとよい。
" set nomodeline

"------------------------------------------------------------
" Usability options {{{1
"
" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
" 混在しているときは区別する
set ignorecase
set smartcase

" オートインデント、改行、インサートモード開始直後にバックスペースキーで
" 削除できるようにする。
set backspace=indent,eol,start

" オートインデント
set autoindent

" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline

" 画面最下行にルーラーを表示する
set ruler

" ステータスラインを常に表示する
set laststatus=2

" バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
" かどうか確認を求める
set confirm

" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set visualbell

" そしてビジュアルベルも無効化する
set t_vb=

" 全モードでマウスを有効化
set mouse=a

" コマンドラインの高さを2行に
set cmdheight=2

" 行番号を表示
set number

" キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
set notimeout ttimeout ttimeoutlen=200


"------------------------------------------------------------
" Indentation options {{{1
" インデント関連のオプション {{{1
"
" タブ文字の代わりにスペース2個を使う場合の設定。
" この場合、'tabstop'はデフォルトの8から変えない。
set shiftwidth=2
set softtabstop=2
set expandtab

" インデントにハードタブを使う場合の設定。
" タブ文字を2文字分の幅で表示する。
"set shiftwidth=2
"set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
" マッピング
"
" Yの動作をDやCと同じにする
map Y y$

" ESC二回押しで検索後の強調表示を解除する
nnoremap  <Esc><Esc> :<C-u>nohlsearch<cr><Esc>

" jkタイプでノーマルモードへ戻る
inoremap jk  <Esc>


"------------------------------------------------------------
" ファイル関連

" 以下のファイル名をrubyファイルとみなす
autocmd BufNewFile,BufRead Gemfile setlocal filetype=ruby

"------------------------------------------------------------
" ファイル関連


"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
" required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'shougo/neobundle.vim'
NeoBundle 'conradirwin/vim-bracketed-paste'
"neobundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
"NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'evidens/vim-twig'

" vim-east-align {{{
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"}}}

" syntastic {{{
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_html_tidy_exec = 'tidy5'
" }}}

" unite {{{
let g:unite_enable_start_insert=1
nmap <silent> <C-u><C-b> :<C-u>Unite buffer<CR>
nmap <silent> <C-u><C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nmap <silent> <C-u><C-r> :<C-u>Unite -buffer-name=register register<CR>
nmap <silent> <C-u><C-m> :<C-u>Unite file_mru<CR>
nmap <silent> <C-u><C-u> :<C-u>Unite buffer file_mru<CR>
au FileType unite nmap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite imap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nmap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite imap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nmap <silent> <buffer> <ESC><ESC> q
au FileType unite imap <silent> <buffer> <ESC><ESC> <ESC>q
" }}}

NeoBundle 'Shougo/neomru.vim', {
  \ 'depends' : 'Shougo/unite.vim'
  \ }

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck
