
" Maintainer:   jackness Lau
" Last Change:  2018.10.23

" 自动补全工具选择
let AUTO_COMPLETE = 'neocomplete'
" let AUTO_COMPLETE = 'ycm'

" 代码检查工具选择
let SYNTAX_CHECKER = 'eslint'
" let SYNTAX_CHECKER = 'jshint'

" tab 4|2 设置
let TAB_WIDTH = 4
" let TAB_WIDTH = 2



let SYSTEM = 'others'
if has('win32') || has('win64')
  let SYSTEM = 'windows'
endif


if SYSTEM == 'windows'
    let vimFilePath = $VIM. '/vimfiles'
else 
    let vimFilePath = $HOME. '/.vim/vimfiles'
endif


" windows 预处理函数
function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            if empty(&shellxquote)
                let l:shxq_sav = ''
                set shellxquote&
            endif
            let cmd = '"' . $VIMRUNTIME . '\diff"'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    if exists('l:shxq_sav')
        let &shellxquote=l:shxq_sav
    endif
endfunction


" ======================================================
" 预处理
" ======================================================
if SYSTEM == 'windows'
    set nocompatible
    " source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim

    behave mswin
    set diffexpr=MyDiff()

endif



" ======================================================
" 插件设置
" ======================================================
" --------------------
" # Vundle
" --------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
" base -------------------------
Plugin 'gmarik/Vundle.vim'

"theme ------------------------
Plugin 'sickill/vim-monokai'
Plugin 'vim-scripts/BusyBee'
Plugin 'Blevs/vim-dzo'
Plugin 'jacoborus/tender.vim'
Plugin 'muellan/am-colors'

" status bar -------------------
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'

" 目录树 -----------------------
Plugin 'scrooloose/nerdtree'
Plugin 'taiansu/nerdtree-ag'
" Plugin 'ryanoasis/nerd-fonts'

" Plugin 'Xuyuanp/nerdtree-git-plugin'

" vim 开始界面 -----------------
Plugin 'mhinz/vim-startify'

" ctrl + d 选择多个 ------------
Plugin 'terryma/vim-multiple-cursors'

" 引号括号自动补全 -------------
Plugin 'jiangmiao/auto-pairs'

" 自动缩进 -------------
" Plugin 'vim-scripts/genindent.vim'

" ctags.vim [需额外装插件]------
" Plugin 'vim-scripts/ctags.vim'


" 搜索插件 gui  ----------------
Plugin 'dyng/ctrlsf.vim'
Plugin 'mhinz/vim-grepper'


" 搜索插件 ack [需额外装插件]---
" Plugin 'mileszs/ack.vim'

" 搜索插件 ag [需额外装插件] ---
Plugin 'rking/ag.vim'

" 搜索插件 ---------------------
Plugin 'vim-scripts/EasyGrep'


" 对齐线 -----------------------
Plugin 'Yggdroot/indentLine'

" 代码注释 -----------------
"Plugin 'scrooloose/nerdcommenter'

" 代码注释 ---------------------
Plugin 'tpope/vim-commentary'

" js美化 -----------------------
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'



" Plugin 'vim-scripts/jQuery'

" js 支持插件 --------------------
Plugin 'pangloss/vim-javascript'

" 书签插件 ---------------------
" Plugin 'vim-scripts/Visual-Mark'
" Plugin 'MattesGroeger/vim-bookmarks'
" Plugin 'dterei/VimBookmarking'
Plugin 'kshenoy/vim-signature'


" session 插件 -----------------
" Plugin 'xolox/vim-session'
" Plugin 'xolox/vim-misc'
" Plugin 'vim-scripts/sessionman.vim'

" 最近打开文件查看 -----------------
Plugin 'yegappan/mru'


" Recover.vim ------------------
"Plugin 'chrisbra/Recover.vim'

" vim-surround -----------------
"Plugin 'tpope/vim-surround'

" 语法检测 ---------------------
if SYNTAX_CHECKER == 'jshint'
    Plugin 'Shutnik/jshint2.vim'
endif

if SYNTAX_CHECKER == 'eslint'
    Plugin 'scrooloose/syntastic'
endif

" vim-javascript ---------------
" Plugin 'pangloss/vim-javascript'

" copy plugin ------------------
Plugin 'vim-scripts/YankRing.vim'


" 自动补全插件 -----------------
" Plugin 'ervandew/supertab'
"
Plugin 'mattn/emmet-vim'

if AUTO_COMPLETE == 'ycm'
    " 自动补全插件 [需要安装]-------
    if has("win64")
        Plugin 'snakeleon/YouCompleteMe-x64'
    elseif has("win32")
        Plugin 'snakeleon/YouCompleteMe-x86'
    else
        Plugin 'Valloric/YouCompleteMe'
    endif

    " ycm js支持 [需要安装]-------
    Plugin 'honza/vim-snippets'

else
    " 自动补全插件 [需要lua]--------
    Plugin 'Shougo/neocomplete.vim'
    Plugin 'Shougo/neosnippet.vim'
    Plugin 'Shougo/neosnippet-snippets'
endif

" 代码片段 [需要python] --------
Plugin 'SirVer/ultisnips'

if SYSTEM != 'windows'
    Plugin 'marijnh/tern_for_vim'
endif

" 代码片段 snippets 文件包 -----

" ctrlp ------------------------
Plugin 'kien/ctrlp.vim'

" syntax -----------------------
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'skammer/vim-css-color'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/html5.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'posva/vim-vue'
Plugin 'isRuslan/vim-es6'

" Plugin 'plasticboy/vim-markdown'

" editorconfig -----------------
Plugin 'editorconfig/editorconfig-vim'

call vundle#end()
filetype plugin indent on


" ======================================================
" # 系统设置
" ======================================================

" 插入模式下用绝对行号, 普通模式下用相对
" autocmd InsertEnter * :set norelativenumber number
" autocmd InsertLeave * :set relativenumber

" 禁止自动换行
set tw=0

set lazyredraw
set ttyfast

" 禁止警告音
if SYSTEM != 'windows'
set nobe
set vb
endif

" 优化标签页
set guitablabel=%t
" 自动设置当前编辑的文件为工作路径
set autochdir
set showcmd

set nocompatible
" The default for 'backspace' is very confusing to new users, so change it to a
" more sensible value.  Add "set backspace&" to your ~/.vimrc to reset it.
set backspace+=indent,eol,start

" Disable localized menus for now since only some items are translated (e.g.
" the entire MacVim menu is set up in a nib file which currently only is
" translated to English).
set langmenu=none


" # 设置编码格式
if has("multi_byte")
    " A,set encoding
    set encoding=utf-8
    set nobomb
    set fileencodings=ucs-bom,utf-8,cp936,chinese,cp932,gb2312,gbk,gb18030
    set tenc=utf-8
    set maxcombine=4
    set termencoding=utf-8
    " open asia support
    set fo+=mBM
    if v:lang=~? '^\(zh\)\|\(ja\)|\(ko\)\|\(jp\)'
        set ambiwidth=double
    endif

    if SYSTEM == 'windows'
        set fenc=chinese
        if version>=603
            set helplang=cn
        endif
    else
        set fenc=utf-8
    endif

    let &termencoding=&encoding

    " B,vim tips support
    language messages zh_CN.utf-8
    "关闭自动检测
    let g:fencview_autodetect=0
endif
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim



" 显示tab和空格
set list
set endofline
" 设置tab和空格样式
set list listchars=tab:>-
set lcs=tab:\|\ ,nbsp:%,trail:-
" 设定行首tab为灰色
"highlight LeaderTab guifg=#666666
" 匹配行首tab
"match LeaderTab /^\t/


" 不生成 ~ 文件
set noswapfile
set nobackup
set noundofile


" 配色方案
syntax enable
" colorscheme am-colors
colorscheme tender
" colorscheme monokai
" colorscheme BusyBee
" colorscheme jellybeans


" 配置折叠
"set foldmethod=manual
" set foldmethod=indent
" set foldmethod=syntax
set foldmethod=marker
set foldmarker=/{,/}
" 启动 vim 时关闭折叠代码
set nofoldenable

" 字体
if SYSTEM == 'windows'
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14
else
    set guifont=Meslo\ LG\ L\ for\ Powerline:h14
endif

 "高亮光标所在行
set cul
set cuc

" 禁止光标闪烁
"set gcr=a:block-blinkon0
" 显示行号
set number

" 自动缩进
" set autoindent
" set smartindent
set noai
set autoindent

" Tab键的宽度
let &tabstop=TAB_WIDTH
let &softtabstop=TAB_WIDTH
let &shiftwidth=TAB_WIDTH


" 不要用空格代替制表符
set expandtab

" 在行和段开始处使用制表符
set smarttab

" 历史记录数
set history=1000

"搜索逐字符高亮
set hlsearch
set incsearch

" 搜索时大小写不敏感
set ignorecase

"自动保存
set autowrite

"共享剪贴板  
"set clipboard+=unnamed 

" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
"set confirm

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
" 这样设置才能确保 mutiselect 插件能用
set selection=inclusive
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=20
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=1
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

"======================================================
" 快捷键设置
"======================================================

" 定义快捷键的前缀，即<Leader>
let mapleader=";"
"set notimeout
"set ttimeout


" "# 代码缩进 -----------------------
vmap <Tab> >gv
vmap <S-Tab> <gv
nmap <Tab> >>
nmap <S-Tab> <<

"# tab 操作 -----------------------
map <A-Tab> <Esc> :tabn<CR>
if SYSTEM == "windows" 
    nmap <C-t> :tabnew<CR>
else
    nmap <D-t> :tabnew<CR>
endif
"map <D-f> <Esc> :/

"# tab 操作 -----------------------

" 普通模式换行---------------------
nmap <CR> i<CR><Esc>
nmap <BS> i<BS><Esc>

" 插入模式 黏贴 yank 内容
if SYSTEM == 'windows' 
    imap <C-p> <C-r>0
else
    imap <D-p> <C-r>0
endif
" 定义快捷键到行首和行尾
map <Leader>b ^
map <Leader>e $
vmap <Leader>e $h

" tab 2 tab 4 模式切换
map t2 :set tabstop=2<CR>:set softtabstop=2<CR>:set shiftwidth=2<CR>:e<CR>
map t4 :set tabstop=4<CR>:set softtabstop=4<CR>:set shiftwidth=4<CR>:e<CR>

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
"" 设置快捷键将选中文本块剪切至系统剪贴板
vnoremap <Leader>d "+d
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nnoremap <Leader>Q :qa!<CR>
" 依次遍历tab
nnoremap tn :tabn<CR>
" 依次遍历tab
nnoremap tp :tabp<CR>
" 依次遍历 buffer
nnoremap bn :bnext<CR>
" 依次遍历 buffer
nnoremap bp :bprev<CR>

" 依次遍历子窗口
nnoremap wn <C-W><C-W>
" 前一个子窗口
nnoremap wp <C-W>p
" 跳转至右方的窗口
nnoremap wl <C-W>l
" 跳转至左方的窗口
nnoremap wh <C-W>h
" 跳转至上方的子窗口
nnoremap wk <C-W>k
" 跳转至下方的子窗口
nnoremap wj <C-W>j
" 上下分割当前文件
nmap ws <C-w>s
nmap w2 <C-w>s
" 左右分割当前文件
nmap wv <C-w>v

map <Leader>rn :set relativenumber<CR>
map <Leader>nn :set norelativenumber<CR>

" tab 转换成 4个空格
map <Leader>ts :set expandtab<CR>:%ret! 4<CR>

" 定义快捷键在结对符之间跳转，助记pair
" nmap <Leader>pa %

" 删除到行未
nmap <Leader>de d$
" 删除到行头
nmap <Leader>db d0

" 删除 ^m
nmap cm :%s/\r//g<CR>

" 括号匹配
map <Leader>a %

" toggle syntax
map <Leader>s :exec exists('syntax_on') ? 'syn off': 'syn on'<CR>


" 打开文件
if SYSTEM == 'windows'
    nmap <Leader>o :! explorer /select,  %:p<CR><CR>
else
    nmap <Leader>o :! open %:p:h<CR><CR>
endif

" 注释
map zz v<Leader>b<Leader>e%zf

" 选中区域加双引号
" function arround(dot)
"     let a:iTxt = getreg('0')
"     let a:r = a:dot . a:iTxt . a:dot
"     pu = a:r
" endfunction
" vmap " d:call arround('"')<CR>

vmap " di"<Esc>p
vmap ' di'<Esc>p
vmap ( di(<Esc>p
vmap [ di[<Esc>p
vmap { di{<Esc>p

" 搜索选中的内容
vmap / y/<c-r>0<CR>

" 马上让vim配置文件生效
if SYSTEM == 'windows'
    map <Leader>rv :source $VIM/_vimrc<CR><CR>
else
    map <Leader>rv :source $VIM/vimrc<CR><CR>
endif


" ======================================================
" # 插件设置
" ======================================================

" ----------------------------------------
" # airline 
" ----------------------------------------
set laststatus=2
if SYSTEM == 'windows'
    let g:airline_powerline_fonts = 0
else
    let g:airline_powerline_fonts = 1
endif

let g:airline_theme = 'badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" ----------------------------------------
" # startify 
" ----------------------------------------
" 设置书签
if SYSTEM == 'windows'
    let g:startify_bookmarks = [
        \ '$VIM/_vimrc',
        \ 'C:\Windows\System32\drivers\etc\hosts',
        \ 'F:\svn\code.yy.com\ent-FEteam\yy.com',
        \ 'F:\github\vimrc\vimrc',
        \ 'F:\github\yyl',
        \ 'F:\svn\svn.yy.com\yy-music\static\project\group_web_h5_player\branches\develop\yycom_es6_live_player\pc\src\es6',
        \ 'F:\svn\svn.yy.com\yy-music\web-dragon\big-idol\yyzone\branches\develop\yyzone-web\src\main\webapp\WEB-INF\views\user',
        \]

else 
    let g:startify_bookmarks = [
        \ eval(string($VIM)) . '/vimrc',
        \ '~/.jshintrc',
        \ '~/.eslintrc.js',
        \ '/etc/hosts',
        \ '~/work/yy',
        \ '~/work/git',
        \]
endif

nmap<Leader>1 :tabnew<CR>:Startify<CR>

" 起始页显示的列表长度
let g:startify_files_number = 5
let g:startify_custom_header = [
   \'# 传说中最牛逼的编辑器在此 ~(≥▽≤)/~ ',
   \'-----------------------------------------',
   \]
if SYSTEM == 'windows'
    let g:startify_custom_footer = [
       \'-----------------------------------------',
       \'# good good study, day day up ╭（′▽｀）╯ ',
       \'# 删除行尾的^M - cm',
       \'# tab 转 space - <leader>ts',
       \'# 宏录制: q1, 宏开始: @1',
       \]
else 
    let g:startify_custom_footer = [
       \'-----------------------------------------',
       \'# good good study, day day up ╭（′▽｀）╯ ',
       \'# mac 截屏 command + shift + 3',
       \'# 删除行尾的^M - cm',
       \'# tab 转 space - <leader>ts',
       \'# 宏录制: q1, 宏开始: @1',
       \'# 更新 vim 前先打开一下 xcode, 然后命令行输入:'',
       \'# brew install vim --with-lua --with-python3 --with-override-system-vim'',
       \]
endif


" ----------------------------------------
" # vim-multiple-cursors
" ----------------------------------------
" Default mapping 
"let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_prev_key='<C-p>' 
let g:multi_cursor_skip_key='<C-x>' 
let g:multi_cursor_next_key='<C-d>' 

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" ----------------------------------------
" #  YankRing
" ----------------------------------------
map yr :YRShow<CR>
map <Leader>` :YRShow<CR>

" ----------------------------------------
" # vim-commentary 
" ----------------------------------------
" 设置Python注释字符
autocmd FileType python,shell set commentstring=#\ %s
autocmd FileType dosbatch set commentstring=@rem%s
autocmd FileType mako set cms=##\ %s

if SYSTEM == "windows" 
    vmap <C-/> gc
    nmap <C-/> gcc
else
    vmap <D-/> gc
    nmap <D-/> gcc

endif

" ----------------------------------------
" # ctags 
" ----------------------------------------
" " 按照名称排序  
" let Tlist_Sort_Type = "name"   
" " 在右侧显示窗口  
" "let Tlist_Use_Right_Window = 1  
" " 压缩方式 
" let Tlist_Compart_Format = 1 
" " 如果只有一个buffer，kill窗口也kill掉buffer
" let Tlist_Exist_OnlyWindow = 1    
" " 不要关闭其他文件的tags  
" let Tlist_File_Fold_Auto_Close = 0 
" " 不要显示折叠树  
" let Tlist_Enable_Fold_Column = 0 
" "不同时显示多个文件的tag，只显示当前文件的
" let Tlist_Show_One_File=1      

" ----------------------------------------
" # NERDTree 
" ----------------------------------------
let g:NERDTree_title='[NERD Tree]'
function! NERDTree_Start()
    exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction
" set ignore filetype
" let NERDTreeIgnore=['Thumbs.db','\~$','.DS_Store','\.svn$','\.git','\.pyc$','\.mp3','\.jpg','\.gif','\.swf','\.rar','\.zip','\.pdf','\.gz','\.bz2','\.dmg','\.doc','\.tar','\.png','\.rtf']
let NERDTreeIgnore=['Thumbs.db','\~$','.DS_Store','\.svn$','\.git$','\.pyc$']
let NERDTreeShowHidden=1

"map <F3> :NERDTreeMirror<CR>
"map <F3> :NERDTreeToggle<CR>
" map <Leader>2 :NERDTreeMirror<CR>
" map <Leader>2 :NERDTreeToggle<CR>
nn <Leader>2 :NERDTree %:p:h<CR>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


" ----------------------------------------
" # tagbar
" ----------------------------------------
let g:tagbar_width=30

" ----------------------------------------
" # indentLine
" ----------------------------------------
let g:indentLine_leadingSpaceChar = '┆'


" ----------------------------------------
" # ctrlSF 
" ----------------------------------------
let g:ctrlsf_ackprg = 'ag'
" let g:ctrlsf_ackprg = 'ack'
let g:ctrlsf_context = '-B 5 -A 3'

nmap<S-F> :CtrlSF 
vmap<S-F> y:CtrlSF <c-r>0


" ----------------------------------------
" # ag
" ----------------------------------------
let g:ag_highlight=1

" ----------------------------------------
" # neocomplete
" ----------------------------------------
if AUTO_COMPLETE == 'neocomplete'
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_auto_select = 0
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 2
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    imap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    imap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif
" ----------------------------------------
" # youcompleteme
" ----------------------------------------
if AUTO_COMPLETE == 'ycm'

    if has("win64")
        let g:ycm_global_ycm_extra_conf = $VIM.'/vimfiles/bundle/YouCompleteMe-x64/python/.ycm_extra_conf.py'
    elseif has("win32")
        let g:ycm_global_ycm_extra_conf = $VIM.'/vimfiles/bundle/YouCompleteMe-x86/python/.ycm_extra_conf.py'
    else
        let g:ycm_global_ycm_extra_conf = $HOME.'/.vim/bundle/YouCompleteMe/python/.ycm_extra_conf.py'
    endif


    " 菜单
    highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
    " 选中项
    highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
    set completeopt=longest,menu
    "离开插入模式后自动关闭预览窗口
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    "回车即选中当前项
    inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
    "上下左右键的行为 会显示其他信息
    inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
    inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
    inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
    inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
    "youcompleteme  默认tab  s-tab 和自动补全冲突
    let g:ycm_key_list_select_completion=['<tab>', '<c-n>']
    let g:ycm_key_list_previous_completion=['<c-p>']
    let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
    " 开启 YCM 基于标签引擎
    let g:ycm_collect_identifiers_from_tags_files=1	
    " 从第2个键入字符就开始罗列匹配项
    let g:ycm_min_num_of_chars_for_completion=2	
    " 禁止缓存匹配项,每次都重新生成匹配项
    let g:ycm_cache_omnifunc=0	
    " 语法关键字补全
    let g:ycm_seed_identifiers_with_syntax=1	
    "nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	
    "nnoremap <leader>lo :lopen<CR>	"open locationlist
    "nnoremap <leader>lc :lclose<CR>	"close locationlist
    "在注释输入中也能补全
    let g:ycm_complete_in_comments = 1
    "在字符串输入中也能补全
    let g:ycm_complete_in_strings = 1
    "注释和字符串中的文字也会被收入补全
    let g:ycm_collect_identifiers_from_comments_and_strings = 0

    nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
endif

" ----------------------------------------
" # UltiSnips
" ----------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetDirectories=['UltiSnips']
if SYSTEM == 'windows'
    let g:UltiSnipsExpandTrigger="<c-k>"
    let g:UltiSnipsJumpForwardTrigger="<c-n>"
    let g:UltiSnipsJumpBackwardTrigger="<c-p>"
else 
    let g:UltiSnipsExpandTrigger="<D-k>"
    let g:UltiSnipsJumpForwardTrigger="<D-n>"
    let g:UltiSnipsJumpBackwardTrigger="<D-p>"
endif
let g:UltiSnipsSnippetsDir = vimFilePath . "/Ultisnips"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
map <Leader>ue :UltiSnipsEdit<CR>
" autocmd FileType html,smarty imap <Tab> <c-k>
 
" imap <Tab> <c-k>
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags"

" ----------------------------------------
" # 格式预处理
" ----------------------------------------
" autocmd FileType vue set ft=html

" ----------------------------------------
" # js beautify
" ----------------------------------------
map <c-j> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-j> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-j> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-j> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-j> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-j> :call CSSBeautify()<cr>

autocmd FileType javascript vnoremap <buffer>  <c-j> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-j> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-j> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-j> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-j> :call RangeCSSBeautify()<cr>

" ----------------------------------------
" # nerdcommenter
" ----------------------------------------
let g:NERDCustomDelimiters = {
    \ 'html': {  'left': '<!-- ', 'right': '-->', 'leftAlt': '/*','rightAlt': '*/' },
    \ 'xhtml': {  'left': '<!-- ', 'right': '-->', 'leftAlt': '/*','rightAlt': '*/'},
    \'vimperator': { 'left': '"' },
\}
let NERD_html_alt_style=1



" ----------------------------------------
" # session-vim
" ----------------------------------------
" 自动保存session
let g:session_autosave='yes'
" 每隔 5 分钟 保存一次 session
let g:session_autosave_periodic=0
" 打开vim自动载入上次 session 
let g:session_default_to_last='yes'
let g:session_autoload='yes'

map <Leader>ss :SaveSession! default<cr>
map <Leader>rs :OpenSession! default<cr>


" ----------------------------------------
" # vim-bookmarks
" ----------------------------------------
" map mn :BookmarkNext<CR>
" let g:bookmark_save_per_working_dir = 0
" let g:bookmark_auto_save = 1
" let g:bookmark_auto_save_file = vimFilePath . '/vim-bookmarks/.vim-bookmarks'
" let g:bookmark_highlight_lines = 1

" ----------------------------------------
" # VimBookmarking
" ----------------------------------------
" map mm :ToggleBookmark<CR>
" map mn :NextBookmark<CR>
" map mp :PreviousBookmark<CR>

" ----------------------------------------
" # vim-signature
" ----------------------------------------
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'ToggleMarkAtLine'   :  "mm",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'PurgeMarks'         :  "mx",
        \ 'GotoNextMarker'     :  "mN",
        \ 'GotoPrevMarker'     :  "mP",
        \ 'PurgeMarkers'       :  "mX",
        \ }
" ----------------------------------------
" # indentLine
" ----------------------------------------
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" ----------------------------------------
" # tagbar
" ----------------------------------------
"nmap<Leader>3 :TagbarToggle<CR>

" ----------------------------------------
" # MRU
" ----------------------------------------
nmap<Leader>4 :MRU<CR>



" ----------------------------------------
" # jshint2
" ----------------------------------------
if SYNTAX_CHECKER == 'jshint'
    if SYSTEM == 'windows'
        let jshint2_command = $VIM . '/node_modules/.bin/jshint'
    endif
    " let jshint2_command = '~/AppData/Roaming/npm/jshint'
    " Lint JavaScript files after reading it:
    let jshint2_read = 0
    " Lint JavaScript files after saving it:
    let jshint2_save = 1
    " Skip lint confirmation for non JavaScript files:
    let jshint2_confirm = 0
    " Set min and max height of error list:
    let jshint2_min_height = 3
    let jshint2_max_height = 12
endif

" ----------------------------------------
" # syntastic eslint
" ----------------------------------------
" 需全局安装 eslint
" npm i -g eslint eslint-config-airbnb-base eslint-plugin-import babel-eslint eslint-plugin-html
if SYNTAX_CHECKER == 'eslint'
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0

    let g:syntastic_javascript_checkers = ['eslint']
    let g:syntastic_vue_checkers = ['eslint']
    " let g:syntastic_debug=3
endif

" ----------------------------------------
" # vim-markdown
" ----------------------------------------
let g:vim_markdown_frontmatter=1

" ----------------------------------------
" # editorconfig
" ----------------------------------------
let g:EditorConfig_exclude_patterns = ['fugitive://.*']


" source F:\github\vim-plugin-helloworld\helloworld.vim



