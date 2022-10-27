export EDITOR=/usr/bin/vim
export VISAL=/usr/bin/vim

setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt inc_append_history                                       # save commands are added to the history immediately, otherwise only when shell exits.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
DISABLE_UPDATE_PROMPT="true"
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action
autoload -U compinit colors zcalc
compinit -d
colors
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R
zmodload zsh/terminfo
function title {
  emulate -L zsh
  setopt prompt_subst

  [[ "$EMACS" == *term* ]] && return
  : ${2=$1}
  case "$TERM" in
    xterm*|putty*|rxvt*|konsole*|ansi|mlterm*|alacritty|st*)
      print -Pn "\e]2;${2:q}\a" # set window name
      print -Pn "\e]1;${1:q}\a" # set tab name
      ;;
    screen*|tmux*)
      print -Pn "\ek${1:q}\e\\" # set screen hardstatus
      ;;
    *)
    if [[ -n "$terminfo[fsl]" ]] && [[ -n "$terminfo[tsl]" ]]; then
      echoti tsl
      print -Pn "$1"
      echoti fsl
    fi
      ;;
  esac
}
ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TITLE_IDLE="%n@%m:%~"
function mzc_termsupport_precmd {
  [[ "${DISABLE_AUTO_TITLE:-}" == true ]] && return
  title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
}
function mzc_termsupport_preexec {
  [[ "${DISABLE_AUTO_TITLE:-}" == true ]] && return

  emulate -L zsh

  local -a cmdargs
  cmdargs=("${(z)2}")
  if [[ "${cmdargs[1]}" = fg ]]; then
    local job_id jobspec="${cmdargs[2]#%}"
    case "$jobspec" in
      <->) # %number argument:
        job_id=${jobspec} ;;
      ""|%|+) # empty, %% or %+ argument:
        job_id=${(k)jobstates[(r)*:+:*]} ;;
      -) # %- argument:
        job_id=${(k)jobstates[(r)*:-:*]} ;;
      [?]*) # %?string argument:
        job_id=${(k)jobtexts[(r)*${(Q)jobspec}*]} ;;
      *) # %string argument:
        job_id=${(k)jobtexts[(r)${(Q)jobspec}*]} ;;
    esac
    if [[ -n "${jobtexts[$job_id]}" ]]; then
      1="${jobtexts[$job_id]}"
      2="${jobtexts[$job_id]}"
    fi
  fi
  local CMD=${1[(wr)^(*=*|sudo|ssh|mosh|rake|-*)]:gs/%/%%}
  local LINE="${2:gs/%/%%}"
  title '$CMD' '%100>...>$LINE%<<'
}
autoload -U add-zsh-hook
add-zsh-hook precmd mzc_termsupport_precmd
add-zsh-hook preexec mzc_termsupport_preexec
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="/home/owner/.oh-my-zsh"
zstyle ':omz:update' frequency 13
zstyle ':omz:update' mode auto      # update automatically without asking
ENABLE_CORRECTION="true"
plugins=(
    ansible
    colorize
    kubectl
    kubectx
    helm
    tmux
    git
    git-prompt
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
    colored-man-pages
    command-not-found
    docker
    docker-compose
)
source <(kubectl completion zsh)
source <(helm completion zsh)

export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=true
export ZSH_THEME="powerlevel10k/powerlevel10k"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#export ZSH_THEME="spaceship"
source $ZSH/oh-my-zsh.sh
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
#alias gitu='git add . && git commit && git push'
alias gpa='git add .; git commit -m "$1"; git push;'
alias k=kubectl
alias d=docker
alias ls='exa'                                                         # ls
alias l='exa -lbF --git'                                               # list, size, type, git
alias ll='exa -lbGF --git'                                             # long list
alias llm='exa -lbGF --git --sort=modified'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
# one column, just names
alias lt='exa --tree --level=2'                                         # tree
alias cat=bat

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[assign]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[commandseparator]="fg=red"
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=green,bold"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=green"
ZSH_HIGHLIGHT_STYLES[globbing]="fg=magenta"
ZSH_HIGHLIGHT_STYLES[global-alias]="fg=yellow,bold"
ZSH_HIGHLIGHT_STYLES[history-expansion]="fg=magenta"
ZSH_HIGHLIGHT_STYLES[redirection]="fg=red"
ZSH_HIGHLIGHT_STYLES[path]="fg=white,underline"
ZSH_HIGHLIGHT_STYLES[path_pathseparator]="fg=white,bold,underline"

setopt APPEND_HISTORY SHARE_HISTORY INC_APPEND_HISTORY HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
alias vi="vim"
alias m="less "
alias -g M="| less"
alias -g W="| wc -l | sed 's/ //g'"
export PAGER=less
export LESSHISTFILE=/tmp/.lesshst
export LESSKEY=/tmp/.lesskey
export LESS=RWXij2
export LESS=${LESS}"Ps?f%f .?m(%i/%m) .%lt-%lb?L/%L. [%bB?B/%B.]?B %pB\%.?x N\:%x.%t"

GREP_ARGS=(--colour=always --with-filename --line-number --dereference-recursive --binary-files=without-match --exclude-dir=.git --exclude-dir=.tags)
alias -g G="| grep --colour=always"

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/home/owner/yandex-cloud/path.bash.inc' ]; then source '/home/owner/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/home/owner/yandex-cloud/completion.zsh.inc' ]; then source '/home/owner/yandex-cloud/completion.zsh.inc'; fi
