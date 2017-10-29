# stack.vim

stack.vim is a relatively naive tiling window manager for Vim. It takes into account the terminal dimensions to split in an intelligent (to the author) way. With larger screen sizes being more prevalent, a h-stack type layout for a text editor makes sense.

I kept forgetting the Vim commands to layout my splits in a way that made sense to me so I wrote this to do it for me.

## Usage

stack.vim currently support h-stack and v-stack type layouts, depending on session size. For portrait-type dimensions it defaults to h-stack and for landscape-type dimensions, v-stack. With varying font preferences, it's impossible in the terminal to tell the true dimensions of the window so we use `&columns` and `&lines` to make a reasonable guess. More information under [config](#config0).

## Layouts

#### h-stack
```
+-----------------------+
|                       |
|                       |
|                       |
|                       |
|                       |
|                       |
|                       |
|                       |
+-------+-------+-------+
|       |       |       |
|       |       |       |
|       |       |       |
|       |       |       |
+-------+-------+-------+
```

#### v-stack
```
+-------------------+-------------+
|                   |             |
|                   |             |
|                   +-------------+
|                   |             |
|                   |             |
|                   +-------------+
|                   |             |
|                   |             |
+-------------------+-------------+
```

## Installation

If you don't have a preferred installation method, check out [pathogen.vim](https://github.com/tpope/vim-pathogen) or [Vundle](https://github.com/VundleVim/Vundle.vim).

## Config

`g:stack#config#min_columns`<br />
Number of columns required to flip the layout to v-stack (default: 160)

`g:stack#config#min_lines`<br />
Number of lines required to flip the layout to h-stack (default: 70)

`g:stack#config#default_mapping`<br />
Add the default key maps (default: true)

## Key Mappings
Keys | Command
---- | -------
<kbd>Ctrl</kbd><kbd>n</kbd> | `StackNewWindow`
<kbd>Ctrl</kbd><kbd>c</kbd> | `StackCloseWindow`
<kbd>Ctrl</kbd><kbd>l</kbd> | `StackPromoteWindow`

## TODO

- [  ] Add a columns layout for larger terminal sizes
- [  ] Expand [help text](/doc/stack.txt)

## License

Copyright (c) Cameron Daniel. Distributed under the same terms as Vim itself. See `:help license`

