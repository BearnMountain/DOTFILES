-- return {
--     "tiagovla/tokyodark.nvim",
--     priority = 1000,
--     config = function()
--         vim.cmd [[colorscheme tokyodark]]
--     end,
-- }

-- return {
--     "sainnhe/gruvbox-material",
--     priority = 1000,
--     config = function()
--         vim.g.everforest_enable_italic = true
--
--         vim.cmd("colorscheme gruvbox-material")
--     end,
-- }

-- return {
-- 	"projekt0n/github-nvim-theme",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("github-theme").setup({
-- 			options = {
-- 				styles = {
-- 					comments = "italic",
-- 					functions = "bold",
-- 					keywords = "italic",
-- 					types = "italic,bold",
-- 				},
-- 			},
-- 		})
--
-- 		-- Now select the style via :colorscheme
-- 		vim.cmd("colorscheme github_dark_dimmed")  -- or any variant you want
-- 	end,
-- }
--
return {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.sonokai_enable_italic = true
        vim.cmd("colorscheme sonokai")
        vim.g.sonokai_style = "atlantis"
        vim.cmd([[set background=dark]])
        vim.api.nvim_set_hl(0, "Function", { fg = "#5f875f" })
        vim.api.nvim_set_hl(0, "Normal", { bg = "#121212" }) -- 1a1d23 alt
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "#1c1c1c" })  -- Lighter background for inactive windows
    end,
}

