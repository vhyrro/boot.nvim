local utils = {
	cache = {}
}

function utils.recenter_all()
	vim.opt_local.modifiable = true
	vim.api.nvim_buf_set_lines(0, 0, -1, true, {})

	for i, line in ipairs(utils.cache) do
		utils.cache[i] = utils.center(vim.trim(line))
	end

	utils.flush()

	vim.opt_local.modifiable = false
	vim.opt_local.modified = false
end

function utils.center(text)
	local width = vim.fn.winwidth(0)

	return (" "):rep(math.floor((width - text:len()) / 2)) .. text
end

function utils.insert_text(text)
	table.insert(utils.cache, utils.center(text))
end

function utils.flush()
	vim.api.nvim_put(utils.cache, "l", false, false)
end

return utils
