return {
	{
		"Vigemus/iron.nvim",
		config = function()
			local iron = require("iron.core")
			iron.setup({
				config = {
					-- Whether a repl should be discarded or not
					scratch_repl = true,
					-- Your repl definitions come here
					repl_definition = {
						R = {
							-- Can be a table or a function that
							-- returns a table (see below)
							command = { "radian" },
						},
						r = {
							-- Can be a table or a function that
							-- returns a table (see below)
							command = { "radian" },
						},
						quarto = {
							command = { "radian" },
						},
					},
					-- How the repl window will be displayed
					-- See below for more information
					repl_open_cmd = require("iron.view").split.vertical.botright("40%"),
				},
				-- iron doesn't set keymaps by default anymore.
				-- You can set them here or manually add keymaps to the functions in iron.core
				keymaps = {
					send_motion = "<localleader>R",
					visual_send = "<localleader>r<cr>",
					send_file = "<localleader>rf<cr>",
					send_line = "<localleader>rl",
					send_paragraph = "<localleader>rp",
					send_until_cursor = "<localleader>rU<cr>",
					-- send_mark = "<localleader>rm",
					-- mark_motion = "<localleader>mc",
					-- mark_visual = "<localleader>mc",
					-- remove_mark = "<localleader>md",
					cr = "<localleader>rA<cr>",
					interrupt = "<localleader>r<space>",
					exit = "<localleader>rQ",
					clear = "<localleader>rC",
				},
				-- If the highlight is on, you can change how it looks
				-- For the available options, check nvim_set_hl
				highlight = false,
				ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
			})

			-- iron also has a list of commands, see :h iron-commands for all available commands
			vim.keymap.set("n", "<localleader>rS", "<cmd>IronRepl<cr>", { desc = "[R]EPL [S]tart" })
			vim.keymap.set("n", "<localleader>rR", "<cmd>IronRestart<cr>", { desc = "[R]EPL [R]estart" })
			vim.keymap.set("n", "<localleader>rF", "<cmd>IronFocus<cr>", { desc = "[R]EPL [F]ocus" })
			vim.keymap.set("n", "<localleader>rH", "<cmd>IronHide<cr>", { desc = "[R]EPL [H]ide" })
		end,
	},
}
