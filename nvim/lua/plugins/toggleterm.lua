return {
  "akinsho/toggleterm.nvim",
  lazy = false,
  version = "*",
  opts = {
    --[[ things you want to change go here]]
    open_mapping = [[<c-`>]],
    size = 20,
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
      border = "Normal",
      background = "Normal",
      },
    }
    }
}
