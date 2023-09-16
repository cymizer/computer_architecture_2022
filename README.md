# computer_architecture_2022

--------------------------
"gtags 設置項
set cscopetag " 使用 cscope 作爲 tags 命令

set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope


let GtagsCscope_Auto_Load = 1

let CtagsCscope_Auto_Map = 1

let GtagsCscope_Quiet = 1

let gtags_file=findfile("GTAGS", ";") "查找 gtags 文件

if !empty(gtags_file)

    exe "cs add" gtags_file

endif

-------------------------------------

vim技巧 使用GNU Gloabl gtags 极简配置攻略
* https://blog.csdn.net/a827143452/article/details/85927752

Vim 之代码跟踪 gtags.files使用【转】
* https://www.cnblogs.com/sky-heaven/p/15903745.html

Vim Note
* https://miaopei.github.io/2020/09/20/Vim/VimNote/

https://hanleylee.com/articles/tracing-code-in-vim/


https://learnku.com/articles/28249

https://zhuanlan.zhihu.com/p/38477934

https://descent-incoming.blogspot.com/2016/08/globalgtags-with-vim.html


https://medium.com/heynote/use-gtags-gnu-global-with-vim-replace-ctags-and-cscope-15ae03f272e3
aceofall/gtags.vim

https://github.com/tranngocthachs/gtags-cscope-vim-plugin


vim tab

https://blog.csdn.net/weixin_43274923/article/details/122301433

-------------------------

highlight search color change
* https://stackoverflow.com/questions/7103173/vim-how-to-change-the-highlight-color-for-search-hits-and-quickfix-selection

```
hi LineNr cterm=bold ctermfg=Green ctermbg=NONE
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE

"hi Search cterm=NONE ctermfg=grey ctermbg=blue
hi Search ctermbg=LightYellow  ctermfg=DarkRed
```

-------------------------------------
vim-airline
```
let g:airline#extensions#tabline#enabled = 1

"let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#left_sep = '|'
let g:airline#extensions#tabline#left_alt_sep = '||'
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline_theme= 'light'
```

----------------------------------
add
```
"nnoremap <LEADER>bn :bn<CR>
"nnoremap <LEADER>bp :bp<CR>

""僅保留目前的視窗
"nnoremap only :only<CR>
""CTRL-W c   命令也可以退出当前窗口
"":close 命令跟 CTRL-W c 效果相同。
""
""將目前分割的視窗重新平均分配大小:
"
""Ctrl-w =

"Gtags search mode
"https://learnku.com/articles/28249

nnoremap <F5> :mksession! ~/.vim/sessions/vim_manual_session.vim <CR>
nnoremap <F6> :source ~/.vim/sessions/vim_manual_session.vim <CR>

" auto script
autocmd VimLeave * mksession! ~/.vim/sessions/vim_auto_session.vim
"autocmd VimEnter * source ~/.vim/sessions/.vim_auto_session.vim
nnoremap <F4> :source ~/.vim/sessions/vim_manual_session.vim <CR>

```
----------------------------------------
intereseting word 
```
let g:interestingWordsGUIColors = ['#FE8A96', '#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF', '#23E8E5', '#4D5BF7', '#F5EF7D', '#F7A531', '#D622F2', '#C6F0C0', '#7a9c72', '#f5aa0a', '#d193fa', '#a1a608', '#9505f5', '#f5f105']
```


-------------------------------------------
riscv mret 

https://ithelp.ithome.com.tw/articles/10268967

-----------------------------------------
bufexplorer  setting

""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDisableDefaultKeyMapping=1 "Disable Default
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.

nnoremap <silent> <F10> :BufExplorerVerticalSplit<CR>
autocmd BufWinEnter \[Buf\ List\] setl nonumber 

