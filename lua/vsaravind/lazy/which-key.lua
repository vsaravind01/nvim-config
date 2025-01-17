return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    plugins = {
        marks = true,
        registers = true,
        spelling = {
            enabled = true,
            suggestions = 20,
        },
        presets = {
            operators = false,
            motions = true,
            text_objects = true,
            windows = true,
            z = true,
            g = true,
        },
    },
    keys = {},
}
