local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]]) -- set up highligit color

nvimtree.setup({
	-- change folder arrow icons
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
