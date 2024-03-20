-- https://github.com/nvim-neotest/neotest
return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-neotest/neotest-python',
    'nvim-neotest/neotest-go',
    'rouge8/neotest-rust',
    'alfaix/neotest-gtest',
  },
  config = function()
    -- get neotest namespace (api call creates or returns namespace)
    local neotest_ns = vim.api.nvim_create_namespace 'neotest'
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
          return message
        end,
      },
    }, neotest_ns)

    require('neotest').setup {
      adapters = {
        require 'neotest-python',
        require 'neotest-go',
        require 'neotest-rust',
        require('neotest-gtest').setup {},
      },
      benchmark = {
        enabled = true,
      },
      consumers = {},
      default_strategy = 'integrated',
      diagnostic = {
        enabled = true,
        severity = 1,
      },
      discovery = {
        concurrent = 0,
        enabled = true,
      },
      floating = {
        border = 'rounded',
        max_height = 0.6,
        max_width = 0.6,
        options = {},
      },
      highlights = {
        adapter_name = 'NeotestAdapterName',
        border = 'NeotestBorder',
        dir = 'NeotestDir',
        expand_marker = 'NeotestExpandMarker',
        failed = 'NeotestFailed',
        file = 'NeotestFile',
        focused = 'NeotestFocused',
        indent = 'NeotestIndent',
        marked = 'NeotestMarked',
        namespace = 'NeotestNamespace',
        passed = 'NeotestPassed',
        running = 'NeotestRunning',
        select_win = 'NeotestWinSelect',
        skipped = 'NeotestSkipped',
        target = 'NeotestTarget',
        test = 'NeotestTest',
        unknown = 'NeotestUnknown',
        watching = 'NeotestWatching',
      },
      icons = {
        child_indent = '│',
        child_prefix = '├',
        collapsed = '─',
        expanded = '╮',
        failed = '',
        final_child_indent = ' ',
        final_child_prefix = '╰',
        non_collapsible = '─',
        passed = '',
        running = '',
        running_animated = { '/', '|', '\\', '-', '/', '|', '\\', '-' },
        skipped = '',
        unknown = '',
        watching = '',
      },
      jump = {
        enabled = true,
      },
      log_level = 3,
      output = {
        enabled = true,
        open_on_run = 'short',
      },
      output_panel = {
        enabled = true,
        open = 'botright split | resize 15',
      },
      projects = {},
      quickfix = {
        enabled = true,
        open = false,
      },
      run = {
        enabled = true,
      },
      running = {
        concurrent = true,
      },
      state = {
        enabled = true,
      },
      status = {
        enabled = true,
        signs = true,
        virtual_text = false,
      },
      strategies = {
        integrated = {
          height = 40,
          width = 120,
        },
      },
      summary = {
        animated = true,
        enabled = true,
        expand_errors = true,
        follow = true,
        mappings = {
          attach = 'a',
          clear_marked = 'M',
          clear_target = 'T',
          debug = 'd',
          debug_marked = 'D',
          expand = { '<CR>', '<2-LeftMouse>' },
          expand_all = 'e',
          jumpto = 'i',
          mark = 'm',
          next_failed = 'J',
          output = 'o',
          prev_failed = 'K',
          run = 'r',
          run_marked = 'R',
          short = 'O',
          stop = 'u',
          target = 't',
          watch = 'w',
        },
        open = 'botright vsplit | vertical resize 50',
      },
      watch = {
        enabled = true,
        -- symbol_queries = {
        --   elixir = <function 1>,
        --   lua = '        ;query\n        ;Captures module names in require calls\n        (function_call\n          name: ((identifier) @function (#eq? @function "require"))\n          arguments: (arguments (string) @symbol))\n      ',
        --   python = "        ;query\n        ;Captures imports and modules they're imported from\n        (import_from_statement (_ (identifier) @symbol))\n        (import_statement (_ (identifier) @symbol))\n      "
        -- }
      },
    }
  end,
}
