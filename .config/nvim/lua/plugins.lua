vim.cmd [[packadd packer.nvim]]

require 'configs'

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    --use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'
    use 'goolord/alpha-nvim'
    use 'folke/which-key.nvim'
    use 'nvim-neo-tree/neo-tree.nvim'
    use 'MunifTanjim/nui.nvim'


    use 'akinsho/bufferline.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'akinsho/toggleterm.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'folke/trouble.nvim'
    use 'rcarriga/nvim-notify'
    use 'rmagatti/goto-preview'

    use 'lewis6991/gitsigns.nvim'
    use 'windwp/nvim-autopairs'

    use 'onsails/lspkind-nvim'
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use 'nvim-treesitter/nvim-treesitter'

    use 'rust-lang/rust.vim'
    use 'preservim/nerdcommenter'

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'

    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    use 'norcalli/nvim-colorizer.lua'
    --use 'RRethy/vim-illuminate'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'RRethy/nvim-base16'

    use 'nvim-lua/plenary.nvim'
end)
