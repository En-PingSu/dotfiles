
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/eps/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/eps/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/eps/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/eps/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(/opt/homebrew/bin/brew shellenv)"

alias sshk="ssh enpingsu@login.khoury.northeastern.edu"
alias la="ls -la"

cpwd() {
    # Get the current working directory
    local current_path="$PWD"

    # Copy to clipboard based on the OS
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        echo -n "$current_path" | pbcopy
        echo "Current path copied to clipboard: $current_path"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        if command -v xclip &> /dev/null; then
            echo -n "$current_path" | xclip -selection clipboard
            echo "Current path copied to clipboard: $current_path"
        elif command -v xsel &> /dev/null; then
            echo -n "$current_path" | xsel --clipboard --input
            echo "Current path copied to clipboard: $current_path"
        else
            echo "Error: xclip or xsel is required for clipboard functionality on Linux."
            return 1
        fi
    else
        echo "Error: Unsupported OS type."
        return 1
    fi
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"   # go install binaries (gopls, goimports, ...)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/eps/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/eps/google-cloud-sdk/path.zsh.inc'; fi

# ---- aliases & shell QoL (cherry-picked from kunchenguid/dotfiles, 2026-10-18) ----
# navigation
alias ..='cd ..'
# git
alias add='git add .'
alias push='git push'
alias pull='git pull'
alias m='git switch main'

# zsh autosuggestions: ghost-text completion from history; Ctrl-F accepts the suggestion
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^f' autosuggest-accept

# zsh syntax highlighting — keep this the LAST line sourced in .zshrc
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
