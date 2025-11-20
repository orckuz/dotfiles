-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}


	use {'ellisonleao/gruvbox.nvim'} 
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use {'nvim-lua/plenary.nvim'} 
	use {'ThePrimeagen/harpoon'}
	use {'mbbill/undotree'}

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-nvim-lsp'},				   {'hrsh7th/cmp-nvim-lua'},
			{'saadparwaiz1/cmp_luasnip'},  	
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'}
		}
}
end)
