return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#18130b',
				base01 = '#18130b',
				base02 = '#9d9890',
				base03 = '#9d9890',
				base04 = '#fff8ee',
				base05 = '#fffcf8',
				base06 = '#fffcf8',
				base07 = '#fffcf8',
				base08 = '#ff9d96',
				base09 = '#ff9d96',
				base0A = '#ffce88',
				base0B = '#acff9d',
				base0C = '#ffe5c0',
				base0D = '#ffce88',
				base0E = '#ffd79d',
				base0F = '#ffd79d',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#9d9890',
				fg = '#fffcf8',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#ffce88',
				fg = '#18130b',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#9d9890' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ffe5c0', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#ffd79d',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#ffce88',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#ffce88',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#ffe5c0',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#acff9d',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#fff8ee' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#fff8ee' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#9d9890',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
