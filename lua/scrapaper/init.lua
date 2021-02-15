local _tag = '[scrapaper.nvim] '

local Scrapaper = {}

local _open_file = function(path)
  local p = vim.fn.glob(path)
  vim.cmd('e ' .. path)
  local bufnr = vim.api.nvim_get_current_buf()
  if p == nil or p == '' then
    local parent_dir = vim.fn.expand('%:p:h')
    if vim.fn.isdirectory(parent_dir) == 0 then
      vim.fn.mkdir(parent_dir, "p")
    end
  end

  return bufnr
end

local _insert_title = function(bufnr, title)
  vim.api.nvim_buf_set_lines(bufnr, -1, -1, true, {'', title})
end

Scrapaper.opts = {
  filepath = '~/.local/share/nvim/scrapaper/scrap.md',
  h_level = 2
}

Scrapaper.run = function()
  local _ = _open_file(Scrapaper.opts.filepath)
end

Scrapaper.run_with_title = function(title)
  local bufnr = _open_file(Scrapaper.opts.filepath)

  local header = ''
  for _ = 1, Scrapaper.opts.h_level do
    header = '#' .. header
  end

  _insert_title(bufnr, header .. ' ' .. title)
end

Scrapaper.setup = function(opts)

  if opts.filepath ~= nil then
    if type(opts.filepath == 'string') then
      Scrapaper.opts.filepath = opts.filepath
    else
      vim.api.nvim_err_writeln(_tag .. 'should filepath must be string')
    end
  end

  if opts.h_level ~= nil then
    if type(opts.h_level) == 'number' then
      Scrapaper.opts.h_level = opts.h_level
    else
      vim.api.nvim_err_writeln(_tag .. 'should h_level must be number')
    end
  end
end

return Scrapaper
