#!/bin/bash

SOURCE_DIR=$(chezmoi source-path)

cd "$SOURCE_DIR" &&
	source "$SOURCE_DIR/scripts/utils_install" &&
	source "$SOURCE_DIR/scripts/utils"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "Install packages\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ask_for_sudo

install_package_manager


print_in_purple "Essentials\n"

install_package "make"
install_package "cmake"
install_package "gcc"
install_package "base-devel"
install_package "ninja"
install_package "tree-sitter"
install_package "curl"

enable_multilib

install_blackarch_repo

install_tmux_plugin_manager

install_neovim

update

print_in_purple "Browsers\n"

install_package "firefox"
install_package "firefox-tridactyl"
install_package "chromium"

print_in_purple "Basics\n"

install_package "bat"
install_package "docker"
install_package "exa"
install_package "fd"
install_package "firejail"
install_package "git"
install_package "htop"
install_package "httpie"
install_package "nnn-nerd"
install_package "python"
install_package "ripgrep"
install_package "sad"
install_package "sd"
install_package "tmux"
install_package "zoxide"

print_in_purple "Infrastructure\n"

install_package "docker-compose"
install_package "helm"
install_package "k9s"
install_package "kubectl"
install_package "kubectx"
install_package "kubetail"
install_package "kubeval-bin"
install_package "minikube"

print_in_purple "Languages\n"

install_package "clang"
install_package "gcc"
install_package "go"
install_package "jdk-openjdk"
install_package "nodejs"
install_package "rust"

print_in_purple "Package managers\n"

install_package "npm"
install_package "python-pip"
install_package "python-poetry"
install_package "yarn"

print_in_purple "Formatters\n"

install_package "gofumpt"
install_package "pgformatter"
install_package "prettier"
install_package "prettierd"
install_package "python-black"
install_package "python-isort"
install_package "shfmt"
install_package "stylua"

print_in_purple "Linters\n"

install_package "eslint"
install_package "flake8"
install_package "python-pylint"
install_package "rust-analyzer"
install_package "shellcheck"
install_package "sqlfluff"
install_package "stylelint"

print_in_purple "Interpreters\n"

install_package "ipython"
install_package "yaegi"

print_in_purple "Misc\n"

install_package "go-swagger"
install_package "golang-mockery"
install_package "gomodifytags"
install_package "python-coverage"
install_package "python-notedown"
install_package "python-pynvim"
install_package "python-numpy"
install_package "python-matplotlib"
install_package "texlive-latexextra"
install_package "texlive-science"

print_in_purple "Development tools\n"

install_package "ctags"
install_package "curl"
install_package "direnv"
install_package "exercism-bin"
install_package "git-delta"
install_package "gitbatch"
install_package "github-cli"
install_package "hey"
install_package "hugo"
install_package "jupyterlab"
install_package "lazydocker"
install_package "lazygit"
install_package "mermaid-cli"
install_package "pgcli"
install_package "python-jupytext"
install_package "visual-studio-code-bin"

print_in_purple "Communication\n"

install_package "caprine"
install_package "signal-desktop"

print_in_purple "Multimedia\n"

install_package "gimp"
install_package "imagemagick"
install_package "imv"
install_package "inkscape"
install_package "mpv"
install_package "ncspot"
install_package "spotify"
install_package "xournalpp"
install_package "krita"

print_in_purple "Miscellaneous\n"

install_package "acpi"
install_package "acpi_call"
install_package "aspell-en"
install_package "bitwarden"
#install_package "bitwarden-cli"
install_package "bleachbit"
install_package "calibre"
install_package "graphviz"
install_package "lftp"
install_package "libqalculate"
install_package "man-db"
install_package "man-pages"
install_package "moreutils"
install_package "ncdu"
install_package "qrencode"
install_package "step-cli"
install_package "tealdeer"
install_package "tk"
install_package "tokei"
install_package "translate-shell"
install_package "transmission-cli"
install_package "util-linux"
install_package "virtualbox"
install_package "words"
install_package "yt-dlp"
install_package "zathura"
install_package "zathura-pdf-poppler"
install_package "zbar"
install_package "zstd"
install_package "syncthing"

install_nnn_plugins

print_in_purple "Fonts\n"

install_package "noto-fonts"
install_package "noto-fonts-emoji"
install_package "ttf-courier-prime"
install_package "ttf-roboto-mono"

print_in_purple "Penetration testing\n"

install_package "aircrack-ng"
install_package "bettercap"
install_package "dirb"
install_package "hydra"
install_package "macchanger"
install_package "nmap"
install_package "reaver"
install_package "whatweb"
install_package "wireshark-qt"

print_in_purple "Shell\n"

install_package "alacritty"
install_package "fish"
install_package "fisher"
install_package "hyperfine"
install_package "starship"
install_package "theme.sh"

print_in_purple "Fish plugins\n"

install_fish_plugin "PatrickF1/fzf.fish" "fzf.fish"
install_fish_plugin "danhper/fish-ssh-agent" "fish-ssh-agent"
install_fish_plugin "evanlucas/fish-kubectl-completions" "kubectl-completions"
install_fish_plugin "franciscolourenco/done" "done"
install_fish_plugin "jorgebucaran/autopair.fish" "autopair.fish"
install_fish_plugin "jorgebucaran/nvm.fish" "nvm.fish"
install_fish_plugin "jorgebucaran/replay.fish" "replay"
install_fish_plugin "lgathy/google-cloud-sdk-fish-completion" "gcloud-completion"
install_fish_plugin "gazorby/fish-abbreviation-tips" "fish-abbreviation-tips"
install_fish_plugin "nickeb96/puffer-fish" "puffer-fish"
install_fish_plugin "jorgebucaran/replay.fish" "replay.fish"
install_fish_plugin "meaningful-ooo/sponge" "sponge"

print_in_purple "Utilities\n"

install_package "advcpmv"
install_package "age"
install_package "ancient-packages"
install_package "asciinema"
install_package "btop"
install_package "cups"
install_package "dog"
install_package "downgrade"
install_package "duf"
install_package "etcher-bin"
install_package "fzf"
install_package "gvfs"
install_package "jc"
install_package "bc"
install_package "jq"
install_package "libreoffice-still"
install_package "lsof"
install_package "neofetch"
install_package "net-tools"
install_package "newsboat"
install_package "nm-connection-editor"
install_package "noisetorch-bin"
install_package "openresolv"
install_package "p7zip"
install_package "paruz"
install_package "pmount"
install_package "rclone"
install_package "restic"
install_package "rkhunter"
install_package "strace"
install_package "system-config-printer"
install_package "sysz"
install_package "tcpdump"
# install_package "timeshift"
# install_package "timeshift-autosnap"
install_package "tlp"
install_package "tlp-rdw"
install_package "unzip"
install_package "viu"
install_package "wireguard-dkms"
install_package "wireguard-tools"
install_package "obs-studio"
install_package "qbittorrent"
install_package "pipes.sh"

gem install tmuxinator

print_in_purple "Games\n"
install_package "steam"
install_package "heroic-games-launcher-bin"

#install_kernels

#install_drivers

#install_sway

print_in_purple "GO packages\n"

install_go_package "github.com/cosmos72/gomacro@latest" "gomacro"                                   # aur - outdated
install_go_package "github.com/nametake/golangci-lint-langserver@latest" "golangci-lint-langserver" # no aur (yet)

print_in_purple "NPM packages\n"

install_npm_package "typescript"

#spotify_perms

#install_nvidia
#install_audio

install_hyprland

#install_npm_package "typescript-language-server"
#install_npm_package "vscode-langservers-extracted"
# slidev - markdown based presentations with a lot of feature, but still in beta
#install_npm_package "@slidev/cli"
# gitmoji-cli - gitmoji interactive client for using gitmojis on commit messages
#install_npm_package "gitmoji-cli"
#install_npm_package "@prisma/language-server"

# print_in_purple "PIP packages\n"

# install_pip_package "" ""

# print_in_purple "GH plugins\n"
#
# install_gh_plugin "dlvhdr/gh-prs"

clean_up_cache
