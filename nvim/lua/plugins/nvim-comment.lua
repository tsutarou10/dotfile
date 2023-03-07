local setup, nvim_comment = pcall(require, "nvim_comment")
if not setup then
	return
end

nvim_comment.setup({
	line_mapping = "<leader>cl",
	operator_mapping = "<leader>c",
	comment_empty = false,
})
