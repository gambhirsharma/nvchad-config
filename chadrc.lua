-- local plugin = require "custom.plugin"
---@type ChadrcConfig
local M = {}

M.ui = { theme = 'tokyodark' }
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

-- M.plugins = require "custom.plugin"

return M
