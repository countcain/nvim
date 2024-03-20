local Util = require("lazyvim.util")

return {
  {
    "echasnovski/mini.bufremove",
    keys = {
      { -- it just extends the plugin's existing keymaps
        "<S-w>",
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete Buffer",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    -- if use a function here, it will override all default keys
    -- if use a object here, it will extend to the default keys
    keys = {
      { "<leader>fF", Util.telescope("files"), desc = "Find Files (root dir)" },
      { "<leader>ff", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      { "<leader>sG", Util.telescope("live_grep"), desc = "Grep (root dir)" },
      { "<leader>sg", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
    },
  },
  {
    "folke/flash.nvim",
    keys = {
      -- disable original s and S
      { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "x", "o" }, false },
      {
        "q",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "Q",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },
  {
    "folke/noice.nvim",
    keys = {
      -- disable scroll forward and backward
      { "<c-f>", mode = { "n", "i", "s" }, false },
      { "<c-b>", mode = { "n", "i", "s" }, false },
    },
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change code action keymap
      keys[#keys + 1] =
        { "<c-a>", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
      -- disable original keymap
      keys[#keys + 1] = { "<leader>ca", false }

      keys[#keys + 1] = { "<c-i>", vim.lsp.buf.hover, desc = "Hover" }
      keys[#keys + 1] = { "K", false }
    end,
  },
}
