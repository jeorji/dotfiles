require'nvim-treesitter.configs'.setup {
    ensure_installed = {"python", "c", "cpp",  "c_sharp", "lua", "vim", "rust"},
    highlight = {
        enable = true,
    },
    indent = {
        enable = true, 
    }
}
