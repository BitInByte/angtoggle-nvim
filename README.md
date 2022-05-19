# angtoggle-nvim

## Install

### Packer

```lua
    use { "BitInByte/angtoggle-nvim" }
```

## Requirements

- Neovim 0.4

## Example Keymapings
```lua
    vim.api.nvim_set_keymap("n", "<leader>at", "<cmd>Angtoggle toggle<CR>", {silent = true})
```
| Function Name               | Description                                                      |
| :----------------------- | :----------------------------------------------------------------|
| `toggle` | Toggle file between typescript and html. |
| `swap_css` | Swap to css file (check if it is sass file). |
| `swap_html` | Swap to html file. |
| `swap_ts` | Swap to typescript file. |

