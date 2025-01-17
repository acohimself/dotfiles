vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.jinja.*",
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_option(buf, "filetype", "jinja")
	end,
})
