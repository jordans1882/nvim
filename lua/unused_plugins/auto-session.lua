return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup {
      auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      log_level = 'info', -- log_level = "error",
      auto_session_enable_last_session = false,
      auto_session_root_dir = vim.fn.stdpath 'data' .. '/sessions/',
      auto_session_enabled = false,
      auto_save_enabled = true,
      auto_restore_enabled = false,
      auto_session_use_git_branch = nil,
      -- the configs below are lua only
      bypass_session_save_file_types = nil,
    }
  end,
}
