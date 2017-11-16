" Vim config file.

" 非Plugin设置: {{{

let mapleader=";"                   " 定义快捷键的前缀，即<Leader>

"一般设置:{{{
"
"filetype on							" 侦测文件类型
"filetype plugin on					" 载入文件类型插件
"filetype indent on					" 为特定文件类型载入相关缩进文件
"syntax on							" 语法高亮
"set viminfo+=!						" 保存全局变量
set viminfo='20,<50,s10
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
set cuc								" 高亮光标所在列
set cul                             " 高亮光标所在行
set number							" 显示行号
set laststatus=2					" 显示状态栏 (默认值为 1, 无法显示状态栏)
set updatetime=10
"}}}

" write:{{{
"
set gdefault						" 行内替换,而不是只替换第一个
set showcmd                         " 在 Vim 窗口右下角，标尺的右边显示未完成的命令
set iskeyword+=_,$,@,%,#,-			" 带有如下符号的单词不要被换行分割
set linespace=0						" 字符间插入的像素行数目
set scrolloff=8                     " 光标移动到顶部和底部时保持几行距离
set backspace=2					" 使回格键（backspace）正常处理indent, eol, start等
"set whichwrap+=b,s,[,]             " 左右箭头键在遇到行的边界时可以转行,在Insert模式下
set selection=inclusive             " 光标所在位置被选中
set selectmode=mouse,key
set report=0					        " 通过使用: commands命令，告诉我们文件的哪一行被改变过
"set fillchars=vert:\ ,stl:\ ,stlnc:\     " 在被分割的窗口间显示空白，便于阅读
"}}}

" 搜索和匹配:{{{
set showmatch						" 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=1						" 短暂跳转到匹配括号的时间（单位是十分之一秒）
set ignorecase smartcase            " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
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
set tabstop=4						" 编辑时制表符占用空格数
"set softtabstop=4                   " 逢４个空格进１个制表符
"set expandtab                       " 将tab转换为空格
set shiftwidth=4                    " 格式化时制表符占用空格数
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
" quickfix 乱码
function! QfMakeConv()
	let qflist = getqflist()
	for i in qflist
		let i.text = iconv(i.text, "cp936", "utf-8")
	endfor
	call setqflist(qflist)
endfunction
au QuickfixCmdPost make call QfMakeConv()
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
" 定义快捷键到行首和行尾
nmap lb 0
nmap le $
map <Space> :
" 窗口间切换
nmap <C-h> <C-w>h
nmap <C-LEFT> <C-w>h
nmap <C-j> <C-w>j
nmap <C-DOWN> <C-w>j
nmap <C-k> <C-w>k
nmap <C-UP> <C-w>k
nmap <C-l> <C-w>l
nmap <C-RIGHT> <C-w>l
"改变Y为复制本行
nnoremap Y y$
" buffers间切换
nmap <C-E> :b#<CR>
" 使shift-insert快捷键像在 Xterm程序中一样工作
map <S-Insert> <MiddleMouse>
" 鼠标中键代表快捷粘贴
"map! <S-Insert> <MiddleMouse>
"nmap <leader>n :cn<CR>
"nmap <leader>p :cp<CR>
"全文缩进
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
nnoremap <F10> :set number!<CR>
" 切换前后buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
" 粘贴模式{{{
set pastetoggle=<F4>            "    when in insert mode, press <F4> to go to
au InsertLeave * set nopaste
function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
"}}}
"}}}

" plug:{{{
set nocompatible              " 去除VI一致性,必须
"filetype off                  " 必须

let plugin_manager_readme=expand('$HOME/.vim/plug/repos/github.com/Shougo/dein.vim/README.md')
let plugin_manager_name="dein"
if !filereadable(plugin_manager_readme)
    echo "Installing ".plugin_manager_name."..."
    echo ""
    silent !mkdir $HOMEp $HOME/.vim/plug
    silent !git clone https://github.com/Shougo/dein.vim $HOME/.vim/plug/repos/github.com/Shougo/dein.vim
endif

command PlugInstall :call dein#install()
command PlugUpdata  :call dein#update()
let g:dein#types#git#clone_depth=1
let g:dein#install_process_timeout = 240
set runtimepath+=$HOME/.vim/plug/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.vim/plug/')
	call dein#begin('$HOME/.vim/plug')

	call dein#add('itchyny/lightline.vim')							" 状态栏优化

	call dein#add('Shougo/dein.vim',{
				\'on_cmd' : 'PlugInstall'})							" vim插件管理器
	call dein#add('tpope/vim-fugitive',{
				\'on_cmd' :['Gstatus','Gdiff']})					" git集成
	call dein#add('majutsushi/tagbar',{
				\'on_cmd': 'TagbarToggle'})							" 标签浏览
	call dein#add('jsfaint/gen_tags.vim',{
				\'on_cmd': 'GenGTAGS'})								" gnu global更新
	call dein#add('vim-scripts/DoxygenToolkit.vim',{
				\'on_cmd': ['Dox','DoxAuthor','DoxLic']})			" Doxygen风格注释
	call dein#add('skywind3000/asyncrun.vim',{
				\'on_cmd': 'AsyncRun'})								" 异步执行
	call dein#add('sjl/gundo.vim',{
				\'on_cmd': 'GundoToggle'})							" 多分支撤销
	call dein#add('ctrlpvim/ctrlp.vim',{
				\'on_cmd': ['CtrlP', 'CtrlPMixed', 'CtrlPMRU']})	" 文件查找
	call dein#add('scrooloose/nerdtree',{
				\'on_cmd': 'NERDTreeToggle' })						" 目录树
	call dein#add('Xuyuanp/nerdtree-git-plugin',{
				\'on_cmd': 'NERDTreeToggle' })						" 目录树显示git状态
	call dein#add('dyng/ctrlsf.vim',{
				\'on_cmd': 'CtrlSF'})								" 搜索
	call dein#add('terryma/vim-multiple-cursors',{
				\'on_event': 'CursorHold'})							" 多行编辑
	call dein#add('vim-scripts/a.vim',{
				\'on_cmd': 'A'})									" .h和.c切换
	call dein#add('iamcco/markdown-preview.vim') ",{
				"\'merged': 0,
				"\'on_cmd': 'MarkdownPreview'})						"markdown预览

	call dein#add('scrooloose/nerdcommenter',{
				\'on_map': [';cc',';cu']})							" 快速注释
	call dein#add('junegunn/vim-easy-align',{
				\'on_map': '<Plug>(EasyAlign)'})					" 快速对齐

	call dein#add('rdnetto/YCM-Generator',{
				\'on_event' : 'CursorHold'}) 						" 自动生成超级补全配置
	call dein#add('easymotion/vim-easymotion',{
				\'on_event': 'CursorHold'})							" 快速移动
	call dein#add('luochen1990/rainbow',{
				\'on_event': 'CursorHold'})							" 彩虹括号
	call dein#add('bronson/vim-trailing-whitespace',{
				\'on_event': 'CursorHold'})							" 去除尾随空格
	call dein#add('aceofall/gtags.vim',{
				\'on_event': 'CursorHold'})							" gnu global
	call dein#add('bling/vim-airline',{
				\'on_event': 'CursorHold'})							" 状态栏优化
	call dein#add('vim-airline/vim-airline-themes',{
				\'on_event': 'CursorHold'})							" 状态栏主题

	call dein#add('jsfaint/gen_tags.vim',{
				\'merged': 0,
				\'on_event': 'BufWritePost'})						" gnu global更新

	call dein#add('lilydjwg/fcitx.vim',{
				\'on_event' : 'InsertEnter'})						" 输入法状态保存
	call dein#add('w0rp/ale',{
				 \'on_event': 'InsertEnter'}) 						" 异步语法检查
	call dein#add('jiangmiao/auto-pairs',{
				\'on_event': 'InsertEnter'})						" 结对符补全
	call dein#add('honza/vim-snippets',{
				\'merged': 0,
				\'on_event': 'InsertEnter'})						" 模版补全语法文件
	call dein#add('SirVer/ultisnips',{
				\'on_event': 'InsertEnter'})						" 模版补全
	call dein#add('Valloric/YouCompleteMe',{
				\'merged': 0,
				\'on_event': 'InsertEnter'})						" 超级补全

	"call dein#add('nathanaelkane/vim-indent-guides')               " 缩进可视化
	"call dein#add('jistr/vim-nerdtree-tabs')                       " 目录树自启动
	"call dein#add('vim-scripts/CSApprox')                          " 正确显示gvim配色
	"call dein#add('sunuslee/vim-plugin-random-colorscheme-picker') " 随机选择配色
	"call dein#add('tomasr/molokai')                                " 配色
	"call dein#add('tomasr/molokai',{'on_event': 'CursorHold'})		" 配色
	"call dein#add('altercation/vim-colors-solarized')              " 配色
	"call dein#add('vim-scripts/desert256.vim') 					" 配色
if dein#check_install()
	call dein#install()
endif
	call dein#end()
	call dein#save_state()
endif
filetype plugin indent on
syntax enable

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
"let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
"let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"] " a
" 去掉尾部的错误和警告
"let g:airline#extensions#default#layout = [
            "\ [ 'a', 'b', 'c' ],
            "\ [ 'x', 'y', 'z', 'error', 'warning' ]
            "\ ]
" \ "[ 'x', 'y', 'z' ]
let g:airline_symbols = {}                                          " 正确显示分隔符
let g:airline_symbols.branch = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
"航空公司选择Tab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>-  <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
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

" color:{{{
set t_Co=256
let g:rehash256 = 1
set background=dark
colorscheme molokai
colorscheme solarized                         " 配色
"set termguicolors desert256
"colorscheme darkmate
"colorscheme desert256
"colorscheme zenburn
"colorscheme Tomorrow-Night-Bright
"colorscheme Tomorrow-Night
"colorscheme Tomorrow-Night-Eighties
"}}}

" 模版补全：{{{
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger ="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger = '<CR>'
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
"}}}

" 多行编辑:{{{
" vim-multiple-cursors 快捷键
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_skip_key='<C-k>'
"}}}

" YCM设置:{{{
" YCM 补全菜单配色
" 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
"" 选中项
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
"let g:loaded_youcompleteme = 1
let g:ycm_complete_in_comments=1
"在字符串输入中也能补全
let g:ycm_complete_in_strings =1
"注释和字符串中的文字也会被收入补全let
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
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
" 得到类型
nnoremap <F3> :YcmCompleter GetType<CR>
let g:ycm_show_diagnostics_ui = 0   "关闭ycm语法检查
let g:ycm_add_preview_to_completeopt  =  1                  "补全预览是否打开
let g:ycm_autoclose_preview_window_after_insertion  =  1    "非插入模式自动关闭预览窗口
"set splitbelow                                              "预览窗口在底部

" UltiSnips 和 ycm共用TAB
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
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>

"}}}

" ctrlsf: {{{
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>
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
nnoremap <Leader>cw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>wc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
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
nnoremap <C-p> :CtrlP<CR>
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
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us  =  1     " 智能匹配大小写
nmap <Leader><leader><leader>s <Plug>(easymotion-sn)
nmap <Leader><leader><leader>f <Plug>(easymotion-fn)
nmap s <Plug>(easymotion-s)
nmap f <Plug>(easymotion-f)
map <leader>. <Plug>(easymotion-repeat)
"}}}

" DoxygenToolkit 注释{{{
nmap <leader>lic :DoxLic<CR>
nmap <leader>au :DoxAuthor<CR>
nmap <leader>cf :Dox<CR>
"}}}

" AsyncRun 异步执行操作:{{{
augroup vimrc
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END
noremap <F9> :call asyncrun#quickfix_toggle(8)<cr>
map <F5> :AsyncRun make<CR>
let g:asyncrun_encs = 'gbk'
"}}}

" global {{{
"s:查找函数名、宏、枚举值等出现的地方
nmap <leader>d :cs find s <C-R>=expand("<cword>")<CR><CR>
"g: 查找函数、宏、枚举等定义的位置
map <C-]> :cs find g <C-R>=expand("<cword>")<CR><CR>
"c: 查找调用本函数的函数
nmap <leader>s :cs find c <C-R>=expand("<cword>")<CR><CR>
"
set cscopetag " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope
nmap <F4> :GtagsCursor<CR><CR>
"cs add /opt/v1.9-dev/GTAGS
cs add GTAGS
"GenGTAGS 设置
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
au BufWritePost call UpdateGtags(expand('<afile>'))
"}}}

" 去除行尾空格
nnoremap <leader><space> :FixWhitespace<cr>
" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>
"}}}

" 公司强制格式{{{
set fencs=utf-8,cp936
function! KRIndent()
    let c_space_errors = 0
    set fileformats=unix
    set textwidth=120
    set noexpandtab
    set shiftround
    set cindent
    set formatoptions=tcqlron
    set cinoptions=:0,l1,t0,g0
    syntax keyword cType u8 u16 u32 u64 s8 s16 s32 s64 off64_t
    highlight default link LinuxError ErrorMsg

    syntax match LinuxError / \+\ze\t/     " spaces before tab
    syntax match LinuxError /\s\+$/        " trailing whitespaces
    "syntax match LinuxError /\%121v.\+/    " virtual column 121 and more
    "autocmd BufWrite <buffer> :%s/\s\+$//e " 文件保存时，自动删除行尾空格
endfunction
if has("autocmd")
    autocmd FileType c,cpp,h,hh call KRIndent()
endif
" }}}
