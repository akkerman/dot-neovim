local nmap = require("utils").nmap
local get_session_root = require("utils").get_git_root_or_cwd
local get_git_branch_name = require("utils").get_git_branch_name


--- vim command to force create a session in the current directory
--- @param session_name string: The name of the session, to use in the filename
local function create_session(session_name)
  local root = get_session_root()
  local name = session_name

  if not name or name == "" then
    local branch = get_git_branch_name()
    if branch then
      name = branch
    end
  end

  local filename = name and ("Session-" .. name .. ".vim") or "Session.vim"
  local session_path = root .. "/" .. filename

  vim.cmd("mksession! " .. vim.fn.fnameescape(session_path))
  vim.notify("Session file created: " .. session_path, vim.log.levels.INFO, { title = "Session created" })
end

--- Source a session file from the session root
--- @param session_name string: The name of the session, to use in the filename
local function source_session(session_name)
  local root = get_session_root()
  local paths_to_try = {}

  if session_name and session_name ~= "" then
    table.insert(paths_to_try, root .. "/Session-" .. session_name .. ".vim")
  else
    local branch_name = get_git_branch_name()
    if branch_name then
      table.insert(paths_to_try, root .. "/Session-" .. branch_name .. ".vim")
    end
    table.insert(paths_to_try, root .. "/Session.vim")
  end

  for _, path in ipairs(paths_to_try) do
    if vim.fn.filereadable(path) == 1 then
      vim.cmd("source " .. vim.fn.fnameescape(path))
      vim.notify("Session loaded: " .. path, vim.log.levels.INFO, { title = "Session loaded" })
      return true
    end
  end

  vim.notify("No session file found", vim.log.levels.WARN, { title = "Session load failed" })
  return false
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

--- create or load a session based on the current git branch
local function create_or_source_branch_session()
  -- Get the current branch name
  local branch = get_git_branch_name()
  if not branch then
    vim.notify("Not inside a Git repository", vim.log.levels.WARN)
    return
  end

  local loaded = false

  if branch then
    loaded = source_session(branch)
  end

  if not loaded then
    create_session(branch)
  end
end


--- User command to create a session
vim.api.nvim_create_user_command("SessionCreate", function(opts)
  create_session(opts.args)
end, { nargs = "?" })
---
--- User command to load a session
vim.api.nvim_create_user_command("SessionLoad", function(opts)
  source_session(opts.args)
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
nmap("<leader>sb", create_or_source_branch_session, "Create or load session based on current git branch")
