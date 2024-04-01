# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## key binding

<C is control
<S is shift
<A is option
<D is cmd

## neo tree

- `?` open keymap
- `h` collapse folder and go up to its parent folder
- `l` expand folder and go to the first child and open the file

## spell check

- general settings in `lua/config/autocmds.lua`
  where file types get specified and options get set
- spell check on symbols of a programming language needs to
  have treesitter configuration
- `:TSEditQuery highlights typescript`
  It lists all node types.
- Add node types and `@spell` in `./queries/typescript/highlights.scm`
- Own dictionary is in `./spell/en.utf-8.add`
