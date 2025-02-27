-- Cd into dir and open Oil in that dir
local function OilDir(opts)
	local path = opts.args -- Get the path argument
	local dirpath = path:gsub("\\", "/") .. "/" -- Normalize path
	vim.cmd("cd " .. vim.fn.fnameescape(dirpath)) -- Change directory
	vim.cmd("Oil --float") -- Open Oil in float mode
end

-- Function to cd into a directory and open a file
local function EditFile(opts)
	local args = vim.split(opts.args, " ") -- Split arguments into dirpath and filename
	if #args < 2 then
		vim.api.nvim_err_writeln("Usage: :EditFile <dirpath> <filename>")
		return
	end

	local dirpath = args[1] -- First argument is the directory path
	local filename = args[2] -- Second argument is the file name
	local escaped_dirpath = dirpath:gsub("\\", "/") .. "/"
	local filepath = escaped_dirpath .. filename

	-- Change directory
	vim.cmd("cd " .. vim.fn.fnameescape(escaped_dirpath))

	-- Open the file
	vim.cmd("edit " .. vim.fn.fnameescape(filepath))
end

-- Function to ask for a new file name and open it
local AskNewFileName = function()
	local current_dir = vim.fn.getcwd() -- Get the current working directory
	vim.ui.input({ prompt = "Enter new file name: " }, function(filename)
		if filename ~= nil and filename ~= "" then
			local filepath = current_dir .. "/" .. filename
			vim.cmd("edit " .. vim.fn.fnameescape(filepath)) -- Open the new file
		else
			vim.notify("No file created", vim.log.levels.ERROR) -- Notify if no file is created
		end
	end)
end

-- Ask what file to open then opens it in a horizontal split
local NewHSplit = function()
	local current_dir = vim.fn.getcwd()
	vim.ui.input({ prompt = "Enter file path: " }, function(filename)
		if filename ~= nil and filename ~= "" then
			local filepath = current_dir .. "\\" .. filename
			if vim.fn.filereadable(filepath) == 1 then
				vim.cmd("split " .. filename)
			else
				vim.notify("File does not exist in cwd", vim.log.levels.ERROR)
			end
		else
			vim.notify("No file put in", vim.log.levels.WARN)
		end
	end)
end

-- Ask what file to open then opens it in a vertical split
local NewVSplit = function()
	local current_dir = vim.fn.getcwd()
	vim.ui.input({ prompt = "Enter file path: " }, function(filename)
		if filename ~= nil and filename ~= "" then
			local filepath = current_dir .. "\\" .. filename
			if vim.fn.filereadable(filepath) == 1 then
				vim.cmd("vsplit " .. filename)
			else
				vim.notify("File does not exist in cwd", vim.log.levels.ERROR)
			end
		else
			vim.notify("No file put in", vim.log.levels.WARN)
		end
	end)
end

-- Create the user command
vim.api.nvim_create_user_command("OilDir", OilDir, {
	nargs = 1,
	complete = "file",
})

-- Create the user command
vim.api.nvim_create_user_command("EditFile", EditFile, {
	nargs = "+",
	complete = "file",
})

-- Create the user command
vim.api.nvim_create_user_command("AskNewFileName", AskNewFileName, { nargs = 0 })

-- Create user commands
vim.api.nvim_create_user_command("NewHSplit", NewHSplit, { nargs = 0 })
vim.api.nvim_create_user_command("NewVSplit", NewVSplit, { nargs = 0 })
