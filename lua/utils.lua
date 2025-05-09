local M = {}
local map = vim.keymap.set

--- @param desc string -- Descripton of the keymap
--- @return table -- The options with noremap, silent and desc
function M.options(desc)
  return { noremap = true, silent = true, desc = desc }
end

--- @return string root the Git root directory or cwd
function M.get_git_root_or_cwd()
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if vim.v.shell_error == 0 and git_root ~= "" then
    return git_root
  end
  return vim.fn.getcwd()
end

function M.nmap(key, cmd, desc)
  map("n", key, cmd, M.options(desc))
end


--- @return string|nil branch the current git branch name
function M.get_git_branch_name()
  local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", "")
  if branch == "" or branch == "HEAD" then
    return nil
  end
  return branch:match("([^/]+)$") or branch
end


return M


