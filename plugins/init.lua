return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim", "nvim-nio", "nui.nvim", "plenary.nvim" },
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.ui.calendar"] = {},
          ["core.journal"] = {},
          ["core.keybinds"] = {
            config = { neorg_leader = "\\" },
          },
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
  },
  {
    "apple/pkl-neovim",
    lazy = true,
    event = "BufReadPre *.pkl",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    build = function() vim.cmd "TSInstall! pkl" end,
  },
  {
    "otavioschwanck/arrow.nvim",
    lazy = false,
    opts = {
      show_icons = true,
      leader_key = ";",
    },
  },
  {
    "Wansmer/treesj",
    keys = {
      { "<space>m", desc = "Split or Join code block" },
      { "J", desc = "Join code block" },
      { "<space>s", desc = "Split code block" },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup {--[[ your config ]]
      }
    end,
  },
  -- { "epwalsh/obsidian.nvim",
  --   version = "*", -- recommended, use latest release instead of latest commit
  --   lazy = true,
  --   ft = "markdown",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   opts = {
  --     workspaces = {
  --       {
  --         name = "para",
  --         path = "~/vaults/PARA",
  --       },
  --       {
  --         name = "personal",
  --         path = "~/vaults/personal",
  --       },
  --       {
  --         name = "work",
  --         path = "~/vaults/work",
  --       },
  --     },
  --     mappings = {
  --       ["gf"] = {
  --         action = function() return require("obsidian").util.gf_passthrough() end,
  --         opts = { noremap = false, expr = true, buffer = true },
  --       }, -- Toggle check-boxes.
  --       ["<leader>,"] = {
  --         action = function() return require("obsidian").util.toggle_checkbox() end,
  --         opts = { buffer = true },
  --       },
  --     },
  --   },
  -- },
  {
    "mrcjkb/rustaceanvim",
    version = "^3", -- Recommended
    ft = { "rust" },
  },
  { "ggandor/leap.nvim", lazy = false },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function(plugin, opts)
      -- include the default astronvim config that calls the setup call
      require "plugins.configs.luasnip"(plugin, opts)
      -- load snippets paths
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = { "~/.config/nvim/lua/user/snippets" },
      }
    end,
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
    branch = "master",
    config = function()
      vim.g.VM_Mono_hl = "DiffText"
      vim.g.VM_Extend_hl = "DiffAdd"
      vim.g.VM_Cursor_hl = "Visual"
      vim.g.VM_Insert_hl = "DiffChange"
    end,
  },
}
