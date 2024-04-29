return {
	"git@github.com:nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"git@github.com:nvim-lua/plenary.nvim",
		dependencies = {
			"git@github.com:nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
		"git@github.com:nvim-tree/nvim-web-devicons",
		"git@github.com:folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod

		local trouble = require("trouble")
		local trouble_telescope = require("trouble.providers.telescope")

		-- or create your custom action
		local custom_actions = transform_mod({
			open_trouble_qflist = function()
				trouble.toggle("quickfix")
			end,
		})

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						["<C-t>"] = trouble_telescope.smart_open_with_trouble,
					},
				},
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>p", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>r", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>F", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>f", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
