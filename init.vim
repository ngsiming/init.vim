let g:deoplete#enable_at_startup = 1

call plug#begin('~/.local/share/nvim/plugged')
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-jedi'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
"Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
"Plug 'neomake/neomake'
Plug 'terryma/vim-multiple-cursors'
"代码折叠
"Plug 'tmhedberg/SimpylFold'
"Plug 'neoclide/coc.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"suojing
Plug 'Yggdroot/indentLine'
call plug#end()

colorscheme gruvbox
set background=dark
highlight Normal guibg=NONE ctermbg=None

let g:coc_global_extensions = ['coc-json', 'coc-vimlsp']

" from coc.nvim
set hidden
set updatetime=100
set shortmess+=c

" Use <c-space> to trigger completion.
" I turn it to <c-o>
if has('nvim')
	inoremap <silent><expr> <c-o> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

"在Hover调出之后使用
" Ctrl + f 文档翻页, 光标仍在原来文件
nnoremap <expr><C-f> coc#float#has_float() ? coc#float#scroll(1) : "\<C-f>"
"在Hover调出之后使用
" Ctrl + k 光标进入悬浮窗口, 此时hjkl可在文档内移动,在此使用该快捷键跳出
nnoremap <expr><C-k> coc#float#has_float() ? coc#float#scroll(0) : "\<C-k>"


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

"indentLine
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进
