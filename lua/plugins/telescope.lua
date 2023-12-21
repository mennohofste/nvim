-- The buffer picker always resets to the second line for whatever reason
-- This makes it reset to the first line at the cost of not being able to
-- find the current buffer
return {
  "telescope.nvim",
  opts = { pickers = { buffers = { ignore_current_buffer = true } } },
}
