local options = require("utils").options
local get_session_root = require("utils").get_git_root_or_cwd

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

  -- Show a notification with the session file path
  vim.notify("Session file created: " .. session_name, vim.log.levels.INFO, { title = 'Session created' })
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

-- Save all named buffers and close unnamed buffers
local function save_and_clean_buffers()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].modifiable then
      local name = vim.api.nvim_buf_get_name(bufnr)
      if name ~= '' then
        vim.cmd('silent! write ' .. vim.fn.fnameescape(name)) -- Save the buffer
      else
        vim.cmd('bwipeout ' .. bufnr) -- Close unnamed buffers
      end
    end
  end
end

-- Save buffers, create default session, and quit Vim
local function save_session_and_quit()
  save_and_clean_buffers()
  vim.cmd('SessionCreate')
  vim.cmd('wqa!')
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

local map = vim.keymap.set

map('n', '<leader>sc', ':SessionCreate<CR>', options('Create default session'))
map('n', '<leader>sn', ':SessionCreatePrompt<CR>', options('Create named session with prompt'))
map('n', '<leader>ss', search_session, options('Search for session files'))
map('n', '<leader>sl', search_session, options('List session files'))
map('n', '<leader>sq', save_session_and_quit, options("Save files, create default session, and quit Vim"))
