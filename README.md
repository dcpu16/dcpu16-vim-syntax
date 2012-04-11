#Description
This enables DCPU-16 syntax highlighting for files with a `.dasm` or `.dasm16` extension.

#How to Install
1. Deploy these files into the first directory in your `runtimepath` in Vim.
  * You can check what this directory is with the following command in Vim: `:echo split(&runtimepath, ',')[0]`
  * For example, on a UNIX system this directory is usually `$HOME/.vim`
2. Keep files in their directories.
  * For example, `syntax/foo.vim` would go into `$HOME/.vim/syntax/foo.vim`
3. Restart Vim and the syntax highlighting should work.