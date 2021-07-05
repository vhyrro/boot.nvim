local buffer_options = {
	local_options = {
		number = false,
		relativenumber = false,
		modified = false,
		modifiable = false,
	},

	global_options = {
		laststatus = 2,
		showtabline = 0,
	},

	global_cache = {},
}

function buffer_options.set(bufopts)
	local options = vim.tbl_deep_extend("force", buffer_options.local_options, bufopts)

	for option, value in pairs(buffer_options.global_options) do
		buffer_options.global_cache[option] = vim.opt_global[option]:get()
		vim.opt_global[option] = value
	end

	for option, value in pairs(options) do
		vim.opt_local[option] = value
	end

	vim.api.nvim_buf_set_name(0, "Boot")
end

function buffer_options.reset()
	for option, value in pairs(buffer_options.global_cache) do
		vim.opt_global[option] = value
	end
end

return buffer_options
