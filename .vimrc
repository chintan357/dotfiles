"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath=&runtimepath


"----------------------------
"---------------------------


" nnoremap <leader>g :Ack
" To go to the next search result do: <leader>n
" To go to the previous search results do: <leader>p
" nnoremap <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
" map <leader>cc :botright cope<cr>

au FocusGained, BufEnter * silent! checktime

nnoremap <leader>pp :setlocal paste!<cr>



" nmap <leader>1 :.!toilet -w 200 -f term -F border<CR0
" nmap <leader>2 :.!toilet -w 200 -f standard<CR0


"vnoremap ,a :w! ~/test.py<CR>
"nnoremap ,T :map ,t :!


"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"set magic






"setglobal tags-=./tags;,tags

"ble extended % matchingset sessionoptions-=options
