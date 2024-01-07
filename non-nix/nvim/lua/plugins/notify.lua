return {
    -- Get rid of alert.
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
            background_colour = "#11111b",
        })
    end
}
