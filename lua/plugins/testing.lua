return {
  -- integrate testing
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "haydenmeade/neotest-jest",
      "andythigpen/nvim-coverage",
    },
    config = function()
      local map = vim.keymap.set

      -- testing
      local neotest = require("neotest")
      neotest.setup({
        log_level = vim.log.levels.DEBUG,
        discovery = {
          enabled = false,
        },
        adapters = {
          require("neotest-jest")({
            jestCommand = "npm test --", -- Change if using yarn/pnpm
            jestConfigFile = "jest.config.js",
            jest_test_discovery = false,
            env = { CI = true },
            cwd = function()
              return vim.fn.getcwd()
            end,
          }),
        },
      })

      -- keybindings for running tests
      map("n", "<leader>ctn", function()
        neotest.run.run()
      end, { desc = "Run nearest test" })

      map("n", "<leader>ctf", function()
        neotest.run.run(vim.fn.expand("%"))
      end, { desc = "Run current file" })

      map("n", "<leader>cts", function()
        neotest.summary.toggle()
      end, { desc = "Toggle test summary" })

      map("n", "<leader>cto", function()
        neotest.output.open({ enter = true })
      end, { desc = "Open test output" })

      map("n", "]t", function()
        neotest.jump.next({ status = "failed" })
      end, { desc = "Next failed test" })

      map("n", "[t", function()
        neotest.jump.prev({ status = "failed" })
      end, { desc = "Previous failed test" })

      -- coverage
      local coverage = require("coverage")
      local coverage_report = require("coverage.report")
      local summary_after_load = false

      coverage.setup({
        commands = true,
        auto_reload = true,
        min_coverage = 100,
        load_coverage_cb = function()
          if summary_after_load then
            summary_after_load = false
            coverage.summary()
          end
        end,
        signs = {
          covered = { text = "" },
          uncovered = { text = "" },
        },
      })

      -- keybindings for coverage
      map("n", "<leader>ccl", function()
        coverage.load(true)
      end, { desc = "Load coverage" })

      map("n", "<leader>ccs", function()
        coverage.toggle()
      end, { desc = "Toggle coverage signs" })

      map("n", "<leader>ccS", function()
        if coverage_report.is_cached() then
          coverage.show()
          coverage.summary()
          return
        end
        summary_after_load = true
        coverage.load(true)
        -- clear the flag if loading silently failed (e.g. no coverage file)
        vim.defer_fn(function()
          summary_after_load = false
        end, 2000)
      end, { desc = "Show summary (loads coverage if needed)" })

      map("n", "]c", function()
        coverage.jump_next("uncovered")
      end, { desc = "Jump to next uncovered line" })

      map("n", "[c", function()
        coverage.jump_prev("uncovered")
      end, { desc = "Jump to previous uncovered line" })
    end,
  },
}
