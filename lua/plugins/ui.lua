return {
  -- show keybinding help window
  { "folke/which-key.nvim" },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end,
  },
}
