return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")

    -- Set gruvbox colors for notifications
    local gruvbox_colors = {
      ERROR = "#fb4934", -- Red
      WARN = "#fabd2f",  -- Yellow
      INFO = "#83a598",  -- Blue
      DEBUG = "#8ec07c", -- Green
      TRACE = "#d3869b", -- Purple
    }

    -- Configure nvim-notify
    notify.setup({
      stages = "static",             -- Use static animations (no movement)
      timeout = 3000,                -- Notifications last for 3 seconds
      background_colour = "#282828", -- Gruvbox background
      render = "default",            -- Default rendering style
      top_down = false,              -- Stack notifications from bottom to top
      fps = 30,                      -- Frames per second for animations
      on_open = function(win)
        -- Place the notification at the bottom-right corner
        vim.api.nvim_win_set_config(win, {
          relative = "editor",
          anchor = "SE",           -- Anchor to the bottom-right corner
          row = vim.o.lines - 2,   -- Bottom of the editor (adjusted for status line)
          col = vim.o.columns - 2, -- Far-right of the editor
        })
      end,
      -- Icons matching Gruvbox colors
      icons = {
        ERROR = "", -- Symbol for error
        WARN = "", -- Symbol for warning
        INFO = "", -- Symbol for info
        DEBUG = "", -- Symbol for debug
        TRACE = "✎", -- Symbol for trace
      },
      -- Use Gruvbox colors for highlights
      highlight = {
        ERROR = { guifg = gruvbox_colors.ERROR },
        WARN = { guifg = gruvbox_colors.WARN },
        INFO = { guifg = gruvbox_colors.INFO },
        DEBUG = { guifg = gruvbox_colors.DEBUG },
        TRACE = { guifg = gruvbox_colors.TRACE },
      },
    })

    -- Set `nvim-notify` as the default notification handler
    vim.notify = notify
  end,
}
