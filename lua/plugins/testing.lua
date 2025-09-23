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
      coverage.setup({
        commands = true,
        auto_reload = true,
        min_coverage = 100,
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
        coverage.summary()
      end, { desc = "Show summary" })

      map("n", "]c", function()
        coverage.jump_next("uncovered")
      end, { desc = "Jump to next uncovered line" })

      map("n", "[c", function()
        coverage.jump_prev("uncovered")
      end, { desc = "Jump to previous uncovered line" })
    end,
  },
}
