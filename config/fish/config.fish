source $HOME/.cargo/env
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish
# source /etc/modules/init/fish
# export PATH="$PATH:/usr/lib/jvm/default/bin"
[ -f /usr/local/opt/modules/init/fish ]; and source /usr/local/opt/modules/init/fish
[ -f /etc/module/init/fish ]; and source /usr/local/opt/modules/init/fish
export MODULESPATH=$HOME/software/modulefiles

if [ (uname -s) = "Darwin" ]
    # set -x HOMEBREW_BOTTLE_DOMAIN https://mirrors.ustc.edu.cn/homebrew-bottles
    # set -x HOMEBREW_BOTTLE_DOMAIN https://mirrors.geekpie.club/homebrew-bottles
    set HB_CNF_HANDLER (brew --repository)"/Library/Taps/homebrew/homebrew-command-not-found/handler.fish"
    if test -f $HB_CNF_HANDLER
        source $HB_CNF_HANDLER
    end
end
alias py="ipython"
alias py3="ipython3"
alias matlab="matlab -nodesktop -nosplash"
alias pydocserver="python3 -m pydoc -p 80"
alias c="cd ~/cc"
# Alias for macOS with GNU coreutils
if [ (uname -s) = "Darwin" ]
alias tac gtac
alias head ghead
alias readelf greadelf
alias ldd 'otool -L'
end

# alias swift='env PATH="/usr/bin:$PATH" swift'
# alias rust-lldb='env PATH="/usr/bin:$PATH" rust-lldb'
# alias rust-gdb='env PATH="/usr/bin:$PATH" rust-gdb'
# alias lldb='env PATH="/usr/bin:$PATH" lldb'

# /usr/local/bin/thefuck --alias | source

set -x RUST_SRC_PATH (rustc --print sysroot)"/lib/rustlib/src/rust/src"

if not string match -q -- "*-m*" $FZF_DEFAULT_OPTS
    set -x FZF_DEFAULT_OPTS '-m' $FZF_DEFAULT_OPTS
end
set -x FZF_DEFAULT_COMMAND 'fd --type f'
set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_PREVIEW_FILE_CMD "head -c10000"
set -x FZF_PREVIEW_DIR_CMD "exa"
# set -U FZF_COMPLETE 2
set -x FZF_ENABLE_OPEN_PREVIEW 1

if [ (uname -s) = "Darwin" ]
set -x -p PATH "/usr/local/opt/qt/bin"
set -x -p PATH "/usr/local/opt/bc/bin"
set -x -p PATH "/usr/local/opt/file-formula/bin"
set -x -p PATH "/usr/local/texlive/2016/bin/x86_64-darwin/latex"
end
set -x -p PATH "$HOME/.myutils/bin/"
set -x -p PATH "$HOME/.local/bin/"

# alias from oh-my-zsh
# alias '-' 'cd -'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias 0='cd ~/cc/0'
alias 1='cd -'
alias 2='prevd 2'
#alias 3='cd -3'
#alias 4='cd -4'
#alias 5='cd -5'
#alias 6='cd -6'
#alias 7='cd -7'
#alias 8='cd -8'
#alias 9='cd -9'
abbr md mkdir -p

set -x GPG_TTY (tty)

set -g fish_prompt_pwd_dir_length 0

alias tmuxa='tmux a -t daily || tmux new -s daily'
alias em='emacs -nw'

if [ (uname -s) = "Darwin" ]
    set -x PAGER '/usr/local/bin/less -is -R --mouse'
else
    set -x -a PERL5LIB /usr/share/tlpkg
    alias tlmgr '/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'
end

# set -x LESS '-R --mouse'
set -x EDITOR 'nvim'

function hybrid_bindings --description "Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings hybrid_bindings

# RK: disable 24bit color if not using HEAD mosh
# disable24bit

# function l --description 'Using exa for l'
#     exa -lgaa $argv
# end
abbr ls exa
abbr l exa
function ll --description 'Using exa for ll'
    exa -lg $argv
end
function la --description 'Using exa for la'
    exa -lga $argv
end
function laa --description 'Using exa for laa'
    exa -lgaa $argv
end
function lt --description 'List file in tree'
    exa -RT $argv
end
function llt --description 'List file in long mode tree'
    exa -lRT $argv
end

abbr du dua
abbr cat bat

#alias less='bat --paging=always'
alias tless='tmux splitw -dI'  # Usage: make 2>&1 | tless &

starship init fish | source

alias asdf='setxkbmap dvorak'
alias aoeu='setxkbmap us'
