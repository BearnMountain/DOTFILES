return {
	'numToStr/Comment.nvim',
	config = function()
		require('Comment').setup({
		  padding = true, -- Add a space between comment and the line
		  sticky = true,  -- Keep cursor position after commenting

		  -- Keybindings (can be disabled or customized)
		  toggler = {
			line = 'gcc',
			block = 'gbc',
		  },
		  opleader = {
			line = 'gc',
			block = 'gb',
		  },
		  extra = {
			above = 'gcO',
			below = 'gco',
			eol = 'gcA',
		  },

		  -- Enable or disable mappings
		  mappings = {
			basic = true, -- Includes `gcc`, `gbc`, `gc{motion}`, `gb{motion}`
			extra = true, -- Includes `gcO`, `gco`, `gcA`
		  },

		  -- Hook into comment/uncomment actions
		  pre_hook = nil,
		  post_hook = nil,
		})
	end,
}
