return {
  "lukas-reineke/indent-blankline.nvim",
  -- TODO: drere
  -- FIX: erer
  main = "ibl",
	lazy = false,
	opts = function(_, opts)
		-- Other blankline configuration here
		return require("indent-rainbowline").make_opts(opts)
	end,
	dependencies = {
		"TheGLander/indent-rainbowline.nvim",
	},
}
