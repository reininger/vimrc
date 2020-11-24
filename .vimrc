"tab setings
set tabstop=2
set shiftwidth=2
"set noexpandtab
set autoindent
set smartindent

"display settings
set number "show line numbers
set textwidth=79
set wrap
set linebreak

set textwidth=79 fo+=t

"searching
set hlsearch
set smartcase
set spelllang=en_us

"easier escape
inoremap jj <ESC><CR>

"idk what this is for, ctags I think
set nocompatible

"colorscheme
colors elflord

"automatically save buffer
"set autowriteall

"word prcessing function
func! WordProcessor()
	"movement changes
	map j gj
	map k gk
	"formatting text
	setlocal formatoptions=1
	setlocal noexpandtab
	setlocal wrap
	setlocal linebreak
endfu
com! WP call WordProcessor()

"allow copy paste to windows clip board if clip.exe command exists
"ie only remaps keys on a wsl system
func! GetSelectedText()
	normal gv"xy
	let result = getreg("x")
	return result
endfunc
"keybindings
if !has("clipboard") && executable("clip.exe")
	noremap <C-C> :call system('clip.exe', GetSelectedText())<CR>
	noremap <C-X> :call system('clip.exe', GetSelectedText())<CR>gvx
endif

"copy entire file to clipboard
if !has("clipboard") && executable("clip.exe")
	noremap <C-A> :w !clip.exe<CR><CR>
endif
