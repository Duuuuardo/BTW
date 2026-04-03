return {
	-- Messages, cmdline, and popupmenu
	{
		"folke/noice.nvim",
		opts = function(_, opts)
			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			})
			local focused = true
			vim.api.nvim_create_autocmd("FocusGained", {
				callback = function()
					focused = true
				end,
			})
			vim.api.nvim_create_autocmd("FocusLost", {
				callback = function()
					focused = false
				end,
			})
			table.insert(opts.routes, 1, {
				filter = {
					cond = function()
						return not focused
					end,
				},
				view = "notify_send",
				opts = { stop = false },
			})

			opts.commands = {
				all = {
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {},
				},
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function(event)
					vim.schedule(function()
						require("noice.text.markdown").keys(event.buf)
					end)
				end,
			})

			opts.presets.lsp_doc_border = true
		end,
	},

	-- Notifications
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 5000,
		},
	},

	-- Animations
	{
		"folke/snacks.nvim",
		opts = {
			scroll = { enabled = false },
		},
	},

	-- Bufferline
	{
		"akinsho/bufferline.nvim",
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		},
		opts = {
			options = {
				mode = "tabs",
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		},
	},

	-- Filename in top-right
	{
		"b0o/incline.nvim",
		dependencies = { "sainnhe/gruvbox-material" },
		event = "BufReadPre",
		priority = 1200,
		config = function()
			require("incline").setup({
				highlight = {
					groups = {
						InclineNormal = { guibg = "#45403d", guifg = "#d4be98" },
						InclineNormalNC = { guifg = "#7c6f64", guibg = "#32302f" },
					},
				},
				window = { margin = { vertical = 0, horizontal = 1 } },
				hide = {
					cursorline = true,
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if vim.bo[props.buf].modified then
						filename = "[+] " .. filename
					end

					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			})
		end,
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			local LazyVim = require("lazyvim.util")
			opts.sections.lualine_c[4] = {
				LazyVim.lualine.pretty_path({
					length = 0,
					relative = "cwd",
					modified_hl = "MatchParen",
					directory_hl = "",
					filename_hl = "Bold",
					modified_sign = "",
					readonly_icon = " 󰌾 ",
				}),
			}
		end,
	},

	-- Zen mode
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			plugins = {
				gitsigns = true,
				tmux = true,
				kitty = { enabled = false, font = "+2" },
			},
		},
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
	},

	-- Render markdown (disabled by default)
	{
		"MeanderingProgrammer/render-markdown.nvim",
		enabled = false,
	},

	-- Dashboard
	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				preset = {
					header = [[
 ____                                              _       
|  _ \ _   _ _   _ _   _ _   _  __ _ _ __ ___  __| | ___  
| | | | | | | | | | | | | | | |/ _` | '__/ _ \/ _` |/ _ \ 
| |_| | |_| | |_| | |_| | |_| | (_| | | | (_) | (_| | (_) |
|____/ \__,_|\__,_|\__,_|\__,_|\__,_|_|  \___/ \__,_|\___/ 
]],
				},
			},
		},
	},
}
