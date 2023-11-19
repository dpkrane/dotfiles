local config = function()
	require("nvim-treesitter.configs").setup({
		run = ":TSUpdate",
		indent = {
			enable = true,
		},
		ensure_installed = {
			"yaml",
			"bash",
			"dockerfile",
			"python",
      "terraform",
		},
		auto_install = true,
		highlight = {
			enable = true,
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = config,
}
