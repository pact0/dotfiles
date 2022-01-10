local config = {}

function config.telescope_preload()
  if not packer_plugins["plenary.nvim"].loaded then
    require"packer".loader("plenary.nvim")
  end
  -- if not packer_plugins["telescope-fzy-native.nvim"].loaded then
  --   require"packer".loader("telescope-fzy-native.nvim")
  -- end
end

function config.telescope()
  require("modules.telescope.telescope").setup()
end

function config.project()
    require("project_nvim").setup {
      datapath = vim.fn.stdpath("data"),
      ignore_lsp = {'efm'},
      exclude_dirs = {"~/.cargo/*"},
      silent_chdir = false
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
    require 'modules.telescope.telescope'
    require('telescope').load_extension('projects')

end

return config
