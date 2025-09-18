return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = function()
			local formatters_by_ft = {
				lua = { "stylua" },
			}

			-- Add Python formatters only if Python is available
			if vim.fn.executable("python3") == 1 or vim.fn.executable("python") == 1 then
				formatters_by_ft.python = { "isort", "black" }
			end

			-- Add Rust formatter only if Rust is available
			if vim.fn.executable("rustc") == 1 then
				formatters_by_ft.rust = { "rustfmt" }
			end

			-- Add Elm formatter only if Elm is available
			if vim.fn.executable("elm") == 1 then
				formatters_by_ft.elm = { "elm_format" }
			end

			return {
				notify_on_error = false,
				format_on_save = function(bufnr)
					-- Disable "format_on_save lsp_fallback" for languages that don't
					-- have a well standardized coding style. You can add additional
					-- languages here or re-enable it for the disabled ones.
					local disable_filetypes = { c = true, cpp = true }
					return {
						timeout_ms = 500,
						lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
					}
				end,
				formatters_by_ft = formatters_by_ft,
			}
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
