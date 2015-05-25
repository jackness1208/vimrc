
" Maintainer:   jackness Lau
" Last Change:  2015.5.16


" ======================================================
" function 定义
" ======================================================
function MySys()
    if has('win32') || has('win64')
        return 'windows'
    else
        return 'others'
    endif
    
endfunction

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
if MySys() == 'windows'
    set nocompatible
    source $VIMRUNTIME/vimrc_example.vim
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

" YouCompleteMe ----------------
"Plugin 'Valloric/YouCompleteMe'

" mattn/emmet-vim --------------
Plugin 'mattn/emmet-vim'

" auto-pairs -------------------
Plugin 'jiangmiao/auto-pairs'

" ctags.vim [需额外装插件]------
Plugin 'vim-scripts/ctags.vim'

" ctrlsf.vim -------------------
Plugin 'dyng/ctrlsf.vim'

" ack [需额外装插件]------------
" Plugin 'mileszs/ack.vim'

" ag [需额外装插件]------------
Plugin 'rking/ag.vim'



" indentLine -------------------
Plugin 'Yggdroot/indentLine'


 "nerdcommenter ----------------
"Plugin 'scrooloose/nerdcommenter'

 "vim-commentary ---------------
Plugin 'tpope/vim-commentary'

" vim-scripts/Tagbar -----------
Plugin 'majutsushi/tagbar'

" jsbeautify -------------------
Plugin 'maksimr/vim-jsbeautify'

" vim-css-color ----------------
Plugin 'skammer/vim-css-color'



" Visual-Mark ------------------
Plugin 'vim-scripts/Visual-Mark'

" vim-session ------------------
Plugin 'xolox/vim-session'

" vim-misc ---------------------
Plugin 'xolox/vim-misc'

" Recover.vim ------------------
"Plugin 'chrisbra/Recover.vim'

" vim-surround -----------------
"Plugin 'tpope/vim-surround'

" jshint2.vim ------------------
Plugin 'Shutnik/jshint2.vim'

" vim-javascript ---------------
" Plugin 'pangloss/vim-javascript'

" /EasyGrep --------------------
Plugin 'vim-scripts/EasyGrep'




call vundle#end()
filetype plugin indent on


" --------------------
" # airline 
" --------------------
set laststatus=2
if MySys() == 'windows'
    let g:airline_powerline_fonts = 0
else
    let g:airline_powerline_fonts = 1
endif

"let g:airline_theme = 'powerlineish' 

" --------------------
" # startify 
" --------------------
" 设置书签
"
if MySys() == 'windows'
    let g:startify_bookmarks = [
        \ 'D:\Program Files (x86)\vim\_vimrc',
        \ 'G:\GitHub\vimrc',
        \ 'D:\Program Files (x86)\vim\.jshintrc',
        \ 'C:\Windows\System32\drivers\etc\hosts',
        \ 'G:\uc\github\nba-frontend',
        \ 'G:\uc\github\nba-tasks',
        \]

else 
    let g:startify_bookmarks = [
        \ '/Applications/MacVim.app/Contents/Resources/vim/vimrc',
        \ '~/git/github/vimrc/vimrc',
        \ '/etc/hosts',
        \ '~/git/uc/nba-frontend',
        \ '~/git/uc/nba-tasks',
        \]
endif
" 起始页显示的列表长度
let g:startify_files_number = 5
let g:startify_custom_header = [
   \'# 传说中最牛逼的编辑器在此 ~(≥▽≤)/~ ',
   \'-----------------------------------------',
   \]
let g:startify_custom_footer = [
   \'-----------------------------------------',
   \'# good good study, day day up ╭（′▽｀）╯ ',
   \'# 如果 session挂了 请输入 :OpenSession! default',
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
let g:tagbar_width=30

" --------------------
" # indentLine
" --------------------
let g:indentLine_leadingSpaceChar = '·'
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
" # ctrlSF 
" --------------------
let g:ctrlsf_ackprg = 'ag'
let g:ctrlsf_context = '-B 5 -A 3'

" --------------------
" # ag
" --------------------
let g:ag_highlight=1



" --------------------
" # js beautify
" --------------------
map <c-j> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-j> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-j> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-j> :call CSSBeautify()<cr>
" --------------------
" # nerdcommenter
" --------------------
let g:NERDCustomDelimiters = {
    \ 'html': {  'left': '<!-- ', 'right': '-->', 'leftAlt': '/*','rightAlt': '*/' },
    \ 'xhtml': {  'left': '<!-- ', 'right': '-->', 'leftAlt': '/*','rightAlt': '*/'},
    \'vimperator': { 'left': '"' },
\}
let NERD_html_alt_style=1


" --------------------
" # session
" --------------------
" 自动保存session
let g:session_autosave='yes'
" 每隔 5 分钟 保存一次 session
let g:session_autosave_periodic=5
" 打开vim自动载入上次 session 
let g:session_default_to_last='yes'
let g:session_autoload='yes'

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

    if MySys() == 'windows'
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
    "let g:fencview_autodetect=0
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
colorscheme monokai

" 配置折叠
"set foldmethod=manual
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" 字体
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14
"高亮光标所在行
set cul
set cuc

" 禁止光标闪烁
"set gcr=a:block-blinkon0
" 显示行号
set number

" 自动缩进
set autoindent
set smartindent

" Tab键的宽度
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4


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


" 干掉系统默认快捷键
"if has("gui_running")
"  macmenu Edit.Find.Find\.\.\. key=<nop>
"endif
" 定义快捷键的前缀，即<Leader>
let mapleader=";"
"set notimeout
"set ttimeout


"# 设置NerdTree -------------------
"map <F3> :NERDTreeMirror<CR>
"map <F3> :NERDTreeToggle<CR>
map <Leader>2 :NERDTreeMirror<CR>
map <Leader>2 :NERDTreeToggle<CR>



"# 设置vim-indent-guides
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"# ctrlSF -------------------------
nmap<S-F> :CtrlSF 

"# tagbar -------------------------
"nmap<F4> :TagbarToggle<CR>
nmap<Leader>3 :TagbarToggle<CR>
"# startify -----------------------
"nmap<F5> :tabnew<CR>:Startify<CR>
nmap<Leader>1 :tabnew<CR>:Startify<CR>
"# 代码注释 -----------------------
if MySys() == "windows"
    vmap <C-/> gcgv
    nmap <C-/> gccgv
else
    vmap <D-/> gc
    nmap <D-/> gcc

endif

"# 代码缩进 -----------------------
vmap <Tab> >gv
vmap <S-Tab> <gv
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

"# tab 操作 -----------------------

" 普通模式换行---------------------
nmap <CR> i<CR><Esc>
nmap <BS> i<BS><Esc>


" 定义快捷键到行首和行尾
map <Leader>b ^
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
nnoremap tn :tabn<CR>
" 依次遍历子窗口
nnoremap wn <C-W><C-W>
" 依次遍历marks(要配合 v-mark)
nnoremap mn <F2>
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
" 左右分割当前文件
nmap wv <C-w>v

" 定义快捷键在结对符之间跳转，助记pair
nmap <Leader>pa %

" 删除到行未
nmap <Leader>de d$
" 删除到行头
nmap <Leader>db d0





