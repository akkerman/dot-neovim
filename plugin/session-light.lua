-- Returns the Git root directory or cwd
local function get_session_root()
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if vim.v.shell_error == 0 and git_root ~= "" then
    return git_root
  end
  return vim.fn.getcwd()
end


-- vim command to force create a session in the current directory
local function create_session(session_name)
  if session_name == "" or session_name == nil then
    session_name = 'Session.vim'
  else
    session_name = 'Session-' .. session_name .. '.vim'
  end
  -- Check if we are in a git repository
  local git_dir = get_session_root()
  if git_dir ~= "" then
    session_name = git_dir .. "/" .. session_name
  end
  vim.cmd("mksession! " .. session_name)
end

-- Initialize Telescope
local telescope = require('telescope.builtin')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

-- Function to search for session files
local function search_session()
  telescope.find_files({
    prompt_title = "Session Files",
    cwd = get_session_root(),
    find_command = { "find", ".", "-name", "Session*.vim" },
    previewer = false, -- Disable the preview window
    attach_mappings = function(prompt_bufnr, map)
      -- Custom action to source the selected session file
      map('i', '<CR>', function()
        local selection = action_state.get_selected_entry()
        if selection then
          local session_path = selection.path
          actions.close(prompt_bufnr) -- Close the Telescope picker
          -- Use defer_fn to delay sourcing the session file
          vim.defer_fn(function()
            vim.cmd('source ' .. session_path)
          end, 50) -- 50 ms delay
        end
      end)
      return true
    end
  })
end

vim.api.nvim_create_user_command("SessionCreate", function(opts)
  create_session(opts.args)
end, {nargs = "?"})
vim.api.nvim_create_user_command("SessionCreatePrompt", function()
  vim.fn.inputsave()
  local session_name = vim.fn.input("Session name: ")
  vim.fn.inputrestore()
  create_session(session_name)
end, {})
vim.api.nvim_create_user_command("SessionSearch", search_session, {})

vim.keymap.set('n', '<leader>sc', ':SessionCreate<CR>', { noremap = true, silent = true , desc = 'Create default session' })
vim.keymap.set('n', '<leader>sn', ':SessionCreatePrompt<CR>', { noremap = true, silent = true , desc = 'Create named session with prompt' })
vim.keymap.set('n', '<leader>ss', ':SessionSearch<CR>', { noremap = true, silent = true , desc = 'Search for session files' })
vim.keymap.set('n', '<leader>sl', ':SessionSearch<CR>', { noremap = true, silent = true , desc = 'List session files' })
