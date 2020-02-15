packadd minpac

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-scriptease', {'type': 'opt'})

nnoremap <C-p> :<C-u>FZF<CR>

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
set number
