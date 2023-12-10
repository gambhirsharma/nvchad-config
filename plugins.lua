-- In order to modify the `lspconfig` configuration:

-- local conf = require "custom.plugins.config"
local plugins = {
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.formatter"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end,
  },
  -- Mason installation
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
        "lua-language-server",
        -- "html-lsp",
        "prettier",
        "stylua",
        -- "tailwindcss",
        "rust-analyzer",
        "emmet-language-server",
        "astro-language-server",
        "elixir-ls",
      },
    },
  },
  -- nvim-lsp
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
  -- auto tag close
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      require("custom.configs.autotag")
    end,
  },
--


  -- ##############################################
  -- ## Productive applications
  -- Discord status
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.presence"
    end,
  },
  -- Coding Time check
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
  },
  -- tabnine installation
  -- {
  --  "tzachar/cmp-tabnine",
  --   event = "VeryLazy",
  --   after = "nvim-cmp",
  --   run = "./install.ps1",
  --   -- config = conf.tabine,
  -- },
  {
    'gelguy/wilder.nvim',
     event = "VeryLazy",
    config = function ()
     require "custom.configs.wilder"
    end
  },
}

return plugins
