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
				"http",
				"java",
				"php",
				"rust",
				"scss",
				"sql",
				"svelte",
			},
			query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite", "CursorHold" },
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)

			-- MDX
			vim.filetype.add({
				extension = {
					mdx = "mdx",
				},
			})
			vim.treesitter.language.register("markdown", "mdx")
		end,
	},
}
