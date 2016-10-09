# My dotfiles

A bit of a rag-tag collection of my dotfiles, currently with no specific organisation.

Eventually I intend to impose a better structure on these configuration files.
The rough idea will be that, by default any file or directory inside any of the
app specific folders with a .symlink extension will be symlinked from the user's
home directory relative to the position it occupies within the dotfile app dir.

For example a `/dotfiles/vim/vimrc.symlink` would be symlinked to `$HOME/.vimrc`.
Assume we have vundle added as a git submodule at path
`/dotfiles/vim/bundle/Vundle.vim.symlink`. This should in turn be symlinked
to `$HOME/.vim/bundle/Vundle.vim`.

The base directory for symlinking might be modified by a file `.dotpath`
residing in the application directory. For example, i3's default user
config directory is `$HOME/.config/.i3/`. We might create an i3 directory
at `/dotfiles/i3` with a .dotpath file contaning `.config/i3/` so config 
files are symlinked from the correct location.

In the same vein, we might have an empty `.dotdesktop` file residing in the
directories which should be skipped if we invoke a setup routine with a skip
desktop argument, and a `.dotos` file indicating which operating systems the
configuration files are applicable to.
