local icons = require("lazyvim.config").icons
local Util = require("lazyvim.util")

return {
  {
    "folke/tokyonight.nvim",
    opts = { style = "storm" },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_c = {
          Util.lualine.root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          {
            function(self)
              local opts = vim.tbl_extend("force", {
                relative = "cwd",
                modified_hl = "MatchParen",
                directory_hl = "",
                filename_hl = "Bold",
                modified_sign = "",
              }, {})
              local path = vim.fn.expand("%:p") --[[@as string]]

              if path == "" then
                return ""
              end

              local root = Util.root.get({ normalize = true })
              local cwd = Util.root.cwd()

              if opts.relative == "cwd" and path:find(cwd, 1, true) == 1 then
                path = path:sub(#cwd + 2)
              else
                path = path:sub(#root + 2)
              end

              local sep = package.config:sub(1, 1)
              local parts = vim.split(path, "[\\/]")

              if #parts > 10 then
                parts = {
                  parts[1],
                  parts[2],
                  parts[3],
                  parts[4],
                  parts[5],
                  parts[6],
                  parts[7],
                  parts[8],
                  "…",
                  parts[#parts - 1],
                  parts[#parts],
                }
              end

              if opts.modified_hl and vim.bo.modified then
                parts[#parts] = parts[#parts] .. opts.modified_sign
                parts[#parts] = Util.lualine.format(self, parts[#parts], opts.modified_hl)
              else
                parts[#parts] = Util.lualine.format(self, parts[#parts], opts.filename_hl)
              end

              local dir = ""
              if #parts > 1 then
                dir = table.concat({ unpack(parts, 1, #parts - 1) }, sep)
                dir = Util.lualine.format(self, dir .. sep, opts.directory_hl)
              end
              return dir .. parts[#parts]
            end,
          },
        },
      },
    },
  },
}
