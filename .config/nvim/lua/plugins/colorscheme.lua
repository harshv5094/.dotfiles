return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = function(_, opts)
      opts.style = "moon"
      opts.styles = {
        comments = { italic = true },
        keywords = { italic = true },
      }
      opts.lualine_bold = true
    end,
  },
}
