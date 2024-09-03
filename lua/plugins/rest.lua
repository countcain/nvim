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
        env = {
          pattern = "%.env$",
        },
      })
      vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<cr>", { desc = "http rest: run request under the cursor" })
      vim.keymap.set("n", "<leader>rl", "<cmd>Rest run last<cr>", { desc = "http rest: re-run last request" })
      vim.keymap.set("n", "<leader>rt", "<cmd>Rest env select<cr>", { desc = "http rest: select env file" })
    end,
  },
}
