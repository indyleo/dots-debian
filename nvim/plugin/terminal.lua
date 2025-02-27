local termstate = {
	floating = {
		buf = -1,
		win = -1,
	},
}

local lazystate = {
	floating = {
		buf = -1,
		win = -1,
	},
}

local function create_floating_window(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)

	-- Calculate the position to center the window
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	-- Create a buffer
	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
	end

	-- Define window configuration
	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal", -- No borders or extra UI elements
		border = "rounded",
	}

	-- Create the floating window
	local win = vim.api.nvim_open_win(buf, true, win_config)

	return { buf = buf, win = win }
end

local toggle_terminal = function()
	if not vim.api.nvim_win_is_valid(termstate.floating.win) then
		termstate.floating = create_floating_window({ buf = termstate.floating.buf })
		if vim.bo[termstate.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
		vim.cmd("startinsert")
	else
		vim.api.nvim_win_hide(termstate.floating.win)
	end
end

local toggle_lazygit = function()
	if not vim.api.nvim_win_is_valid(lazystate.floating.win) then
		lazystate.floating = create_floating_window({ buf = lazystate.floating.buf })
		if vim.bo[lazystate.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal("lazygit")
		end
		vim.cmd("startinsert")
	else
		vim.api.nvim_win_hide(lazystate.floating.win)
	end
end

vim.api.nvim_create_user_command("ToggleTerminal", toggle_terminal, {})
vim.api.nvim_create_user_command("ToggleLazygit", toggle_lazygit, {})
