local M = {}

local function init()
    vim.api.nvim_put({"　 ／l、",
    " ﾞ(ﾟ､ ｡ 𝟩",
    "　|、ﾞ ~ヽ",
    "　じしſ_, )ノ",
    "We have progress, pog"}, "l", false, false)
    vim.bo.modifiable = false
    vim.bo.modified = false
end

_G.bootloader = function()
  if (vim.fn.argc() == 0 and vim.fn.line2byte('$') == -1) then
    init()
  end
end

function M.setup(opts)
  vim.cmd[[
  augroup BootLoader
  autocmd Vimenter * nested call v:lua.bootloader()
  augroup END
  ]]
end

return M
