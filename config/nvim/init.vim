"----------------------------------------
" マッピング(ショートカット)
"----------------------------------------

"-----------nmap(コマンド補完)---------"

" ハイライト解除: Esc ×2
nmap <Esc><Esc> :nohlsearch<CR><Esc>



"----------------------------------------
" マッピング(補完)
"----------------------------------------

" 括弧補完(改行つき)
inoremap {<Enter> {}<Left><CR><CR><UP>
inoremap [<Enter> []<Left><CR><CR><UP>

" 補完
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap " ""<Left>

inoremap <> <><Left>

"tex"
inoremap \frac{ \frac{}{}<Left><left><left>
inoremap $$ $$<Left>

"java"
inoremap javapp System.out.println();<Left><left>


"-----------------------------------------
" 基本設定
"----------------------------------------

"ヤンク: クリップボードを使用
set clipboard=unnamedplus

"問題対処: バックスペースが効かない
set backspace=indent,eol,start

"文字コード: UFT-8
set fenc=utf-8


"----------------ファイル管理-------------------"
" バックアップファイル: 作らない
set nobackup

" スワップファイル: 作らない
set noswapfile


" 自動読み直し: 編集中のファイルの変更を読み直す
set autoread

" 編集中のファイルを開く: 許可
set hidden



"----------------------------------------
" 表示
"----------------------------------------

" 折り返し: 有り
set wrap

 " 全角文字: 対応
set ambiwidth=double 

" ファイル名: 常に表示
set laststatus=2


" 行番号: 表示
set number


" 強調表示: ON
syntax on

set cursorline      " 現在の行をハイライト

" カーソル移動      : 行末+1文字まで
set virtualedit=onemore

" カーソル表示      : 縦棒
let &t_ti.="\e[5 q" 

" スマートインデント: 有効
set smartindent

" 入力コマンドをステータスに表示
set showcmd


" ステータスライン  : 常に表示
set laststatus=2


" コマンドラインの補完
set wildmode=list:longest


"左右のカーソル移動で行間移動可能にする。
set whichwrap=b,s,<,>,[,]

"折り返し表示の際にも表示行単位で移動する
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk


"---------色-----------"
" 行番号
hi LineNr ctermbg=0 ctermfg=4
hi CursorLineNr ctermbg=6 ctermfg=0

"-------------------------------
" 括弧
"-------------------------------

" 括弧入力時の対応する括弧を表示
set showmatch
set matchtime=1                 "ハイライトされるまでの待ち時間
set matchpairs& matchpairs+=<:> "<>も対応
"括弧ハイライトの色             : 文字色[赤] ハイライト色[黒]
hi MatchParen ctermfg=red ctermbg=black



"----------------------------------------
" Tab
"----------------------------------------


" Tab文字を半角スペースにする
set expandtab

" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4

" 行頭でのTab文字の表示幅
set shiftwidth=4

" ファイル名の補完
set nocompatible
set wildmenu

"----------------------------------------
" 検索
"----------------------------------------

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" 検索語をハイライト表示
set hlsearch


"----------------------------
" マウス, track pad操作: 有効
"----------------------------


set mouse=a









"------------------------
" プラグイン
"------------------------


" 起動時の動作

if has('vim_starting')
    " 初回起動時にruntimepathにNeoBundleのパスを指定する
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    " NeoBundleが未インストールならgit cloneする
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))





" プラグイン管理

" NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'


"-------------------- 追加プラグイン
" プラグインを追加するときは以下に記述

" Neo-tree  : ファイルをツリー形式で表示
 NeoBundle 'nvim-lua/plenary.nvim'
 NeoBundle 'MunifTanjim/nui.nvim'
 NeoBundle 'nvim-tree/nvim-web-devicons'
 NeoBundle 'nvim-neo-tree/neo-tree.nvim', {'rev': 'v3.x'}

" iceberg   : カラースキーム
 NeoBundle 'cocopon/iceberg.vim'


" lightline : ステータスラインの設定
 NeoBundle 'itchyny/lightline.vim'

 " vim go   : for golang deveropment
 NeoBundle 'fatih/vim-go'

" neo-tree設定 ----------------------------------------------------------------------
lua << EOF
local ok, neo_tree = pcall(require, "neo-tree")
if ok then
  neo_tree.setup({
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
      indent = {
        with_expanders = true,
      },
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
      use_libuv_file_watcher = true,
    },
    window = {
      position = "left",
      width = 32,
    },
  })
end
EOF

" Neo-tree: 左サイドバーの表示/非表示
nnoremap <silent> <C-n> :Neotree toggle reveal left<CR>


" lightline設定 ----------------------------------------------------------------------
 let s:iceberg_lightline = expand('~/.vim/bundle/iceberg.vim/autoload/lightline/colorscheme/iceberg.vim')
 let s:lightline_colorscheme = filereadable(s:iceberg_lightline) ? 'iceberg' : 'wombat'
 let g:lightline = {
        \ 'colorscheme': s:lightline_colorscheme,
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ }
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" -----------------------------------------------------------------------------------------



call neobundle#end()
" -----------------------------


" カラーテーマ: iceberg
if has('termguicolors')
    set termguicolors
endif
set background=dark
silent! colorscheme iceberg



" ファイルタイプ別のVimプラグイン/インデント: 有効
filetype plugin indent on

" 未インストールのVimプラグインをチェック: 有効
NeoBundleCheck
