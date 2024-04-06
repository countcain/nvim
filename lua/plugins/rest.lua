return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup({
        keybinds = {
          {
            "<leader>rr",
            "<cmd>Rest run<cr>",
            "http rest: run request under the cursor",
          },
          {
            "<leader>rl",
            "<cmd>Rest run last<cr>",
            "http rest: re-run last request",
          },
          {
            "<leader>rt",
            "<cmd>Telescope rest select_env<cr>",
            "http rest: select env file",
          },
        },
        result = {
          keybinds = {
            buffer_local = true,
          },
        },
      })
    end,
  },
}
