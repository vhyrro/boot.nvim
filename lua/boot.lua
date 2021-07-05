local boot = {
	options = {
		buffer_options = {}
	}
}

function boot.setup(opts)
  	if vim.fn.expand("%:e"):len() == 0 then

  		boot.options = vim.tbl_deep_extend("force", boot.options, opts or {})

		vim.schedule(function()
			vim.api.nvim_buf_set_lines(0, 0, 1, false, { "bruh" })
    		require('boot.buffer_options').set(boot.options.buffer_options)
    	end)
  	end
end

return boot
