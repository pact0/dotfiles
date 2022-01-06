local rhs_options = {}

function rhs_options:new()
  local instance = {
    cmd = "",
    options = { noremap = false, silent = false, expr = false, nowait = false },
  }
  setmetatable(instance, self)
  self.__index = self
  return instance
end

function rhs_options:map_cmd(cmd_string)
  self.cmd = cmd_string
  return self
end

function rhs_options:map_cr(cmd_string)
  self.cmd = (":%s<CR>"):format(cmd_string)
  return self
end

function rhs_options:map_args(cmd_string)
  self.cmd = (":%s<Space>"):format(cmd_string)
  return self
end

function rhs_options:map_cu(cmd_string)
  self.cmd = (":<C-u>%s<CR>"):format(cmd_string)
  return self
end

function rhs_options:map_key(key_string)
  self.cmd = ("%s"):format(key_string)
  return self
end

function rhs_options:with_silent()
  self.options.silent = true
  return self
end

function rhs_options:with_noremap()
  self.options.noremap = true
  return self
end

function rhs_options:with_expr()
  self.options.expr = true
  return self
end

function rhs_options:with_nowait()
  self.options.nowait = true
  return self
end

local pbind = {}

function pbind.map_cr(cmd_string)
  local ro = rhs_options:new()
  return ro:map_cr(cmd_string)
end

function pbind.map_cmd(cmd_string)
  local ro = rhs_options:new()
  return ro:map_cmd(cmd_string)
end

function pbind.map_cu(cmd_string)
  local ro = rhs_options:new()
  return ro:map_cu(cmd_string)
end

function pbind.map_key(keystr)
  local ro = rhs_options:new()
  return ro:map_key(keystr)
end

function pbind.map_args(cmd_string)
  local ro = rhs_options:new()
  return ro:map_args(cmd_string)
end

function pbind.nvim_load_mapping(mapping)
  for key, value in pairs(mapping) do
    local mode, keymap = key:match("([^|]*)|?(.*)")
    for i = 1, #mode do
      if type(value) == "table" then
        local rhs = value.cmd
        local options = value.options
        vim.api.nvim_set_keymap(mode:sub(i, i), keymap, rhs, options)
      elseif type(value) == "string" then
        vim.api.nvim_set_keymap(mode:sub(i, i), keymap, value, {})
      end
    end
  end
end

function pbind.map(modes, key, result, options)
  local merge = function(t1, t2)
    for k, v in pairs(t2) do
      t1[k] = v
    end
    return t1
  end
  options = merge({
    noremap = true,
    silent = false,
    expr = false,
    nowait = false,
  }, options or {})
  local buffer = options.buffer
  options.buffer = nil

  if type(modes) ~= "table" then
    modes = { modes }
  end

  for i = 1, #modes do
    if buffer then
      vim.api.nvim_buf_set_keymap(0, modes[i], key, result, options)
    else
      vim.api.nvim_set_keymap(modes[i], key, result, options)
    end
  end
end

return pbind
