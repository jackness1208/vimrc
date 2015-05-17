
" Maintainer:   jackness Lau
" Last Change:  2015.5.16
"======================================================
" function 定义
" ======================================================
function MySys()
    return 'osx'
    let os=substitute(system('uname'), '\n', '', '')
    if os == 'Mac'
        return os
    elseif os == 'Darwin'
        return 'windows'
    elseif os == 'Linux'
        return os
    endif
    return true;
endfunction

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

"threme -----------------------
Plugin 'sickill/vim-monokai'

" status bar -------------------
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'

" NERDtree ---------------------
Plugin 'scrooloose/nerdtree'

" vim-startify -----------------
Plugin 'mhinz/vim-startify'

" vim-multiple-cursors ---------
Plugin 'terryma/vim-multiple-cursors'

" ervandew/supertab ------------
Plugin 'ervandew/supertab'

" ervandew/supertab ------------
"Plugin 'ervandew/supertab'

" mattn/emmet-vim --------------
Plugin 'mattn/emmet-vim'

" auto-pairs -------------------
Plugin 'jiangmiao/auto-pairs'

" ctags.vim [需额外装插件]------
Plugin 'vim-scripts/ctags.vim'

" ctrlsf.vim -------------------
Plugin 'dyng/ctrlsf.vim'

" ack [需额外装插件]------------
Plugin 'mileszs/ack.vim'

" vim-indent-guides ------------
Plugin 'nathanaelkane/vim-indent-guides'

 "nerdcommenter ----------------
Plugin 'scrooloose/nerdcommenter'



" vim-scripts/Tagbar -----------
Plugin 'majutsushi/tagbar'

" jsbeautify -------------------
Plugin 'maksimr/vim-jsbeautify'

" vim-css-color ----------------
Plugin 'skammer/vim-css-color'

" Visual-Mark ------------------
Plugin 'vim-scripts/Visual-Mark'

call vundle#end()
filetype plugin indent on

" --------------------
" # airline 
" --------------------
set laststatus=2
let g:airline_powerline_fonts = 1

" --------------------
" # startify 
" --------------------
" 设置书签
let g:startify_bookmarks = [
    \ '/Applications/MacVim.app/Contents/Resources/vim/vimrc',
    \ '/etc/hosts',
    \ '/Users/jackness/git/uc/nba-frontend',
    \ '/Users/jackness/git/uc/nba-tasks',
    \]

" 起始页显示的列表长度
let g:startify_files_number = 5
let g:startify_custom_header = [
   \'# 传说中最牛逼的编辑器在此 ~(≥▽≤)/~ ',
   \'-----------------------------------------',
   \]
let g:startify_custom_footer = [
   \'-----------------------------------------',
   \'# good good study, day day up ╭（′▽｀）╯ ',
   \]

" Default mapping 
"let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>' 
let g:multi_cursor_prev_key='<C-p>' 
let g:multi_cursor_skip_key='<C-x>' 
let g:multi_cursor_quit_key='<Esc>'

" --------------------
" # ctags 
" --------------------
" 按照名称排序  
let Tlist_Sort_Type = "name"   
" 在右侧显示窗口  
"let Tlist_Use_Right_Window = 1  
" 压缩方式 
let Tlist_Compart_Format = 1 
" 如果只有一个buffer，kill窗口也kill掉buffer"
let Tlist_Exist_OnlyWindow = 1    
" 不要关闭其他文件的tags  
let Tlist_File_Fold_Auto_Close = 0 
" 不要显示折叠树  
let Tlist_Enable_Fold_Column = 0 
"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File=1      

" --------------------
" # NERDTree 
" --------------------
let g:NERDTree_title='[NERD Tree]'
function! NERDTree_Start()
    exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction

" --------------------
" # tagbar
" --------------------
let g:tagbar_width=25

" --------------------
" # vim-indent-guides
" --------------------
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1

" --------------------
" # emmet
" --------------------
"only enable normal mode functions.
"let g:user_emmet_mode='n'
"enable all functions, which is equal to
let g:user_emmet_mode='inv'
"enable all function in all mode.
"let g:user_emmet_mode='a'

" 只在 html、css中运行
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" 执行按钮
let g:user_emmet_leader_key='<C-y>'
" --------------------
" # js beautify
" --------------------
map <c-j> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-j> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-j> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-j> :call CSSBeautify()<cr>

" ======================================================
" # 系统设置
" ======================================================
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
set ff=unix
set fileencodings=zh_CN.ucs-bom,utf-8,cp936
set fileencoding=utf-8
set termencoding=utf-8

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

" 配色方案
syntax enable
colorscheme monokai

" 配置折叠
"set foldmethod=manual
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" 字体
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h18
"高亮光标所在行
set cul
set cuc

" 禁止光标闪烁
"set gcr=a:block-blinkon0
" 显示行号
set number

" 自动缩进
set autoindent
set cindent

" Tab键的宽度
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

"-----

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
" =====================================================


" 干掉系统默认快捷键
"if has("gui_running")
"  macmenu Edit.Find.Find\.\.\. key=<nop>
"endif
" 定义快捷键的前缀，即<Leader>
let mapleader=";"
"set notimeout
"set ttimeout

"# 设置NerdTree -------------------
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

"# 设置 winManager ----------------
"nmap <silent> <F3> :WMToggle<CR>

"# 设置vim-indent-guides
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"# ctrlSF -------------------------
if MySys() == "windows" 
    nmap<S-F> :CtrlSF 
else
    nmap<S-F> :CtrlSF 
endif

"# tagbar -------------------------
nmap<F4> :TagbarToggle<CR>

"# startify -----------------------
nmap<F5> :tabnew<CR>:Startify<CR>

"# 代码注释 -----------------------
if MySys() == "windows"
    vmap <C-/> <Leader>c gv
    nmap <C-/> <Leader>c<Space>
else
    vmap <D-/> <Leader>c gv
    nmap <D-/> <Leader>c<Space>

endif

"# 代码缩进 -----------------------
vmap <Tab> >> gv
vmap <S-Tab> << gv
nmap <Tab> >>
nmap <S-Tab> <<

"# tab 操作 -----------------------
map <A-Tab> <Esc> :tabn<CR>
if MySys() == "windows" 
    nmap <C-t> :tabnew<CR>
else
    nmap <D-t> :tabnew<CR>
endif
"map <D-f> <Esc> :/

" 普通模式换行---------------------
nmap <CR> i<CR><Esc>
nmap <BS> i<BS><Esc>


" 定义快捷键到行首和行尾
map <Leader>b 0
map <Leader>e $
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历tab
nnoremap nt :tabn<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>wl <C-W>l
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>wh <C-W>h
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>wk <C-W>k
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
nnoremap <Leader>wj <C-W>j
" 上下分割当前文件
nmap <Leader>ws <C-w>s
" 左右分割当前文件
nmap <Leader>wv <C-w>v

" 定义快捷键在结对符之间跳转，助记pair
nmap <Leader>pa %

" 删除到行未
nmap <Leader>de d$
" 删除到行头
nmap <Leader>db d0


