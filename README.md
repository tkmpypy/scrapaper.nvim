# scrapaper.nvim

Provides a command to open a single memo buffer from anywhere.

## Installation

```lua
use {
  'tkmpypy/scrapaper.nvim',
  config = function()
      require('scrapaper').setup {
          filepath = '~/Dropbox/scrap.md',
          h_level = 2
      }
  end
}
```

## Usage

| command                    | description                                   |
| -------------------------- | --------------------------------------------- |
| Scrapaper                  | Open scrap file                               |
| ScrapaperWithTitle {title} | Insert title end of line when open scrap file |

## Configure

| variable | description                                                       |
| -------- | ----------------------------------------------------------------- |
| filepath | Scrap file path (default: ~/.local/share/nvim/scrapaper/scrap.md) |
| h_level  | Specify header level when insert title text (default: 2)          |
