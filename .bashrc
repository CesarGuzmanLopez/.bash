#!/bin/bash
# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# Path to your oh-my-bash installation.
if [ -n $OSH ] ; then
   export OSH=/home/cesar/.bash_vim
fi

#source $OSH/tardis.sh
OSH_THEME="kitsune"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"


# Uncomment the following line to disable colors in ls.

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Uncomment the following line if you do not want OMB to overwrite the existing
# aliases by the default OMB aliases defined in lib/*.sh
OMB_DEFAULT_ALIASES="check"

# Would you like to use another custom folder than $OSH/custom?
# OSH_CUSTOM=/path/to/new-custom-folder

# To disable the uses of "sudo" by oh-my-bash, please set "false" to
# this variable.  The default behavior for the empty value is "true".
OMB_USE_SUDO=true

# Which completions would you like to load? (completions can be found in .oh-my-bash/completions/*)
# Custom completions may be added to .oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.

completions=(
  git
  composer
  ssh

)

# Which aliases would you like to load? (aliases can be found in .oh-my-bash/aliases/*)
# Custom aliases may be added to .oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
  chmod
  ls
  misc
)

# Which plugins would you like to load? (plugins can be found in .oh-my-bash/plugins/*)
# Custom plugins may be added to .oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bashmarks
)

# Which plugins would you like to conditionally load? (plugins can be found in .oh-my-bash/plugins/*)
# Custom plugins may be added to .oh-my-bash/custom/plugins/
# Example format: 
#  if [ "$DISPLAY" ] || [ "$SSH" ]; then
#      plugins+=(tmux-autoattach)
#  fi

source "$OSH"/oh-my-bash.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# ssh
# export SSH_KEY_PATH=".ssh/rsa_id"



[ -f ~/.fzf.bash ] && source ~/.fzf.bash
mkdir -p ~/.vim/undodir
force_color_prompt=yes

bg_color=$(echo "$COLORFGBG" | cut -d ";" -f2)


function wallpaper_color() {
  # Obtener el color del fondo de pantalla de la variable $COLORFGBG
  bg_color=$(echo "$COLORFGBG" | cut -d ";" -f2)

  # Determine si el color es claro o oscuro
  if [[ $bg_color -ge 8 ]]; then
    echo "dark"
  else
    echo "light"
  fi
}

if [[ $(wallpaper_color) == "dark" ]]; then
  alias nvim="nvim -c\"colo zellner\" -c\"hi Normal guibg=NONE ctermbg=NONE\" -c\":hi LineNr guifg=#010001\" "
fi

alias a-grep='grep -lirs --exclude-dir=".git;.svn" --color=always'

function a-find () {
  find $1 -type f -not -path "*/\.git/*"
}
export -f a-find

function :q () {
  echo "use exit remember?"
  sleep 1
  exit
}

FZF_CTRL_T_OPTS="--preview 'bat --style=full --color=always --line-range :500 {}' --preview-window '~3' --bind='F2:toggle-preview,shift-up:preview-up,shift-down:preview-down' --color --height='90%'"
FZF_DEFAULT_OPTS="--height='30%' --layout='reverse'"

export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/\.git/*'"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.

export -f _fzf_compgen_path
export -f _fzf_compgen_dir
# agrego el comando para que se actuve al presionar ctrl + g

function custom_fzf_search() {
  rg --color=always --line-number --no-heading --smart-case "${*:-}" |
    fzf --ansi \
        --color "hl:-1:underline,hl+:-1:underline:reverse" \
        --delimiter : \
        --preview 'bat --color=always {1} --highlight-line {2}' \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' |
    awk -F: '{print $1}' |
    xargs nvim

}
#verifico que exista el comando xargs y si no mande un mensaje de error
if ! command -v xargs &> /dev/null
then
    echo "xargs could not be found"
    echo "install xargs"
    exit
fi
bind -x '"\C-f": custom_fzf_search'



_fzf_compgen_path() {
  echo "$1"
  command find -L "$1" \
    -name .git -prune -o -name .hg -prune -o -name .svn -prune -o \( -type d -o -type f -o -type l \) \
    -a -not -path "$1" -print 2> /dev/null | sed 's@^\./@@'
  }
_fzf_compgen_dir() {
    command find -L "$1" \
      -name .git -prune -o -name .hg -prune -o -name .svn -prune -o -type d \
      -a -not -path "$1" -print 2> /dev/null | sed 's@^\./@@'
    }

_fzf_comprun() {
  local command=$1
  shift
  case "$command" in
    cd)           find . -type d -not -path '*/\.git/*' | fzf  --preview 'tree -C {} -I ".git"| head -200' --color --height='40%' ;;
    export|unset) fzf  --preview "eval 'echo \$'{}" --height='40%' ;;
    " "| "" )     echo error  ;;
    *)            find .| fzf  --preview 'bat --style=full --color=always --line-range :500 {}' \
                          --preview-window '~3' --bind='F2:toggle-preview,shift-up:preview-up,shift-down:preview-down'  \
                          --color --height='50%';;
  esac
}

__get_first_arg() {
  echo "$1"
}
insertar_texto() {
 if [[ -z  ${READLINE_LINE//[$'\t\n ']} ]]; then
    Grep;
else

    local result="$(_fzf_comprun $(__get_first_arg $READLINE_LINE))";
    READLINE_LINE=$(echo "$READLINE_LINE" | awk -v texto="$result" -v  posicion="$READLINE_POINT" '{print substr($0,1,posicion-1) " " texto " " substr($0,posicion)} ');
    READLINE_POINT=$(( $READLINE_POINT +  ${#result} + 1));
  fi;
}

bind -x '"\C-t":insertar_texto'


