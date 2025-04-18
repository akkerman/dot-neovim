local nmap = require("utils").nmap
local get_session_root = require("utils").get_git_root_or_cwd

--- vim command to force create a session in the current directory
--- @param session_name string: The name of the session, to use in the filename
local function create_session(session_name)
  if session_name == "" or session_name == nil then
    session_name = "Session.vim"
  else
    session_name = "Session-" .. session_name .. ".vim"
  end
  -- Check if we are in a git repository
  local git_dir = get_session_root()
  if git_dir ~= "" then
    session_name = git_dir .. "/" .. session_name
  end
  vim.cmd("mksession! " .. session_name)

  -- Show a notification with the session file path
  vim.notify("Session file created: " .. session_name, vim.log.levels.INFO, { title = "Session created" })
end

-- Initialize Telescope
local telescope = require("telescope.builtin")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

--- Search for session files in git root
--- falls back to current directory if not in a git repository
local function search_session()
  local search_command = vim.fn.executable("fd") == 1 and { "fd", "--no-ignore", "Session.*\\.vim", "." }
    or { "find", ".", "-name", "Session*.vim" }

  telescope.find_files({
    prompt_title = "Session Files",
    cwd = get_session_root(),
    find_command = search_command,
    previewer = false, -- Disable the preview window
    attach_mappings = function(prompt_bufnr, map)
      -- Custom action to source the selected session file
      map("i", "<CR>", function()
        local selection = action_state.get_selected_entry()
        if selection then
          local session_path = selection.path
          actions.close(prompt_bufnr) -- Close the Telescope picker
          -- Use defer_fn to delay sourcing the session file
          vim.defer_fn(function()
            vim.cmd("source " .. session_path)
          end, 50) -- 50 ms delay
        end
      end)
      return true
    end,
  })
end

--- Save all named buffers and close unnamed buffers
local function save_and_clean_buffers()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].modifiable then
      local name = vim.api.nvim_buf_get_name(bufnr)
      if name ~= "" then
        vim.cmd("silent! write " .. vim.fn.fnameescape(name)) -- Save the buffer
      else
        vim.cmd("bwipeout " .. bufnr) -- Close unnamed buffers
      end
    end
  end
end

--- Save buffers, create default session, and quit neovim
local function save_session_and_quit()
  save_and_clean_buffers()
  if vim.v.this_session then
    vim.cmd("mksession! " .. vim.fn.fnameescape(vim.v.this_session))
  else
    vim.cmd("SessionCreate")
  end
  vim.cmd("wqa!")
end

--- overwrite existing session, or show warning if not in a session
local function overwrite_session()
  if vim.v.this_session then
    vim.cmd("mksession! " .. vim.fn.fnameescape(vim.v.this_session))
    vim.notify("Session overwritten: " .. vim.v.this_session)
  else
    vim.notify("Currently not in a session", vim.log.levels.WARN)
  end
end

--- reload current sessions, or show warning if not in a session
local function reload_session()
  if vim.v.this_session then
    vim.cmd("source " .. vim.fn.fnameescape(vim.v.this_session))
    vim.notify("Session reloaded: " .. vim.v.this_session)
  else
    vim.notify("Currently not in a session", vim.log.levels.WARN)
  end
end

--- User command to create a session
vim.api.nvim_create_user_command("SessionCreate", function(opts)
  create_session(opts.args)
end, { nargs = "?" })

vim.api.nvim_create_user_command("SessionCreatePrompt", function()
  vim.fn.inputsave()
  local session_name = vim.fn.input("Session name: ")
  vim.fn.inputrestore()
  create_session(session_name)
end, {})
vim.api.nvim_create_user_command("SessionSearch", search_session, {})

-- Key mappings
nmap("<leader>sc", ":SessionCreate<CR>", "Create default session")
nmap("<leader>sn", ":SessionCreatePrompt<CR>", "Create named session with prompt")
nmap("<leader>ss", search_session, "Search session files")
nmap("<leader>sf", search_session, "Search session files")
nmap("<leader>sq", save_session_and_quit, "Save files, save current or create default session, and quit Vim")
nmap("<leader>sw", overwrite_session, "Overwrite session")
nmap("<leader>sr", reload_session, "Reload session")
