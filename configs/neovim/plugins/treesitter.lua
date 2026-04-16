return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"astro",
				"cmake",
				"cpp",
				"css",
				"fish",
				"gitignore",
				"go",
				"graphql",
				"html",
				"http",
				"java",
				"javascript",
				"kotlin",
				"php",
				"ruby",
				"rust",
				"scss",
				"sql",
				"svelte",
				"tsx",
				"typescript",
			},
			query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite", "CursorHold" },
			},
		},
		init = function()
			-- MDX: register markdown parser for mdx files
			vim.treesitter.language.register("markdown", "mdx")
		end,
	},
}
