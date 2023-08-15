-- https://github.com/folke/lazy.nvim

return {
  'j-hui/fidget.nvim',
  tag = 'legacy',
  config = function()
    -- require('fidget').setup {
    --   text = {
    --     spinner = 'pipe', -- animation shown when tasks are ongoing
    --     done = '✔', -- character shown when all tasks are complete
    --     commenced = 'Started', -- message shown when task starts
    --     completed = 'Completed', -- message shown when task completes
    --   },
    --   align = {
    --     bottom = true, -- align fidgets along bottom edge of buffer
    --     right = true, -- align fidgets along right edge of buffer
    --   },
    --   timer = {
    --     spinner_rate = 325, -- frame rate of spinner animation, in ms
    --     fidget_decay = 200, -- how long to keep around empty fidget, in ms
    --     task_decay = 100, -- how long to keep around completed task, in ms
    --   },
    --   window = {
    --     relative = 'win', -- where to anchor, either "win" or "editor"
    --     blend = 100, -- &winblend for the window
    --     zindex = nil, -- the zindex value for the window
    --     border = 'none', -- style of border for the fidget window
    --   },
    --   fmt = {
    --     leftpad = true, -- right-justify text in fidget box
    --     stack_upwards = false, -- list of tasks grows upwards
    --     max_width = 55, -- maximum width of the fidget box
    --     -- function to format fidget title
    --     fidget = function(fidget_name, spinner)
    --       return string.format('%s %s', spinner, fidget_name)
    --     end,
    --     -- function to format each task line
    --     task = function(task_name, message, percentage)
    --       if task_name == 'code_action' then
    --         return false
    --       end
    --       if task_name == 'code_action refactoring' then
    --         return false
    --       end
    --       if task_name == 'null-ls' then
    --         return false
    --       end
    --       return string.format(
    --         '%s%s [%s]',
    --         message,
    --         percentage and string.format(' (%s%%)', percentage) or '',
    --         task_name
    --       )
    --     end,
    --   },
    --   sources = { -- Sources to configure
    --     -- * = {                     -- Name of source
    --     --   ignore = false,         -- Ignore notifications from this source
    --     -- },
    --   },
    --   debug = {
    --     logging = false, -- whether to enable logging, for debugging
    --     strict = false, -- whether to interpret LSP strictly
    --   },
    -- }
  end,
}
