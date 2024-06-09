local Utils = {
  printTable = "utils.print-table",
}

local M = {}

for key, path in pairs(Utils) do
  local status, func = pcall(require, path)
  if status then
    M[key] = func
  else
    print("name: " .. key .. ", " .. "path: " .. "`" .. path .. "` " .. "util not found")
  end
end

local cache = {} ---@type table<string, any>
---@generic T: fun()
---@param fn T
---@return T
function M.memoize(fn)
  return function(...)
    local key = vim.inspect({ ... })
    if cache[key] == nil then
      cache[key] = fn(...)
    end
    return cache[key]
  end
end

return M
