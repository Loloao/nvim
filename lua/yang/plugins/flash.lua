return {
	"git@github.com:folke/flash.nvim",
	-- event = "VeryLazy",
	opts = {},
  -- stylua: ignore
  keys = {
    { "<leader>ls", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "<leader>lt", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "<leader>lr", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "<leader>lR", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
