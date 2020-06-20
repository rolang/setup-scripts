packadd minpac

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
call minpac#add('preservim/nerdtree')

nnoremap <C-p> :<C-u>FZF<CR>
map <C-n> :NERDTreeToggle<CR>

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
set number
