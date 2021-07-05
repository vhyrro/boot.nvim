local boot = {
	options = {
		buffer_options = {}
	}
}

function boot.setup(opts)
  	if vim.fn.expand("%:e"):len() == 0 then

  		boot.options = vim.tbl_deep_extend("force", boot.options, opts or {})

		vim.schedule(function()
			local boot_utils = require('boot.utilities')

			boot_utils.insert_text("EXAMPLE")
			boot_utils.insert_text("JUST TO VERIFY THAT IT WORKS AS INTENDED")
			boot_utils.flush()

    		require('boot.buffer_options').set(boot.options.buffer_options)

			vim.cmd [[ autocmd VimResized Boot :lua require('boot.utilities').recenter_all() ]]
    	end)
  	end
end

return boot
