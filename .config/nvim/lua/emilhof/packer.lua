vim.cmd("packadd packer.nvim")
vim.keymap.set("n", "<leader>ps", vim.cmd.PackerSync)

return require("packer").startup(function(use)
	-- Packer can manage itself
	use "wbthomason/packer.nvim"

	use {
		"nvim-telescope/telescope.nvim", tag = "0.1.2",
		-- or                            , branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } }
	}

	use "ellisonleao/gruvbox.nvim"

	use {
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	}

	use {
		"nvim-treesitter/playground",
		run = "TSInstall query",
	}

	use "mbbill/undotree"

	use({
		"kdheepak/lazygit.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	})

	use {
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{       -- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		}
	}

	use {
		"https://git.sr.ht/~nedia/auto-format.nvim",
	}

	use {
		"f-person/git-blame.nvim",
	}

	use {
		"nvim-neorg/neorg",
		run = ":Neorg sync-parsers",
		requires = "nvim-lua/plenary.nvim",
	}

	use "alvan/vim-closetag"

	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	use {
		"notjedi/nvim-rooter.lua",
		config = function() require "nvim-rooter".setup() end
	}

	use {
		"voldikss/vim-floaterm",
		config = function()
			vim.cmd("hi FloatermBorder guifg=orange")
			vim.keymap.set(
				"n",
				"t",
				":FloatermToggle --name=term --height .85 --width .85 <CR>",
				{ silent = true }
			)
			vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>", { silent = true })
		end

	}

	use "emilHof/poetry-vim"
end)
