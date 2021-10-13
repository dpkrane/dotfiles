# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/Devel
source ~/.local/bin/virtualenvwrapper.sh
export EDITOR=/usr/bin/nvim
export VISAL=/usr/bin/nvim

