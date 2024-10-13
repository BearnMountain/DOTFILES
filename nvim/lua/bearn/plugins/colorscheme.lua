return {
    "tiagovla/tokyodark.nvim",
    priority = 1000,
    config = function()
        vim.cmd [[colorscheme tokyodark]]
    end,
}


 -- return {
 --     "sainnhe/sonokai",
 --     lazy = false,
 --     priority = 1000,
 --     config = function()
 --         -- Optionally configure and load the colorscheme
 --         -- directly inside the plugin declaration.
 --         vim.g.sonokai_enable_italic = true
 --         vim.cmd("colorscheme sonokai")
 --         vim.g.sonokai_style = "atlantis" 
 --     end
 -- }
