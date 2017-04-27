" Vim config file.

let mapleader=";"                   " 定义快捷键的前缀，即<Leader>

" 非Plugin设置: {{{

"一般设置:{{{
"
filetype on							" 侦测文件类型
filetype plugin on					" 载入文件类型插件
filetype indent on					" 为特定文件类型载入相关缩进文件
syntax on							" 语法高亮
set viminfo+=!						" 保存全局变量
set nocompatible					" 不要使用vi的键盘模式，而是vim自己的
set confirm							" 在处理未保存或只读文件的时候，弹出确认
set autoread                        " 设置当文件被改动时自动载入
set backupcopy=yes                  " 设置备份时的行为为覆盖
set noswapfile						" 禁止生成临时文件
set nobackup                        " 从不备份
set history=1000					" 历史记录数
set clipboard+=unnamed              " 共享剪贴板
set hidden                          " 启用多个修改后的缓冲区
set autowrite                       " 自动保存
"set mouse=n							" 可以在任何地方使用鼠标
set wildmenu                        " 增强模式中的命令行自动完成操作
set wildmode=list:full              " 增强模式打开列表
"set wildmode=list             " 增强模式打开列表
"set noerrorbells                    " 关闭错误信息响铃
"set novisualbell                    " 关闭可视化响铃代替呼叫
"set t_vb=                           " 置空错误响铃终端代码
"autocmd BufWritePost $MYVIMRC source $MYVIMRC " 让配置变更立即生效
"}}}

" 外观设置:{{{
"
set cuc								" 高亮光标所在列
set cul                             " 高亮光标所在行
"set ruler							" 显示当前的行号列号
set number							" 显示行号
set laststatus=2					" 显示状态栏 (默认值为 1, 无法显示状态栏)
"}}}

" write:{{{
"
set gdefault						" 行内替换,而不是只替换第一个
set showcmd                         " 在 Vim 窗口右下角，标尺的右边显示未完成的命令
set iskeyword+=_,$,@,%,#,-			" 带有如下符号的单词不要被换行分割
set linespace=0						" 字符间插入的像素行数目
set scrolloff=8                     " 光标移动到顶部和底部时保持几行距离
set backspace=2					" 使回格键（backspace）正常处理indent, eol, start等
set whichwrap+=b,s,[,]             " 左右箭头键在遇到行的边界时可以转行,在Insert模式下
set selection=inclusive             " 光标所在位置被选中
set selectmode=mouse,key
set report=0					        " 通过使用: commands命令，告诉我们文件的哪一行被改变过
"set fillchars=vert:\ ,stl:\ ,stlnc:\     " 在被分割的窗口间显示空白，便于阅读
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %l,%c,%L,%p%%\ %y\ %0(%{&fileformat}\ %{&encoding}%)\ %{strftime(\"%y/%m/%d\ %H:%M\")}
" 设置在状态行显示的信息
"}}}

" 搜索和匹配:{{{
set showmatch						" 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=1						" 短暂跳转到匹配括号的时间（单位是十分之一秒）
set ignorecase smartcase            " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
"set nowrapscan                      " 禁止在搜索到文件两端时重新搜索
"set incsearch						" 键入字符串的过程中就开始搜索
set hlsearch                        " 高亮搜索结果
"}}}

" 语法和补全:{{{
"
set wildignore=.svn,.git,*.swp,*.bak,*~,*.o,*.a     "自动补全忽略这些文件扩展名
set completeopt=preview,menu,longest		" 代码补全
set pumheight=10                                    " 自动补全的高度
set foldenable                                      " 开始折叠
set foldmethod=marker                               " 利用标记折叠
"set foldmethod=indent                              " 基于缩进折叠
"set foldmethod=syntax                              " 设置语法折叠
"setlocal foldlevel=1                               " 设置折叠层数为
"set nofoldenable                                   " 启动时关闭折叠
" set foldclose=all                                 " 设置为自动关闭折叠
"}}}

" 文本格式和排版:{{{
"
set tabstop=4						" Tab键的宽度
"set softtabstop=4                   " 逢４个空格进１个制表符
set expandtab                       " 将tab转换为空格
set shiftwidth=4                    " 缩进的空格数
set autoindent                      " 新行自动缩进
set cindent                         " 使用ｃ语言缩进格式
set formatoptions=tcqlron         " 自动格式化
"set textwidth=120
set textwidth=0                     " 自动换行(插入模式)
set fileformat=unix                 " unix换行方式
set smartindent						" 开启新行时使用智能自动缩进
set smarttab						" 在行和段开始处使用制表符
set cinoptions=:0,l1,t0,g0			" 为C/C++设置详细的缩进信息
syntax keyword cType u8 u16 u32 u64 s8 s16 s32 s64 off64_t
"}}}

" 编码和语言:{{{
"
set encoding=utf-8                  " vim内部使用的编码方式
set termencoding=utf-8              " 终端使用的编码方式
set fileencoding=utf-8              " vim当前编辑和保存的编码方式
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936 "编码设置
" 打开文件时自动识别编码，fileencoding就为辨认的值
set langmenu=zh_CN.UTF-8
set helplang=cn                     " 帮助系统设置为中文
"}}}

" 其他:{{{
"打开自动定位到最后编辑的位置,需要确认 .viminfo 当前用户可写
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif         " 离开插入模式后自动关闭预览窗口

"}}}
"}}}

" 按键映射:{{{
"man 3 的快捷键
nmap <Leader>man :Man 3 <cword><CR>
" 定义翻屏
nmap <C-j> <C-f>
nmap <C-k> <C-b>
" 定义快捷键到行首和行尾
nmap lb 0
nmap le $
map <Space> :
" 遍历子窗口
"nnoremap nw <C-W><C-W>
" 窗口间切换
nmap <C-h> <C-w>h
nmap <C-LEFT> <C-w>h
"nmap <C-j> <C-w>j
nmap <C-DOWN> <C-w>j
"nmap <C-k> <C-w>k
nmap <C-UP> <C-w>k
nmap <C-l> <C-w>l
nmap <C-RIGHT> <C-w>l
"改变Y为复制本行
nnoremap Y y$
" toggle highlight trailing whitespace
nmap <silent> <leader>l :set nolist!<CR>
" buffers间切换
nmap <C-E> :b#<CR>
" 使shift-insert快捷键像在 Xterm程序中一样工作
map <S-Insert> <MiddleMouse>
" 鼠标中键代表快捷粘贴
map! <S-Insert> <MiddleMouse>
" ,n to get the next location (compilation errors, grep etc)
"nmap <leader>n :cn<CR>
"nmap <leader>p :cp<CR>
" 关闭搜索高亮结果
"nmap <silent> <C-N> :silent noh<CR>
" 全文缩进
map <F12> gg=G
"新建标签
map <M-F2> :tabnew<CR>
"列出当前目录文件
map <F3> :tabnew .<CR>
" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" 复制到系统剪贴板
vnoremap <leader>y "+y
" 粘贴系统剪贴板中内容
nnoremap <leader>p "+p
" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>
"}}}

" vdunle:{{{
"set nocompatible              " 去除VI一致性,必须
"filetype off                  " 必须
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/bundle')
Plug 'tpope/vim-fugitive'                            " git 集成
Plug 'scrooloose/nerdcommenter'                       " 快速注释
Plug 'SirVer/ultisnips'                               " 模版补全
Plug 'honza/vim-snippets'                             " 模版补全语法文件
Plug 'nathanaelkane/vim-indent-guides'                " 缩进可视化
"Plug 'fholgado/minibufexpl.vim'                      " 多标签buffer
"Plug 'powerline/fonts'                                 " 字体
Plug 'scrooloose/nerdtree',{'on':'NERDTreeToggle'}      " 目录树
"Plug 'jistr/vim-nerdtree-tabs'
"Plug 'Xuyuanp/nerdtree-git-plugin'                         " 目录树显示git状态
Plug 'dyng/ctrlsf.vim'                                " 搜索
Plug 'terryma/vim-multiple-cursors'                   " 多行编辑
Plug 'majutsushi/tagbar'                              " 标签浏览
Plug 'vim-scripts/CSApprox'                                      " 正确显示gvim配色
"Plug 'sunuslee/vim-plugin-random-colorscheme-picker' " 随机选择配色
"Plug 'tomasr/molokai'                                " 配色
Plug 'altercation/vim-colors-solarized'                         " 配色
"Bundle 'desert256.vim'                                 " 配色
Plug 'vim-scripts/DoxygenToolkit.vim'					" 自动生成注释
Plug 'Valloric/YouCompleteMe'                         " 超级补全
Plug 'rdnetto/YCM-Generator'                          " 自动生成超级补全配置
Plug 'vim-scripts/a.vim'                              " .h和.c切换
Plug 'junegunn/vim-easy-align'                        " 快速对齐
Plug 'ctrlpvim/ctrlp.vim'                             " 文件查找
Plug 'easymotion/vim-easymotion'                      " 快速移动
"Plug 'w0rp/ale'                                  " 异步语法检查
Plug 'sjl/gundo.vim'                                  " 多分支撤销
"Plug 'itchyny/lightline.vim'                          " 状态栏优化
Plug 'bling/vim-airline'                             " 状态栏优化
Plug 'vim-airline/vim-airline-themes'                " 状态栏主题
Plug 'powerline/fonts'                             " 状态栏优化
Plug 'jiangmiao/auto-pairs'                             " 结对符补全
Plug 'luochen1990/rainbow'                             " 彩虹括号
Plug 'aceofall/gtags.vim'                             " global
Plug 'jsfaint/gen_tags.vim'                         " global更新
"Plug 'hewes/unite-gtags'
"Plug 'Shougo/unite.vim'                         " global
Plug 'skywind3000/asyncrun.vim'                         " 异步执行
Plug 'bronson/vim-trailing-whitespace'            " 尾随空格
"call vundle#end()            " 必须
call plug#end()
"}}}

" 插件设置:{{{

" airline状态栏:{{{
let g:airline_powerline_fonts = 1                                   " 这个是安装字体后 必须设置此项
let g:airline_theme= 'bubblegum'
let g:airline_theme= 'dark'                                         " airline 主题
let g:airline#extensions#tabline#enabled = 1                        " 启用增强的标签
let g:airline#extensions#tabline#buffer_nr_show = 1                 " 显示缓冲区序号
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'        " 不显示文件编码
"let g:airline_skip_empty_sections = 1                               " 不为空的部分绘制分隔符
let g:airline#extensions#whitespace#enabled = 0                     " 关闭状态显示空白符号计数
let g:airline#extensions#branch#enabled = 1                         " 启用git集成
let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"] " a
" 去掉尾部的错误和警告
let g:airline#extensions#default#layout = [
            \ [ 'a', 'b', 'c' ],
            \ [ 'x', 'y', 'z', 'error', 'warning' ]
            \ ]
           " \ "[ 'x', 'y', 'z' ]
let g:airline_symbols = {}                                          " 正确显示分隔符
let g:airline_symbols.branch = ''
let g:airline_symbols.linenr = ''
"function! AirlineInit()                                             " 自定义状态栏显示
    "let spc = g:airline_symbols.space
    "let g:airline_section_a = airline#section#create_left(['mode', 'crypt', 'paste', 'spell', 'capslock', 'xkblayout', 'iminsert'])
    "let g:airline_section_b = airline#section#create(['hunks', 'branch'])
    "let g:airline_section_c = airline#section#create(['%<', 'path', spc, 'readonly'])
    "let g:airline_section_x = airline#section#create_right(['filetype'])
    "let g:airline_section_y = airline#section#create_right(['ffenc'])
    "let g:airline_section_z = airline#section#create(['windowswap', 'obsession', '%3p%%'.spc, 'linenr', 'maxlinenr', spc.':%3v'])
"endfunction
"autocmd User AirlineAfterInit call AirlineInit()
"}}}

" A.vim设置:{{{
nmap <leader>a :A


" }}}

" color:{{{
set t_Co=256
syntax reset
if has('gui_running')
    set background=light
else
    set background=dark
endif
"let g:molokai_original = 1
let g:rehash256 = 1
    set background=dark
colorscheme molokai
"colorscheme solarized                         " 配色
"set termguicolors desert256
"colorscheme darkmate
"colorscheme desert256
"colorscheme zenburn
"colorscheme Tomorrow-Night-Bright
"colorscheme Tomorrow-Night
colorscheme Tomorrow-Night-Eighties

"}}}

" 模版补全：{{{
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger ="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
"}}}

" 可视化缩进:{{{
let g:indent_guides_enable_on_vim_startup=1         " 自启动
let g:indent_guides_start_level=2                  " 从第几层显示缩进
let g:indent_guides_guide_size=1                    " 色块宽度
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
"}}}

" buffer:{{{
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
map <leader><C-Tab> :MBEbn<cr>
map <leader><C-S-Tab> :MBEbp<cr>
"}}}"

" 目录树:{{{
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree                                    " 自动打开目录树
let NERDTreeWinSize=20                                          " 设置NERDTree子窗口宽度
let NERDTreeWinPos="right"                                      " 设置NERDTree子窗口位置
let NERDTreeShowHidden=1                                        " 显示隐藏文件
let NERDTreeAutoDeleteBuffer=1                                  " 删除文件时自动删除文件对应 buffer

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
     exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
      exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction
  call NERDTreeHighlightFile('h', 'green', 'none', 'green', '#151515')


"let g:nerdtree_tabs_open_on_console_startup = 1


"}}}"

" tagbar:{{{
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>lt :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=22
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_d= {
            \ 'kinds' : [
            \ 'c:classes:0:1',
            \ 'd:macros:0:1',
            \ 'e:enumerators:0:0',
            \ 'f:functions:0:1',
            \ 'g:enumeration:0:1',
            \ 'l:local:0:1',
            \'m:members:0:1',
            \'n:namespaces:0:1',
            \'p:functions_prototypes:0:1',
            \'s:structs:0:1',
            \'t:typedefs:0:1',
            \'u:unions:0:1',
            \'v:global:0:1',
            \'x:external:0:1'
            \],
            \'sro':'::',
            \'kind2scope':{
            \'g':'enum',
            \'n':'namespace',
            \'c':'class',
            \'s':'struct',
            \'u':'union'
            \},
            \'scope2kind':{
            \'enum':'g',
            \'namespace':'n',
            \'class':'c',
            \'struct':'s',
            \'union':'u'
            \}
            \}
"}}}

" 多行编辑:{{{
" vim-multiple-cursors 快捷键
"let g:multi_cursor_next_key='<S-n>'
"let g:multi_cursor_skip_key='<S-k>'

"}}}

" YCM设置:{{{
" YCM 补全菜单配色
" 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
"" 选中项
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
"在字符串输入中也能补全
let g:ycm_complete_in_strings =1
"注释和字符串中的文字也会被收入补全let
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
"set tags+=/data/misc/software/misc./vim/stdcpp.tags
set tags+=/usr/include/tags
set tags+=.
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
" set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" 跳到声明
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 优先跳到定义，没有定义就跳到声明
nnoremap <F2> :YcmCompleter GoTo<CR>
nnoremap <S-F2> :YcmCompleter GoToImprecise<CR>
" 得到类型
nnoremap <F3> :YcmCompleter GetType<CR>
nnoremap <F3> :YcmCompleter GetTypeImprecise<CR>

let g:ycm_show_diagnostics_ui = 0   "关闭ycm语法检查
let g:ycm_add_preview_to_completeopt  =  1                  "补全预览是否打开
let g:ycm_autoclose_preview_window_after_insertion  =  1    "非插入模式自动关闭预览窗口
"set splitbelow                                              "预览窗口在底部

"let g:ycm_semantic_triggers = {
  "\   'cpp': ['re!.']
  "\ }


" UltiSnips 和 ycm共用TAB
"let g:ulti_expand_res = 0
"Enable tabbing through list of results
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call
            UltiSnips#JumpForwards()
            if
                g:ulti_jump_forwards_res == 0
                return  "\<TAB>"
            endif
        endif
    endif
    return
    ""
endfunction

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" Expand snippet or return
let g:ulti_expand_res = 0
function! Ulti_ExpandOrEnter()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ''
    else
        return "\<return>"
    endfunction

    " Set <space> as primary trigger
    inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>

"}}}

" ctrlsf: {{{
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>
"nmap <C-F> :CtrlSF<CR>
let g:ctrlsf_ackprg = 'ag'                          " 设置ctrlsf 使用ag
let g:ctrlsf_auto_close = 0                            " 跳到搜索结果不关闭查找窗口
let g:ctrlsf_context = '-B 0 -A 0'                       " 设置搜索结果显示几行
"let g:ctrlsf_default_view_mode = 'compact'              "设置窗口正常视图和紧凑视图
let g:ctrlsf_populate_qflist  =  1                      "是否提供quickfix列表
"let g:ctrlsf_position  =  'bottom'                      "搜索结果显示位置left，right，top和bottom
let g:ctrlsf_default_root = 'project'
"}}}

" 精准替换: {{{
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" }}}

 " 快速对齐: {{{
 vmap <Leader>a <Plug>(EasyAlign)
 nmap <Leader>a <Plug>(EasyAlign)
 if !exists('g:easy_align_delimiters')
     let g:easy_align_delimiters = {}
 endif
 let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
" }}}

" 文件查找(ctrlp): {{{
 let g:ctrlp_custom_ignore = {
             \ 'dir':  '\v[\/]\.(git|hg|svn|rvm|repo)$',
             \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
             \ }
 let g:ctrlp_working_path_mode=0
 let g:ctrlp_match_window_bottom=1
 let g:ctrlp_max_height=15
 let g:ctrlp_match_window_reversed=0
 let g:ctrlp_mruf_max=500
 let g:ctrlp_follow_symlinks=1
"}}}

" 彩虹括号{{{
let g:rainbow_active = 1
    let g:rainbow_conf = {
        \   'guifgs' : ['#6A5ACD', '#B22222', '#C0FF3E', '#EEC900', '#9A32CD', '#EE7600', '#98fb98', '#686868'],
        \   'ctermfgs': 'xterm-256color' == $TERM ? ['141', '196', '112', '208', '129', '166', '85', '237'] : ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
        \}
" }}}

" EasyMotion 快速移动{{{
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_do_shade = 1               " 禁用文字阴影
let g:EasyMotion_inc_highlight = 0
let g:EasyMotionIncCursor=1
highlight! link EasyMotionIncSearch IncSearch
"hi link EasyMotionIncSearch Search
"hi link EasyMotionMoveHL Search

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us  =  1     " 智能匹配大小写
"let g:EasyMotion_move_highlight = 0
"let g:EasyMotion_landing_highlight = 1
nmap <Leader><leader><leader>s <Plug>(easymotion-sn)
nmap <Leader><leader><leader>f <Plug>(easymotion-fn)
nmap s <Plug>(easymotion-s)
nmap f <Plug>(easymotion-f)
map <expr> n EasyMotion#is_active() ? '<Plug>(easymotion-next)' : 'n'
map <expr> <S-n> EasyMotion#is_active() ? '<Plug>(easymotion-prev)' : '<S-n>'
hi link EasyMotionMoveHL Search
"重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)
"}}}

" DoxygenToolkit 注释{{{
nmap <leader>lic :DoxLic<CR>
nmap <leader>aa :DoxAuthor<CR>
nmap <leader>c :Dox<CR>
"}}}

" AsyncRun 异步执行操作:{{{
augroup vimrc
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END
noremap <F9> :call asyncrun#quickfix_toggle(8)<cr>
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
map <F5> :AsyncRun make<CR>
"}}}
" 去除行尾空格
nnoremap <leader><space> :FixWhitespace<cr>
" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>

"}}}

 " solarized 设置{{{
 syntax enable
 "set background=dark
 "let g:solarized_termcolors=256
 ""let g:solarized_termtrans=0
 "let g:solarized_degrade = 1
 let g:solarized_contrast = -256
"colorscheme solarized
"}}}

" 行号开关{{{
function! HideNumber()
	if(&relativenumber == &number)
        set relativenumber! number!
    elseif(&number)
        set number!
    else
        set relativenumber!
	endif
	 "set number?
 endfunc
nnoremap <F10> :call HideNumber()<CR>
"}}}

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转{{{
"set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber number
	else
		set relativenumber
	endif
endfunc
nnoremap <C-z> :call NumberToggle()<cr> "
"}}}

" 粘贴模式{{{
set pastetoggle=<F4>            "    when in insert mode, press <F5> to go to
au InsertLeave * set nopaste
function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
"}}}

" tab 相关{{{
 " 切换前后buffer
  nnoremap [b :bprevious<cr>
  nnoremap ]b :bnext<cr>

" tab切换
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
"}}}

" global {{{
"s:查找函数名、宏、枚举值等出现的地方
nmap <leader>d :cs find s <C-R>=expand("<cword>")<CR><CR>
"g: 查找函数、宏、枚举等定义的位置
nmap <leader>r :cs find g <C-R>=expand("<cword>")<CR><CR>
"c: 查找调用本函数的函数
nmap <leader>s :cs find c <C-R>=expand("<cword>")<CR><CR>
"
set cscopetag " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope
nmap <F4> :GtagsCursor<CR><CR>
"cs add /opt/v1.9-dev/GTAGS
"cs add GTAGS
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

"function! UpdateGtags()
    "exec GenGTAGS
"endfunction
"au BufWritePost call UpdateGtags()
au BufWritePost exec GenGTAGS
"}}}
