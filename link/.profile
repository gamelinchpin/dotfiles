
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

echo '.profile works!'

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# tells Readline to perform filename completion in a case-insensitive fashion
# bind "set completion-ignore-case on"

# filename matching during completion
# will treat hyphens and underscores as equivalent
# bind "set completion-map-case on"

# will get Readline to display all possible matches
# for an ambiguous pattern at the
# first <Tab> press instead of at the second
# bind "set show-all-if-ambiguous on"

# no bell sound on error
# bind "set bell-style none"

# enable vi like bindings
# http://blog.sanctum.geek.nz/vi-mode-in-bash/
set -o vi

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# append to the history file, don't overwrite it
shopt -s histappend

# save multi-line commands as one command
shopt -s cmdhist

# no need to type cd (works for .. but not -, although alias -- -='cd -' fixes it)
shopt -s autocd 2>/dev/null

# autocorrect minor spelling errors
shopt -s dirspell 2>/dev/null
shopt -s cdspell 2>/dev/null

# check windows size if windows is resized
shopt -s checkwinsize 2>/dev/null

# use extra globing features. See man bash, search extglob.
shopt -s extglob 2>/dev/null

# include .files when globbing.
shopt -s dotglob 2>/dev/null

# force colours
force_color_prompt=yes

# use colour prompt
color_prompt=yes

# dircolors
if [[ -e $HOME/.dircolors ]]; then
  if which gdircolors >/dev/null; then
      eval `gdircolors $HOME/.dircolors`
  elif which dircolors >/dev/null; then
      eval `dircolors $HOME/.dircolors`
  fi
fi

read -r -d '' git_icons <<- EOF
* unstaged changes
+ staged but uncommitted changes
$ stashed changes
% untracked files
> local commits on HEAD not pushed to upstream
< commits on upstream not merged with HEAD
= HEAD points to same commit as upstream
EOF

echo -e "I am: "`whoami` on `hostname`;
if [ "$OS" = "Linux" ]; then
  echo -e "Sysinfo:" `uname -o` - "Kernel" `uname -r`
elif [ "$OS" = "Darwin" -o "$OS" = "FreeBSD" ]; then
  echo -e "Sysinfo:" `uname` - "Kernel" `uname -r`
fi
echo -e "Status:" `uptime`

export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/esp/xtensa-esp32-elf/bin:$PATH"
export IDF_PATH="$HOME/esp/esp-idf"


