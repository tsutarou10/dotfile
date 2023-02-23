-- local status, memolist = pcall(require, "memolist")
-- if not status then
-- 	print("unloaded memolist...")
-- 	return
-- end
-- print("loaded memolist!")

vim.g.memolist_path = "~/.memolist/memo"
vim.g.memolist_memo_suffix = "md"
vim.g.memolist_zsf = 1
vim.g.memolist_prompt_tags = 1
vim.g.memolist_prompt_categories = 1
vim.g.memolst_template_dir_path = "~/.memolist/memotemplates"

-- memolist.setup()
