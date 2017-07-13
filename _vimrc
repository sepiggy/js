" 1 Startup {{{
" --- 1.1 判断操作系统类型 --- {{{
let g:isWIN=0
if has('win32')
     let g:isWIN=1
else
     let g:isWIN=0
endif
" }}}

" --- 1.2 判断是否处于 GUI 界面 --- {{{
let g:isGUI=0
if has('gui_running')
    let g:isGUI=1
else
    let g:isGUI=0
endif
" }}}

" --- 1.3 让光标停留在中央，固定视觉的重点/编辑区域 --- {{{
autocmd! CursorMoved * normal zz
" }}}

" --- 1.4 根据文件类型进行设置 --- {{{
filetype plugin indent on " 开启文件类型侦测，并根据侦测到的不同类型加载对应的插件和进行相应的缩进
autocmd! FileType vim setlocal foldmethod=marker " 将 Vim 配置文件的折叠方式设置为 marker
autocmd! FileType text setlocal textwidth=78 " 将文本文件长于 78 个字符的行实现自动换行
" autocmd! FileType java setlocal omnifunc=javacomplete#Complete
autocmd! FileType * set fo-=c fo-=r fo-=o " 关闭 Vim 开启新行自动添加注释
" }}}

" --- 1.5 Vim 中的鼠标设置 --- {{{
set mouse-=a     " 禁用鼠标
set mousehide    " 打字时隐藏鼠标指针
" }}}

" --- 1.6 禁用不必要的键 --- {{{
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" }}}

" --- 1.7 消除报警声 --- {{{
set vb t_vb=
" }}}
" }}}

" 2 General {{{
" --- 2.1 关闭对 Vi 的兼容 --- {{{
set nocompatible
" }}}

" --- 2.2 不创建备份文件 --- {{{
set nobackup
" }}}

" --- 2.3 不创建交换文件 --- {{{
set noswapfile
" }}}

" --- 2.4 保存 1024 个命令和 1024 个查找模式的历史 --- {{{
set history=1024
" }}}

" --- 2.5 根据当前窗口的文件切换目录 --- {{{
set autochdir
" }}}

" --- 2.6 允许指定键跨越行边界 --- {{{
set whichwrap=b,s,<,>,[,]
" }}}

" --- 2.7 在插入模式下在哪里允许 <BS> 删除光标前面的字符 --- {{{
set backspace=indent,eol,start whichwrap+=<,>,[,]
" }}}

" --- 2.8 剪贴板相关 --- {{{
set clipboard+=unnamed " Vim 的默认寄存器和系统剪贴板共享
set pastetoggle=<leader>p " 切换拷贝模式防止自动缩进和补全
" }}}

" --- 2.9 设置 alt 键不映射到菜单栏 --- {{{
set winaltkeys=no
" }}}
" }}}

" 3 Lang & Encoding {{{
" --- 3.1 参与自动检测的字符编码 --- {{{
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
" }}}

" --- 3.2 设置 Vim 内部使用的字符编码 --- {{{
set encoding=utf-8
" }}}

" --- 3.3 设置用于菜单翻译的语言 --- {{{
set langmenu=zh_CN
" }}}

" --- 3.4 设置语言编码 --- {{{
let $LANG='en_us.UTF-8'
" }}}
" }}}

" 4 GUI {{{
" --- 4.1 配色 --- {{{
if g:isWIN
    colorscheme predawn
else
    colorscheme gruvbox
    set background=dark
endif
" }}}

" --- 4.2 菜单 --- {{{
if g:isWIN
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif
" }}}

" --- 4.3 光标、滚动条、菜单和工具条 --- {{{
" 禁止光标闪烁
" set gcr=a:block-blinkon0

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=b

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
" }}}

" --- 4.4 字体 --- {{{
if g:isWIN
    set guifont=Inconsolata:h12:cANSI
else
    set guifont=Monaco:h17
endif
" }}}

" --- 4.5 新窗口设置相关 --- {{{
set splitbelow    " 新的窗口出现在当前窗口的下面
set splitright    " 垂直分割的窗口出现在当前窗口的右边
" }}}

" --- 4.6 高亮相关 --- {{{
set cursorline                     " 高亮显示当前行
set hlsearch                       " 高亮显示所有匹配
" }}}

" --- 4.7 行号 --- {{{
set number " 显示行号
" }}}
" }}}

" 5 Format {{{
" --- 5.1 代码缩进 --- {{{
set expandtab        " 将制表符扩展为空格
set tabstop=4        " 设置编辑时制表符占用空格数
set shiftwidth=4     " 设置格式化时制表符占用空格数
set softtabstop=4    " 让 Vim 把连续数量的空格视为一个制表符
set autoindent       " 开启新行时，从当前行复制缩进距离
set smartindent      " 开启新行时，使用智能自动缩进
" }}}

" --- 5.2 代码折叠 --- {{{
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax

" 启动 vim 时关闭折叠代码
set nofoldenable
" }}}

" --- 5.3 语法高亮 --- {{{
syntax enable " 开启语法高亮功能
syntax on     " 允许用指定语法高亮配色方案替换默认方案
" }}}
" }}}

" 6 Keymap {{{
" --- 6.1 leader 键设置 --- {{{
let mapleader=","       " 设置 leader 键
let maplocalleader="\\" " 设置 localleader 键
" }}}

" --- 6.2 vimrc 相关 --- {{{
nnoremap <leader>v :tabnew $MYVIMRC<cr> " 在一个新的标签页中编辑我的 vimrc 文件
nnoremap <leader>s :source $MYVIMRC<cr> " 重读我的 vimrc 文件
" }}}

" --- 6.3 标签页相关 --- {{{
nnoremap <silent> <tab>n :tabnew<cr> " 新建标签页
nnoremap <tab>f :tabfind<space> " 查找并在新标签页中打开文件
nnoremap <silent> <tab>s :tabs<cr> " 显示已打开标签页的列表
nnoremap <silent> <tab>w :tabclose<cr> " 关闭当前标签页
nnoremap <silent> <tab>o :tabonly<cr> " 仅保留当前标签页
nnoremap <silent> <tab>h :tabp<cr> " 跳转到上一个标签页
nnoremap <silent> <c-s-tab> :tabp<cr> " 跳转到上一个标签页
inoremap <silent> <c-s-tab> <esc>:tabp<cr>
nnoremap <silent> <tab>l :tabn<cr> " 跳转到下一个标签页 
nnoremap <silent> <c-tab> :tabn<cr> " 跳转到下一个标签页 
inoremap <silent> <c-tab> <esc>:tabn<cr>
nnoremap <silent> <tab>a :tabfirst<cr> " 跳转到第一个标签页
nnoremap <silent> <tab>z :tablast<cr> " 跳转到最后一个标签页

" 跳转到指定的标签页
nnoremap <silent> <tab>1 :tabn 1<cr>
nnoremap <silent> <tab>2 :tabn 2<cr>
nnoremap <silent> <tab>3 :tabn 3<cr>
nnoremap <silent> <tab>4 :tabn 4<cr>
nnoremap <silent> <tab>5 :tabn 5<cr>
nnoremap <silent> <tab>6 :tabn 6<cr>
nnoremap <silent> <tab>7 :tabn 7<cr>
nnoremap <silent> <tab>8 :tabn 8<cr>
nnoremap <silent> <tab>9 :tabn 9<cr>
nnoremap <silent> <tab>0 :tabn 10<cr>
" }}}

" --- 6.4 分割窗口相关 --- {{{
" ----- 跳转分割窗口 ----- {{{
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-w> <c-w>c
" }}}

" ----- 使用 Alt + H/J/K/L 调整分割窗口的大小 ----- {{{
nnoremap <m-j> :resize +5<cr>
nnoremap <m-k> :resize -5<cr>
nnoremap <m-h> :vertical resize -5<cr>
nnoremap <m-l> :vertical resize +5<cr>
inoremap <m-j> <esc>:resize +5<cr>i
inoremap <m-k> <esc>:resize -5<cr>i
inoremap <m-h> <esc>:vertical resize -5<cr>i
inoremap <m-l> <esc>:vertical resize +5<cr>i
" }}}
" }}}

" --- 6.5 正常模式下的 keymap --- {{{
" 按分号键直接进入命令模式
nnoremap ; :

" 定义快捷键到行首和行尾
nnoremap gh 0
nnoremap gl $

" 设置快捷键将系统剪贴板内容粘贴至 Vim
nnoremap <leader>p "+p

" 定义快捷键关闭当前分割窗口
nnoremap <leader>q :q<cr>

" 定义快捷键保存当前窗口内容
nnoremap <leader>w :w<cr>

" 定义快捷键保存所有窗口内容并退出 vim
nnoremap <leader>WQ :wa<cr>:q<cr>

" 不做任何保存，直接退出 vim
nnoremap <leader>Q :qa!<cr>

" 连接两行
nnoremap b J

" 将当前光标所在的单词用双引号括起来
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" 将当前光标所在的单词用单引号括起来
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" 将当前光标所在的单词用圆括号括起来
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel

" 从当前位置复制到行尾
nnoremap Y y$

" 高亮显示关键字后再按 Enter 键取消高亮
nnoremap <silent> <cr> :noh<cr>

" 使用空格键 Toggle 折叠
nnoremap <space> za
" }}}

" --- 6.6 插入模式下的 keymap (若没有明确配置则是 Vim 的内置功能) --- {{{
" <jk> 进入到正常模式
inoremap jk <esc>

" <c-w> 删除到词首; <c-e> 到行尾; <c-t> 缩进
inoremap <c-e> <end>

" <c-a> 跳转到行首; <c-d> 反缩进; <c-f> 模拟 <right>
inoremap <c-a> <home>
inoremap <c-f> <right>
" inoremap <m-f> <s-right>

" <c-x> 进入到 <c-x> 子模式; <c-v> 切换到行 visual 模式; <c-b> 模拟 <left>
inoremap <c-v> <esc>V
inoremap <c-b> <left>
" inoremap <m-b> <s-left>

" <c-y> 复制上一行相同位置的字符到本行; <c-u> 删除字符到行首(但保留行首的缩进);
" <c-o> 进入到正常-插入模式; <c-p> 模拟 <up>
inoremap <c-p> <up>

" <c-h> 删除光标前的字符; <c-k> 删除字符到行尾
inoremap <c-k> <esc>ld$a

" <c-n> 模拟 <down>; <c-m> 回车
inoremap <c-n> <down>
" }}}

" --- 6.7 命令模式下的 keymap --- {{{
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-p> <up>
cnoremap <c-n> <down>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <m-f> <s-right>
cnoremap <m-b> <s-left>
cnoremap jk <c-c>
" }}} 

" --- 6.8 可视模式下的 keymap --- {{{
" 可视模式转为普通模式
vnoremap ; :

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <leader>y "+y
" }}}

" --- 6.9 Quickly Run --- {{{
map <leader>x :call CompileRunGcc()<cr>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'python'
        exec "!time python2.7 %"
    elseif &filetype == 'java'
        exec '!javac %'
        exec '!java %<'
    endif
endfunc
" }}}
" }}}

" 7 Plugin {{{
call plug#begin('~/.vim/plugged')

" --- 7.1 配色主题相关 --- {{{
Plug 'flazz/vim-colorschemes'

Plug 'vim-airline/vim-airline'
set laststatus=2

Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/goyo.vim'
autocmd! BufNewFile,BufRead * :Limelight 0.8 " 启动 vim 就进入 goyo 模式
nmap <leader>g :Goyo<cr>
xmap <leader>g :Goyo<cr>

Plug 'junegunn/limelight.vim'
nnoremap <leader>l :Limelight!! 0.8<cr> " 进入 goyo 模式后自动触发 limelight, 退出后则关闭
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight

Plug 'Yggdroot/indentLine'
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }
" }}}

" --- 2 文件浏览搜索相关 --- {{{
Plug 'scrooloose/nerdtree'
let g:NERDTreeWinPos='right' " 设置显示位置
let NERDTreeShowLineNumbers=1 " 显示行号
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1 " 显示隐藏文件
let NERDTreeWinSize=31 " 设置宽度
let g:nerdtree_tabs_open_on_console_startup=1 " 在终端启动vim时，共享NERDTree
let NERDTreeIgnore=['.idea', '.vscode', 'node_modules', '*.pyc'] " 忽略以下文件的显示
let NERDTreeShowBookmarks=1 " 显示书签列表

" if exists('g:NERDTreeWinPos') " 设置 nerdtree 初始目录
"     if g:isWIN
"         autocmd vimenter * NERDTree D:\Code
"     elseif 
"         autocmd vimenter * NERDTree ~/Code
"     endif
" endif

Plug 'jistr/vim-nerdtree-tabs'
map <leader>t <plug>NERDTreeTabsToggle<cr>

Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

Plug 'bsdelf/bufferhint'
nnoremap - :call bufferhint#Popup()<cr>
nnoremap \ :call bufferhint#LoadPrevious()<cr>

Plug 'ctrlpvim/ctrlp.vim'
"<leader>p搜索文件
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
"<leader>f搜索MRU
map <leader>f :CtrlPMRU<CR>
"设置搜索时忽略的文件
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
"修改QuickFix窗口显示的最大条目数
let g:ctrlp_max_height=10
let g:ctrlp_match_window_reversed=0
"设置MRU最大条目数为500
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/unite-help'
" }}}

" --- 3. 极速跳转、定位相关 --- {{{
Plug 'easymotion/vim-easymotion'
map <leader> <Plug>(easymotion-prefix)
let g:EasyMotion_leader_key='<leader>'
let g:EasyMotion_smartcase=1
let g:EasyMotion_use_smartsign_us=1
let g:EasyMotion_use_upper=1
let g:EasyMotion_keys='ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
let g:EasyMotion_verbose=0
nmap w <Plug>(easymotion-bd-w)
nmap W <Plug>(easymotion-bd-W)
nmap e <Plug>(easymotion-bd-e)
nmap E <Plug>(easymotion-bd-E)
nmap f <Plug>(easymotion-overwin-f)
nmap t <plug>(easymotion-bd-t)
nmap J <Plug>(easymotion-j)
nmap K <Plug>(easymotion-k)
nmap H <Plug>(easymotion-Fl)
nmap L <Plug>(easymotion-fl)
nmap n <Plug>(easymotion-n)
nmap N <Plug>(easymotion-N)
nmap <leader>o :NERDTree 

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

Plug 'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<cr>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<cr>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<cr>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<cr>
" }}}

" --- 4. 代码编写 --- {{{
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsFlyMode=1
let g:AutoPairsShortcutFastWrap='<m-w>'

Plug 'terryma/vim-multiple-cursors'

Plug 'terryma/vim-expand-region'
map vj <plug>(expand_region_expand)
map vk <plug>(expand_region_shrink)

Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1 " 注释分隔符后面增加一个空格
let g:NERDCompactSexyComs=1

Plug 'tpope/vim-surround'

Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

Plug 'rizzatti/dash.vim'

Plug 'sjl/gundo.vim'
nnoremap <leader>u :GundoToggle<cr>
" }}}

" ------ 5 自动补全 ------ {{{
Plug 'ervandew/supertab'

Plug 'davidhalter/jedi-vim'

Plug 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_hotkey='<c-m>'
let vim_markdown_preview_browser='Google Chrome'

"Plug 'artur-shaik/vim-javacomplete2'
"nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

"Plug 'cespare/vjde'
"set cfu=VjdeCompletionFun
" }}}

"  ----- 10. vim-fugitive ----- {{{
Plug 'tpope/vim-fugitive'
" }}}

" ----- 11. vim-repeat ----- {{{
Plug 'tpope/vim-repeat'
" }}}

"  ----- 12. fzf ----- {{{
Plug 'junegunn/fzf'
" }}}

" ----- 13. rking/ag.vim ----- {{{
Plug 'rking/ag.vim'
" }}}

" ----- vim-scripts/YankRing.vim ----- {{{
Plug 'vim-scripts/YankRing.vim'
nnoremap <silent> <F11> :YRShow<CR>
" }}}

" ----- tpope/vim-unimpaired ----- {{{
Plug 'tpope/vim-unimpaired'
" }}}

call plug#end()
" }}}


