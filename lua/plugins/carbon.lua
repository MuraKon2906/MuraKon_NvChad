return {
  "ellisonleao/carbon-now.nvim",
  lazy = true,
  cmd = "CarbonNow",
  opts = {
    base_url = "https://carbon.now.sh/",
    options = {
      bg = "rgba(255, 255, 255, 0.1)", -- Semi-transparent background
      drop_shadow_blur = "75px",
      drop_shadow = true, -- Enabled drop shadow
      drop_shadow_offset_y = "20px",
      font_family = "Fira Code", -- Stylish monospaced font
      font_size = "16px",
      line_height = "150%",
      line_numbers = true,
      theme = "synthwave-84",
      titlebar = "✨ Crafted by MuraKon ✨", -- Updated titlebar text with emojis
      watermark = true, -- Enabled watermark
      width = "800", -- Increased width for better visibility
      window_theme = "none", -- No window theme for a clean look
      padding_horizontal = "20px", -- Added horizontal padding
      padding_vertical = "20px", -- Added vertical padding
    },
  },
  -- Set keybinding for CarbonNow with an elegant keymap configuration
  vim.keymap.set("v", "<leader>cn", ":CarbonNow<CR>", { silent = true, desc = "Generate Carbon Now Image" }),
}
