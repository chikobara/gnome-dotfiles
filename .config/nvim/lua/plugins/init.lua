return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require("configs.conform"),
  },
  { "wakatime/vim-wakatime", lazy = false },
  -- {
  -- 	"nvimdev/dashboard-nvim",
  -- 	event = "VimEnter",
  -- 	config = function()
  -- 		require("dashboard").setup({
  -- 			-- config
  -- 		})
  -- 	end,
  -- 	dependencies = { { "nvim-tree/nvim-web-devicons" } },
  -- },
  {
    "https://git.sr.ht/~nedia/auto-format.nvim",
    event = "BufWinEnter",
    config = function()
      require("auto-format").setup()
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "vyfor/cord.nvim",
    build = "./build || .\\build",
    event = "VeryLazy",
    opts = {}, -- calls require('cord').setup()
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },
  -- {
  -- 	"neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
  -- 	lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
  -- 	dependencies = {
  -- 		-- main one
  -- 		{ "ms-jpq/coq_nvim", branch = "coq" },
  --
  -- 		-- 9000+ Snippets
  -- 		{ "ms-jpq/coq.artifacts", branch = "artifacts" },
  --
  -- 		-- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
  -- 		-- Need to **configure separately**
  -- 		{ "ms-jpq/coq.thirdparty", branch = "3p" },
  -- 		-- - shell repl
  -- 		-- - nvim lua api
  -- 		-- - scientific calculator
  -- 		-- - comment banner
  -- 		-- - etc
  -- 	},
  -- 	init = function()
  -- 		vim.g.coq_settings = {
  -- 			auto_start = true, -- if you want to start COQ at startup
  -- 			-- Your COQ settings here
  -- 		}
  -- 	end,
  -- 	config = function()
  -- 		-- Your LSP settings here
  -- 	end,
  -- },
}
