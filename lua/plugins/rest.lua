return {
  {
    "rest-nvim/rest.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "http")
        vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<cr>", { desc = "http rest: run request under the cursor" })
        vim.keymap.set("n", "<leader>rl", "<cmd>Rest run last<cr>", { desc = "http rest: re-run last request" })
        vim.keymap.set("n", "<leader>rt", "<cmd>Rest env select<cr>", { desc = "http rest: select env file" })
      end,
    },
  },
}
