require('neorg').setup {
	load = {
		["core.defaults"] = {}, -- Loads default behaviour
		["core.concealer"] = {}, -- Adds pretty icons to your documents
		["core.dirman"] = { -- Manages Neorg workspaces
			config = {
				workspaces = {
					notes = "~/neorg/notes",
					todo = "~/neorg/todo",
				},
			},
		},
	},
}

vim.keymap.set("n", "<leader>nc", ":Neorg toggle-concealer<CR>", { silent = true })
vim.keymap.set("n", "<leader>do", ":Neorg workspace todo<CR>", { silent = true })
