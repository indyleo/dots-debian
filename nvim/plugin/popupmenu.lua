-- Function to extract URLs from the current buffer
local function extract_urls_from_buffer()
	local urls = {}
	for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
		for url in line:gmatch("http[s]?://[%w-_%.%?%.:/%+=&]+") do
			table.insert(urls, url)
		end
	end
	return urls
end

vim.cmd([[
  aunmenu PopUp
  amenu PopUp.Defaults: <Nop>
  anoremenu PopUp.Inspect :Inspect<CR>
  nnoremenu PopUp.Back <C-t>
  amenu PopUp.Url gx
  amenu PopUp.-1- <Nop>
  amenu PopUp.Text: <Nop>
  vnoremenu PopUp.Cut                     "+x
  vnoremenu PopUp.Copy                    "+y
  anoremenu PopUp.Paste                   "+gP
  vnoremenu PopUp.Paste                   "+P
  vnoremenu PopUp.Delete                  "_x
  nnoremenu PopUp.Select\ All             ggVG
  vnoremenu PopUp.Select\ All             gg0oG$
  inoremenu PopUp.Select\ All             <C-Home><C-O>VG
]])

-- Group and autocmd
local group = vim.api.nvim_create_augroup("nvim_popup", { clear = true })
vim.api.nvim_create_autocmd("MenuPopup", {
	pattern = "*",
	group = group,
	callback = function()
		vim.cmd([[
      amenu disable PopUp.Url
    ]])
		local urls = extract_urls_from_buffer()
		if urls[1] and vim.startswith(urls[1], "http") then
			vim.cmd("amenu enable PopUp.Url")
		end
	end,
})
