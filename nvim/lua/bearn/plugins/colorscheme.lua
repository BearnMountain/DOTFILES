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

return {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.sonokai_enable_italic = true
        vim.cmd("colorscheme sonokai")
        vim.g.sonokai_style = "atlantis"
        vim.cmd([[set background=dark]])
        vim.api.nvim_set_hl(0, "Function", { fg = "#5f875f" })
        vim.api.nvim_set_hl(0, "Normal", { bg = "#121212" }) -- 1a1d23 alt
    end,
}
