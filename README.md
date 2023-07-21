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

https://hanleylee.com/articles/tracing-code-in-vim/


https://learnku.com/articles/28249

https://zhuanlan.zhihu.com/p/38477934

https://descent-incoming.blogspot.com/2016/08/globalgtags-with-vim.html


https://medium.com/heynote/use-gtags-gnu-global-with-vim-replace-ctags-and-cscope-15ae03f272e3
aceofall/gtags.vim

https://github.com/tranngocthachs/gtags-cscope-vim-plugin


vim tab

https://blog.csdn.net/weixin_43274923/article/details/122301433
