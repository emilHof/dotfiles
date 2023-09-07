require('peek').setup({
	auto_load = false,    -- whether to automatically load preview when
	-- entering another markdown buffer
	close_on_bdelete = true, -- close preview window on buffer delete

	update_on_change = true,
})

vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
