local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>sf", builtin.find_files, {desc = '[S]earch [F]iles'})
vim.keymap.set("n", "<C-p>", builtin.git_files, { })
