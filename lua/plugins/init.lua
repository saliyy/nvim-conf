return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- Uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "dinhhuy258/git.nvim",
    lazy = false,
    opts = {}
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  
  { "nvim-neotest/nvim-nio" }, 
  {"ewilazarus/preto"},
  
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {}
  },
    {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    opts = {}
  },
 {
    "sindrets/diffview.nvim",
    lazy = false,
    opts = {}
  },
  {
    "williamboman/mason.nvim",
    opts = {
      "lua-language-server",
      "stylua",
      "prettier",
      "gopls",
    }
  },
  
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc", "php",
        "html", "css", "javascript", "typescript", "go"
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require('dap')
      
      -- Конфигурация адаптера для Go
      dap.adapters.go = {
        type = 'server',
        port = 38697, -- Должен совпадать с тем, что вы используете в конфигурациях
        executable = {
          command = 'dlv',
          args = { 'dap', '-l', '127.0.0.1:38697' },
        }
      }

      -- Конфигурация отладки Go
      dap.configurations.go = {
        {
            type = 'go',
            name = 'Launch',
            request = 'launch',
            mode = 'test',
            program = '${workspaceFolder}',
            env = {
               DELIVERY_API_CONF = '/Users/vladislav.saly/work/services/delivery-api/deployments/local.dev.env'
            },
        },
      }
  end
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()

      -- Динамическое открытие и закрытие DAP UI в зависимости от событий
      require('dap').listeners.after.event_initialized["dapui_config"] = function()
        require("dapui").open()
      end

      require('dap').listeners.before.event_terminated["dapui_config"] = function()
        require("dapui").close()
      end

      require('dap').listeners.before.event_exited["dapui_config"] = function()
        require("dapui").close()
      end
    end,
  },
   {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "configs.null-ls"
    end,
  },
}
