return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
      transparent = true, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        -- comments = { italic = true },
        -- functions = {},
        -- variables = {}
        -- Background styles. Can be "dark", "transparent" or "normal"
        -- sidebars = "dark", -- style for sidebars, see below
        -- floats = "dark", -- style for floating windows
      },
      sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      dim_inactive = false, -- dims inactive windows
      lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

      --- webparam colors ColorScheme
      on_colors = function(colors) end,

      --- You can override specific highlights to use other groups or a hex color
      --- function will be called with a Highlights and ColorScheme table

      ---@param highlights Highlights
      ---@param colors ColorScheme
      on_highlights = function(highlights, colors)
        highlights["LineNrAbove"] = {
          fg = "#33a3dc",
        }
        highlights["LineNrBelow"] = {
          fg = "#fcf16e",
        }

        highlights["@lsp.type.variable"] = {
          fg = "#afdfe4",
        }
        highlights["@variable"] = {
          fg = "#afdfe4",
        }
        highlights["@preproc"] = {
          fg = "#fdb933",
        }

        highlights["@lsp.type.function"] = {
          fg = "#da70d6",
        }
        highlights["@lsp.type.macro"] = {
          fg = "#9370db",
        }
        highlights.Comment = {
          fg = "#007947",
        }
        highlights["@lsp.type.comment"] = {
          fg = "#007947",
        }
        highlights["@string.documentation"] = {
          fg = "#1d953f",
        }
        highlights["@define"] = {
          fg = "#00ae9d",
        }
        highlights["@include"] = {
          fg = "#00ae9d",
        }
        highlights["@exception"] = {
          fg = "#1e90ff",
        }
        highlights["@namespace"] = {
          fg = "#ff00ff",
        }
        highlights["@lsp.type.namespace"] = {
          link = "@namespace",
        }
        highlights["@lsp.type.class"] = {
          fg = "#FF4500",
        }
        highlights["@type.qualifier"] = {
          fg = "#00bfff",
        }
        highlights["@lsp.type.operator"] = {
          fg = "#f8aba6",
        }
        highlights["@keyword.operator"] = {
          fg = "#f8aba6",
        }
        highlights["@type.builtin"] = {
          fg = "#33a3dc",
        }
        highlights["@lsp.type.property"] = {
          fg = "#00ffff",
        }
        highlights["@lsp.type.method"] = {
          fg = "#ff8c00",
        }
        highlights["@storageclass"] = {
          fg = "#4169e1",
        }
        highlights["@lsp.type.namespace.go"] = {
          fg = "#00ae9d",
        }
        highlights["@parameter.builtin"] = {
          fg = "#ffe600",
        }
        highlights["@lsp.type.decorator.rust"] = {
          fg = "#fcaf17",
        }
        highlights["@lsp.type.typeparameter"] = {
          fg = "#d71345",
          style = {
            bold = true,
          },
        }
        highlights["@lsp.type.parameter"] = {
          fg = "#ffe600",
        }
        highlights["@parameter"] = {
          fg = "#ffe600",
        }
        highlights["@conditional"] = {
          fg = "#ff1493",
        }
        highlights["@repeat"] = {
          fg = "#ef5b9c",
        }
        highlights["@Constant"] = {
          fg = "#f2eada",
        }
        highlights["@lsp.type.macro.cuda"] = {
          fg = "#ed1941",
        }
        highlights["@Type"] = {
          fg = "#f4a460",
        }
        highlights["@lsp.type.type.go"] = {
          fg = "#33a3dc",
        }
        highlights["@lsp.typemod.type.defaultLibrary"] = {
          fg = "#F08080",
        }
        highlights["@lsp.typemod.class.defaultLibrary"] = {
          fg = "#ffce7b",
        }
        highlights["@lsp.typemod.function.defaultLibrary"] = {
          fg = "#f3715c",
        }
        highlights["@number"] = {
          fg = "#fafad2",
        }
        highlights.CursorLineNr = {
          bg = "#ef5b9c",
          fg = "#fffef9",
        }
        highlights.Folded = {
          bg = "#8552a1",
          fg = "#fcf16e",
        }
        highlights["@keyword"] = {
          fg = "#FF99CC",
          style = {
            italic = false,
          },
        }
        highlights["@keyword.function.python"] = {
          fg = "#009ad6",
        }
        highlights.Keyword = {
          fg = "#FF99CC",

          style = {
            italic = false,
          },
        }
        highlights["@constructor"] = {
          fg = "#FF6666",

          style = {
            italic = false,
          },
        }
        highlights.WinSeparator = {
          bold = true,
          fg = "#ffd400",
        }

        -- Illuminate
        highlights.illuminatedWord = {

          bg = "#fcf16e",
          fg = "#8552a1",
        }

        highlights.IlluminatedWordText = {
          fg = "#8552a1",
          bg = "#fcf16e",
        }
        highlights.IlluminatedWordRead = {
          fg = "#8552a1",
          bg = "#fcf16e",
        }
        highlights.IlluminatedWordWrite = {
          fg = "#8552a1",
          bg = "#fcf16e",
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = { "tokyonight" },
    },
  },
}
