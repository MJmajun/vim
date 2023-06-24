call plug#begin('~/.vim/plugged')

"文件目录树
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"ctags 自动生成和更新
Plug 'ludovicchabant/vim-gutentags'

"函数调用堆栈
"Plug 'vim-scripts/cscope.vim'

"语法检测
Plug 'dense-analysis/ale'

"文件差异比较
Plug 'mhinz/vim-signify'

"补全
"Plug 'ycm-core/YouCompleteMe'

"文件和函数查找
"Plug 'Yggdroot/LeaderF'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

"函数列表
Plug 'vim-scripts/taglist.vim'

"补齐
Plug 'maralla/completor.vim'
Plug 'maralla/completor-neosnippet'

"状态栏信息显示
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"多光标模式
Plug 'mg979/vim-visual-multi'

"自动格式化插件
Plug 'cjuniet/clang-format.vim'
Plug 'itchyny/vim-cursorword'

call plug#end()
let g:EasyMotion_leader_key = 'f' 
 
"------------autoformat----------------
"let g:clang_format#auto_format_on_insert_leave=1   "退出插入模式时自动格式化


"------------------visual-mult-----------------
let g:VM_theme = 'ocean'
"let g:VM_highlight_matches = 'underline'


"------------------ale----------------
""始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
""在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
""<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
           "\   'c++': ['clang'],
           "\   'c': ['clang'],
           "\   'python': ['pylint'],
\}
" Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5
" Write this in your vimrc file
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1


"------------------airline-----------------
set laststatus=2    " 始终显示状态栏
let g:airline#extensions#tabline#enabled=1    " 开启 tab 栏
let g:airline#extensions#tabline#buffer_idx_mode = 1  "带有index
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
let g:airline_theme='ayu_mirage'  

"------------------NERDTree------------------
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif


"-----------------vim-gutentags--------------
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']

"下面的注释掉，不然工会跳转到extern处
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"-----------------cscope--------------------
"set csprg=/usr/bin/cscope

"-----------------vim-signify----------------


"-----------------LeaderF--------------------
nmap <Leader>wq :wq<cr>
nmap <Leader>q :q!<cr>

" don't show the help in normal mode
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
"let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_StlColorscheme = 'ocean'
"let g:Lf_StlColorscheme = 'powerline'

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>


"-------------------completor-----------------
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

"------------------Taglist----------------------
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Auto_Open = 1
let Tlist_Ctags_Cmd='/usr/bin/ctags'
map <silent> tl :TlistToggle<cr>
"在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window = 1
"-----------------vim注释-----------------"
 " 对行注释                                                             
 nmap <leader>c <Esc>:silent s/\S\+/\/* &/e<CR>A */<Esc>:nohlsearch<CR> 
 " 结束行注释                                                           
 nmap <leader>x <Esc>:silent! s/\/\* //<CR>:s/ \*\///<CR>:nohlsearch<CR>
 "添加函数注释
 nmap <Leader>h o<ESC>I/**<ESC>o功能:<ESC>o<ESC>o返回值:<ESC>o<ESC>o<ESC>0xA*/<ESC>
 ab for for ( ; ; ) {
"-----------------vim-----------------"
set sw=4
set ts=4
set expandtab
filetype indent on
set cindent
set t_Co=256
"设置字符集
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=gb2312
set termencoding=utf-8

set hlsearch
set list
set cc=100      "设置100列的航线
set cursorline  "设置当前行的横线
set nu          "设置数字编号
"set listchars=tab:>-,trail:.   "设置tab按键显示为....

"鼠标回到上次的位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
