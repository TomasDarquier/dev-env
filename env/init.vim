"set guicursor=
set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set signcolumn=no

call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'metalelf0/black-metal-theme-neovim'
Plug 'morhetz/gruvbox'

" Plugins esenciales de PYTHON
Plug 'neovim/nvim-lspconfig'  " Configuración de LSP
Plug 'hrsh7th/nvim-cmp'       " Plugin principal de autocompletado
Plug 'hrsh7th/cmp-nvim-lsp'   " Fuente de autocompletado para LSP
Plug 'hrsh7th/cmp-buffer'     " Fuente de autocompletado para el buffer
Plug 'hrsh7th/cmp-path'       " Fuente de autocompletado para rutas
Plug 'saadparwaiz1/cmp_luasnip'  " Fuente para autocompletado con Luasnip (si usas snippets)

" Harpoon (legacy version)
Plug 'nvim-lua/plenary.nvim' 
Plug 'ThePrimeagen/harpoon'

call plug#end()

colorscheme gruvbox

let mapleader = " "   
nnoremap <leader>n :nohls<CR>
nnoremap <leader>; :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>ff :Files<CR>

nnoremap <leader>p "_dP
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

"quick list things
nnoremap <C-k> :cnext<CR>
nnoremap <C-j> :cprev<CR>

" move lines respecting indentation
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" harpoon remaps
nnoremap <leader>ha :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hm :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <leader>hq :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>hw :lua require("harpoon.ui").nav_file(2)<CR>                 
nnoremap <leader>he :lua require("harpoon.ui").nav_file(3)<CR>             
nnoremap <leader>hr :lua require("harpoon.ui").nav_file(4)<CR>         
nnoremap <leader>ht :lua require("harpoon.ui").nav_file(4)<CR>     
        
nnoremap <leader>hn :lua require("harpoon.ui").nav_next()<CR>                  
nnoremap <leader>hp :lua require("harpoon.ui").nav_prev()<CR>                  

" Configuración de LSP para Python (usando pyright)
lua << EOF
require'lspconfig'.pyright.setup{}
EOF

" Configuración de nvim-cmp para autocompletado
lua << EOF
local cmp = require'cmp'

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },    -- Fuente de autocompletado del LSP
    { name = 'buffer' },      -- Fuente para el contenido del buffer
    { name = 'path' },        -- Fuente para las rutas
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),  -- Activar el autocompletado
    ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirmar la selección
  },
})
EOF
