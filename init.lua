-- MisEnPlace

-- vim.loader.enable
require('misenplacecolors').load()

-- See (#1), there is no good readme. TODO(jordans1882)>

-- ls

-- Bootstrap Lazy
require 'lazybootstrap'

-- pre-plugin requires
-- g = require('global-vars')
--- - local ju = require('jutils')
utils = require 'utilities'
require 'vimopt'

-- require('plugin-free-commands')
-- require('global-vars')
-- Setup plugins using lazy
require('lazy').setup 'plugins'
require 'newtheme'

-- post-plugin requires
-- require 'lsp'
require 'mappings'
require 'commands'

-- local colors = require 'misenplacecolors.colors'

vim.fn.sign_define('DiagnosticHint', { text = 'h', fg = '#fedb00', bg = '#3e3333' })

local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match 'warning: multiple different client offset_encodings' then
    return
  end

  notify(msg, ...)
end

local scratchpad = require 'scratchpad'

vim.api.nvim_create_user_command('SayHello', function()
  scratchpad.print_message()
end, {
  desc = 'Say Hello from scratchpad',
})

vim.api.nvim_create_user_command('PopupHello', function()
  scratchpad.popup_hello()
  -- scratchpad.print_message()
end, {
  desc = 'Crete Hello Popup from scratchpad',
})

vim.api.nvim_create_user_command('GetDocumentation', function()
  scratchpad.get_documentation()
  -- scratchpad.print_message()
end, {
  desc = 'Gets the documentation and prints it',
})

vim.api.nvim_set_keymap(
  'n',
  '<leader>gd',
  '<cmd>lua require("scratchpad").get_documentation()<CR>',
  { noremap = true, silent = true }
)

require 'playground'

vim.api.nvim_create_user_command('SwapRight', function()
  require('utilities').swap_window_right()
end, {
  desc = 'Swap to the right',
})

vim.api.nvim_create_user_command('SwapLeft', function()
  require('utilities').swap_window_left()
end, {
  desc = 'Swap to the left',
})

vim.api.nvim_create_user_command('SwapUp', function()
  require('utilities').swap_window_up()
end, {
  desc = 'Swap up',
})

vim.api.nvim_create_user_command('SwapDown', function()
  require('utilities').swap_window_down()
end, {
  desc = 'Swap down',
})

vim.api.nvim_create_user_command('SlimeSendMakeRun', function()
  require('utilities').slime_send_make_run()
end, {
  desc = 'Send make run to slime terminal',
})

-- vim.cmd([[colorscheme base16-3024]])
-- vim.cmd([[colorscheme base16-ia-light]])

-- vim.api.nvim_command 'sleep 100m'
-- vim.api.nvim_command 'messages clear'
-- vim.api.nvim_command '!clear'

vim.api.nvim_command 'colorscheme base16-selenized-black'

local m = require('mapx').setup { global = 'force', whichkey = true }
m.nmap('<Space>wh', ':SwapLeft<CR>', 'Swap left')
m.nmap('<Space>wl', ':SwapRight<CR>', 'Swap right')
m.nmap('<Space>wj', ':SwapDown<CR>', 'Swap down')
m.nmap('<Space>wk', ':SwapUp<CR>', 'Swap up')

-- Initialize light/dark mode
-- require('utilities').init_ldmode()

-- require('utilities').get_ldmode()[1]

if require('utilities').get_ldmode()[1] == 'dark' then
  vim.cmd [[colorscheme base16-selenized-black]]
else
  vim.cmd [[colorscheme base16-selenized-light]]
end

-- {{{ clangd config
require('lspconfig').clangd.setup {
  cmd = { 'clangd', '--enable-config' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' }, -- , 'proto'
  root_dir = require('lspconfig').util.root_pattern(
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac',
    '.git'
  ),
  single_file_support = true,
}
-- }}}

require 'project_term'

-- print(vim.fn.stdpath('data'))
