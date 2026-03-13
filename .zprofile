# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

alias gitl='git log --graph --pretty=oneline --abbrev-commit --all --decorate'
alias v='nvim'
PROMPT="%1d> "
alias lg='lazygit'

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Added by Toolbox App
export PATH="$PATH:/Users/senya/Library/Application"
export PATH="$PATH:/opt/homebrew/bin/"
export PATH="$PATH:/opt/homebrew/sbin/"


export EDITOR=/opt/homebrew/bin/nvim
export VISUAL="$EDITOR"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Added by OrbStack: command-line tools and integration
# Comment this line if you don't want it to be added again.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# >>> JVM installed by coursier >>>
# export JAVA_HOME="/Users/senya/Library/Caches/Coursier/arc/https/github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.6%252B7/OpenJDK21U-jdk_aarch64_mac_hotspot_21.0.6_7.tar.gz/jdk-21.0.6+7/Contents/Home"
# <<< JVM installed by coursier <<<

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-23.jdk/Contents/Home
# >>> coursier install directory >>>
export PATH="$PATH:/Users/senya/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<
#
export ANDROID_HOME="/Users/senya/Library/Android/sdk"

