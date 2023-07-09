" color
syntax on
set t_Co=256
set bg=dark
try
    colorscheme desert
catch
endtry

" no activate showcmd
set showcmd
set noshowmode
set scrolloff=5
set ai
set cursorline
set cursorcolumn
set clipboard=unnamed
set nu
set ruler
set wrap
set linebreak

set tabstop=4
set shiftwidth=4
"set noexpandtab
set expandtab

" tab
set showtabline=2
set splitbelow
set splitright

"***********
" search
"***********
set ignorecase
set hlsearch
set incsearch
set shortmess-=S

" filetype
filetype on
filetype indent on
filetype plugin on


hi LineNr cterm=bold ctermfg=Green ctermbg=NONE
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE

"set mouse=niv
set mouse=a

"**************
let mapleader = " "
"let mapleader = ","
"**************

"" GTAGS 
"set tags=tags
"set autochdir
"set cscopeprg=gtags-cscope
"cs add GTAGS


" set the runtime path to include Vundle and initialize
" rtp = runtime path
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'preservim/nerdtree'
Plugin 'preservim/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-startify' 
Plugin 'lfv89/vim-interestingwords'
" ************ vim highlight
"Plugin 'azabiong/vim-highlighter'

"******************
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" ******************

Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'easymotion/vim-easymotion'
"
"Plugin 'aceofall/gtags.vim'

" GTAGS
" 静态语法检查插件
Plugin 'w0rp/ale'

" " Vim自动生成 tags 插件 vim-gutentag
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'skywind3000/gutentags_plus'
Plugin 'skywind3000/vim-preview'


" vim colorscheme
Plugin 'joshdick/onedark.vim'
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'flazz/vim-colorschemes'


" vim airline
Plugin 'vim-airline/vim-airline'

" vim ack
Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"***************
" 删除当前文件中所有的行尾多余空格
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
"***************
" 用于快速编辑和重载vimrc配置文件
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
"***************
"使用前缀键和数字键快速切换缓冲区
nnoremap <leader>1 :1b<CR>
nnoremap <leader>2 :2b<CR>
nnoremap <leader>3 :3b<CR>


"**************
" hotkey
" 這邊是自訂快捷鍵，語法等等會講，這邊只說明用法
" 在命令模式按 <tab> 會把整行字向右移一個 tab。<S-tab> 會移回來
"**************
map <tab> :s/^/\t<CR>
map <S-tab> :s/^\t/<CR>

"  如果要從系統剪貼簿貼上多行程式碼，建議這樣用，才不會被 vim 的自動縮排雷到（你試試就知道是什麼問題，很討厭）
nmap <F3> :r! cat<CR>
" 切換行號，在複製到系統鍵貼簿時很好用，這樣就不會複製到行號
nmap <F7> :set invnumber<CR>
" 清除搜尋結果的語法突顯
nmap cs :noh<CR>

map <LEADER>z :bd<CR>
" alias
" 冒號命令的別名，語法等等會講
" 常用就知道為什麼要設這個（按冒號時要按 <shift>，然後下一個字就很常變大寫，簡稱手殘）
command W w
command Q q
command Wq wq
command WQ wq


"*********
" Plugin 'aceofall/gtags.vim'
"*********
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF='/opt/homebrew/etc/gtags.conf'
set cscopetag "set cscope as tags
set cscopeprg=gtags-cscope "set gtags-cscope as cscope
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
   let g:gutentags_modules += ['ctags']
   endif
   if executable('gtags-cscope') && executable('gtags')
       let g:gutentags_modules += ['gtags_cscope']
       endif

       " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
       let s:vim_tags = expand('~/.cache/tags')
       let g:gutentags_cache_dir = s:vim_tags

       " 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
       let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
       let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
       let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

       " 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags
       "不能加下一行
       let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

       " 禁用 gutentags 自动加载 gtags 数据库的行为
       let g:gutentags_auto_add_gtags_cscope = 0

       " 检测 ~/.cache/tags 不存在就新建
       if !isdirectory(s:vim_tags)
          silent! call mkdir(s:vim_tags, 'p')
          endif

          " 预览 quickfix 窗口 ctrl-w z 关闭
          " p 预览 大p关闭
          autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
          autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
"          " 往上滚动预览窗口
          noremap <Leader>u :PreviewScroll -1<cr>
"          " 往下滚动预览窗口
          noremap <leader>d :PreviewScroll +1<cr>


" vim colorschmem
colorscheme torte



