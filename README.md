# 💤 LazyVim

This is based on a starter template for [LazyVim](https://github.com/LazyVim/LazyVim), with some modifications to work with R files. This configuration is based off of the one from [Dan Kelley](https://github.com/dankelley/nvim.git). Refer to the [documentation](https://lazyvim.github.io/installation) to get started with lazyvim.

## cmp-r issues that occurred on 2024-12-12

After a lazyvim update, it started showing errors such as below:
<details>
  <summary>Nvim error output</summary>
Failed to source `/home/richardsc/.local/share/nvim/lazy/cmp-r/after/plugin/cmp_r.lua`

vim/_editor.lua:0: /home/richardsc/.config/nvim/init.lua..nvim_exec2() called at /home/richardsc/.config/nvim/init.
lua:0../home/richardsc/.local/share/nvim/lazy/cmp-r/after/plugin/cmp_r.lua: Vim(source):E5113: Error while calling
lua chunk: ...rdsc/.local/share/nvim/lazy/cmp-r/after/plugin/cmp_r.lua:1: module 'cmp' not found:
^Ino field package.preload['cmp']
^Icache_loader: module 'cmp' not found
^Icache_loader_lib: module 'cmp' not found
^Ino file './cmp.lua'
^Ino file '/usr/share/luajit-2.1.0-beta3/cmp.lua'
^Ino file '/usr/local/share/lua/5.1/cmp.lua'
^Ino file '/usr/local/share/lua/5.1/cmp/init.lua'
^Ino file '/usr/share/lua/5.1/cmp.lua'
^Ino file '/usr/share/lua/5.1/cmp/init.lua'
^Ino file './cmp.so'
^Ino file '/usr/local/lib/lua/5.1/cmp.so'
^Ino file '/usr/lib/x86_64-linux-gnu/lua/5.1/cmp.so'
^Ino file '/usr/local/lib/lua/5.1/loadall.so'
stack traceback:
^I[C]: in function 'require'
^I...rdsc/.local/share/nvim/lazy/cmp-r/after/plugin/cmp_r.lua:1: in main chunk
^I[C]: in function 'nvim_exec2'
^Ivim/_editor.lua: in function 'cmd'
^I...local/share/nvim/lazy/lazy.nvim/lua/lazy/core/loader.lua:510: in function <...local/share/nvim/lazy/lazy.nvim/
lua/lazy/core/loader.lua:509>
^I[C]: in function 'xpcall'
^I.../.local/share/nvim/lazy/lazy.nvim/lua/lazy/core/util.lua:135: in function 'try'
^I...local/share/nvim/lazy/lazy.nvim/lua/lazy/core/loader.lua:509: in function 'source'
^I...local/share/nvim/lazy/lazy.nvim/lua/lazy/core/loader.lua:457: in function 'source_runtime'
^I...local/share/nvim/lazy/lazy.nvim/lua/lazy/core/loader.lua:150: in function 'startup'
^I...ardsc/.local/share/nvim/lazy/lazy.nvim/lua/lazy/init.lua:112: in function 'setup'
^I/home/richardsc/.config/nvim/lua/config/lazy.lua:17: in main chunk
^I[C]: in function 'require'
^I/home/richardsc/.config/nvim/init.lua:2: in main chunk

stacktrace:
- vim/_editor.lua:0 _in_ **cmd**
- lua/config/lazy.lua:17
- init.lua:2
</details>

While I'm not 100% sure why this happened, it seems to be a defaults change in LazyVim so that the nvim-cmp plugin is no longer enabled by default. To fix, open nvim, hit "x" to get the Extras menu, navigate to find `coding.nvim-cmp`, and hit "x" to enable it.

On the other hand, the completion engine that seems to be provided as default now ([Blink])[https://www.lazyvim.org/extras/coding/blink] actually seems pretty good! Maybe I should try it for awhile.

## fzf instead of telescope as default in LazyVim 14.0

See:

https://github.com/LazyVim/LazyVim/releases/tag/v14.0.0

where fzf is now the default "picker" in LazyVim, instead of telescope. In order to get a new enough version on Ubuntu 22.04 I had to install homebrew and install it that way.

## 2024-12-17: Some stuff I've been learning:

* open a terminal in the root directory with <leader>ft and in the current directory with <leader>fT.
* open a file browser split with neo-tree in root using <leader>e and in cwd with <leader>E
  - to show hidden files in the neo-tree type H
* open a buffer explorer with <leader>be
* switch between splits using: Ctrl-j/k/h/l
* cancel a split with Ctrl-w q.

## Fix the markdown line-length warning (i.e. make it go away), from [Dan](github.com/dankelley/nvim.git)

Create a file in the same directory of your markdown file, named .markdownlint.yaml and containing the following. I got this hint from a posting by David Anson, who is the author of markdownlint and so I think this is a good source.

MD013: false

### Better solution to the MD013 warning:

The above solution was bugging me, because it isn't global, so I had to create the yaml file in every directory that I am editing a markdown file. Some extended googling and trial and error lead me to [here](https://github.com/LazyVim/LazyVim/discussions/4094#discussioncomment-10178217), which, after adding the `lua/plugins/lint.lua` file as below:

```lua
local HOME = os.getenv("HOME")
return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", HOME .. "/.markdownlint-cli2.yaml", "--" },
      },
    },
  },
}
```
and then creating the `.markdownlint-cli2.yaml` file as decribed, i.e. with:
```yaml
config:
  MD013: false
```
had the desired effect!

## blink.cmp and changing keybindings

I've switched to using the (now default) blink.cmp completion engine, and I've been trying to figure out how to change the keybindings. Currently what I've been using in my configuration for blink is something like the following:
```{lua}
return {
    {
        "saghen/blink.cmp",
        opts = {
            keymap = {
                preset = "default",
                ["<TAB>"] = { "select_and_accept" },
            },
        }
    }
}
```
which is supposed to change the default "select_and_accept" keybinding from <CR> to <TAB>. The problem is that it seems to work somewhat inconsistently, especially on MacOS/iterm2, and I don't know why.

Another source that might be helpful is from [someone's dotfile config](https://github.com/garlicbreadcleric/nvim-config/blob/12460a0a84a533d14e5489dfa2f5d3d8346e7923/lua/features/completion.lua#L5). I don't think I'd want to change the default "up"/"down" navigation keybindings, but apparently this is supposed to work. Perhaps I should just accept the other default of "<c-y>" which seems to be pretty common.

## TODO: Snippets

Something else I need to learn about, and implement, is how to use snippets. One options I have seen around is `luasnip`.

This looks like a good resource:

https://www.youtube.com/watch?v=sBbplGeFffY&t=1s

## Lazygit

After reading about lazygit in the [LVFAD book](https://lazyvim-ambitious-devs.phillips.codes/), I installed it (using `brew` for both MacOS and WSL Ubuntu), and am really liking it. 

### lazygit-confirm

One complaint though is that I sommetimes found that I'd fire up lazygit when I had unsaved buffers, which would then mean I'd need to fire it up again and either amend the commit or create another commit (hello "." commit messages ...). Somewhat randomly while browsing r/nvim, I saw [the lazygit-confirm](https://github.com/thelastpsion/lazygit-confirm.nvim) plugin, which simply pops up a confirmation dialog, and can be configured with an option to just "Save (A)ll and Continue", which saves the buffers and _then_ opens lazygit.

A problem with this, is that the Ubuntu neovim unstable version (as of 2025-01-29) has a bug that causes the confirmation dialog to not display. Just going to wait out the fix, because trying to find other Ubuntu compatible neovim versions is a pain.

I can't wait to see what other cool stuff I can learn about in the LazyVim book!

## Rolling back a plugin update

It's so easy to just update all plugins to the most bleeding edge version, but sometimes that can break things. If you want to roll back a plugin update, you can do so by running the following command in nvim:

```vim
:Lazy log
```

which will show the recent history of all installed plugins. For the one you want to roll back, move the cursor to the commit you want (e.g. hover on the commit hash), and hit "r" to roll back to that commit. You can also use the `:Lazy revert` command to revert a plugin to a specific commit.

There are some helpful tips [here](https://www.reddit.com/r/neovim/comments/1d6iabx/how_do_you_revert_from_lazy_plugin_update/)
