local opts = {
	ensure_installed = {
   "ansiblels",
   "bashls",
   "helm_ls",
    "terraformls",
    "dockerls",
    "docker_compose_language_service",
    "yamlls",
    "pylsp",
	},

	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
