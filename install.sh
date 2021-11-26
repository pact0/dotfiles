#!/bin/bash # a work in progress
# helpers

export NODE_VERSION=0.14.x
mkif () {
    if [ ! -d $1 ]; then
        mkdir -p $1;
    fi
}

touchif() { mkdir -p "$(dirname "$1")" && touch "$1" ; }

mkln() {
    if [[ ! -e $1 || ! -e $2 ]];
    then
        mkif $1
        rm $2
        ln -s $1 $2
    fi
}

sourceif() {
    if [[ -e $1 ]]
    then
        source $1
    fi
}

logme(){
    if [[ "$*" == *"--main"* ]]; 
    then
        message=$(echo $* | sed 's/--main//g')
        echo "$PURPLE$message$RESTORE";
        echo $TAB$LBLACK$0$RESTORE;
        echo $TAB$LBLACK$(TZ=":America/Chicago" date +"%b %d %Y %I:%M %p America/Chicago") $RESTORE;

    else
        echo "$LCYAN$*$RESTORE";
    fi
}

# https://gist.github.com/elucify/c7ccfee9f13b42f11f81

RESTORE=$(echo -en '\033[0m')
BLACK=$(echo -en '\033[00;30m')
RED=$(echo -en '\033[00;31m')
GREEN=$(echo -en '\033[00;32m')
LYELLOW=$(echo -en '\033[00;33m')
BLUE=$(echo -en '\033[00;34m')
MAGENTA=$(echo -en '\033[00;35m')
PURPLE=$(echo -en '\033[00;35m')
CYAN=$(echo -en '\033[00;36m')
LGRAY=$(echo -en '\033[00;37m')
LRED=$(echo -en '\033[01;31m')
LGREEN=$(echo -en '\033[01;32m')
YELLOW=$(echo -en '\033[01;33m')
LBLUE=$(echo -en '\033[01;34m')
LMAGENTA=$(echo -en '\033[01;35m')
LPURPLE=$(echo -en '\033[01;35m')
LCYAN=$(echo -en '\033[01;36m')
WHITE=$(echo -en '\033[01;37m')
LBLACK=$(echo -en '\033[00;90m')

runner(){
    logfile="${HOME}/install_logs/$(basename $1).log"
    touchif $logfile
    echo -e "$PURPLE Starting $1 $RESTORE \n $TAB $LBLACK$(TZ=":America/Chicago" date +"%b %d %Y %I:%M %p America/Chicago")$RESTORE"
    echo -e "$PURPLE Starting $1 $RESTORE \n $TAB $LBLACK$(TZ=":America/Chicago" date +"%b %d %Y %I:%M %p America/Chicago")$RESTORE" >> $logfile
    passmsg="$TAB $GREEN ✅   success on $(basename $1) $RESTORE"
    failmsg="$TAB $RED ❌   Failed to run $(basename $1) $BLUE \n$TAB see log $YELLOW $logfile $RESTORE"
    local dir=$(pwd)
    $1 2>&1 | tee $logfile && $(stat=$passmsg && cd $dir) || $(stat=$failmsg && cd $dir)
    echo $stat
    echo $stat >> $logfile
}


# install

install_apt () {
    _install_apt () {
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get install --no-install-recommends -y \
        build-essential \
        cmake \
        command-not-found \
        curl \
        figlet \
        fuse \
        g++ \
        gettext \
        git  \
        htop \
        jq \
        less \
        libcurl4-gnutls-dev \
        libevent-dev \
        libexpat1-dev \
        libfuse2 \
        libghc-zlib-dev \
        libncurses5-dev \
        libssl-dev \
        m4 \
        m4-doc \
        make \
        pandoc \
        perl \
        python3-apt \
        python3-distutils \
        python3-venv \
        software-properties-common \
        sudo \
        tmux \
        tzdata \
        unzip \
        wget \
        xbindkeys \
        zsh
    }
        # fd-find \
        # ripgrep \
        # silversearcher-ag \
        # universal-ctags \
        # vifm \
    runner _install_apt
}

install_python () {
    _install_python () {
        mkif ~/miniconda3
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
        bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3

        bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
        rm -rf ~/miniconda3/miniconda.sh
        ~/miniconda3/bin/conda init bash
        ~/miniconda3/bin/conda init zsh
        source ~/.bashrc

        python -m pip install --upgrade pip && \
        # start pip installs
        python -m pip install \
            awscli \
            black \
            flake8 \
            interrogate \
            ipython \
            mypy \
            pre-commit \
            pynvim \
            visidata
            # end pip install
        conda config --set changeps1 false
    }
    runner _install_python
}

install_git () {
    _install_git () {
        mkif ~/downloads
        cd ~/downloads
        export GIT_VERSION=$(curl --silent https://github.com/git/git/releases/ | grep git/git/releases/tag | grep -v rc | head -n 1 | sed 's/^.*tag\///' | sed 's/".*//')
        wget https://github.com/git/git/archive/${GIT_VERSION}.tar.gz -q -O- - | tar xz && \
            cd git-* && \
            sudo make prefix=/usr/local all && \
            sudo make prefix=/usr/local install
    }
    runner _install_git
}

install_bat () {
    _install_bat () {
        mkif ~/downloads
        cd ~/downloads
        BAT_VERSION=$(curl --silent https://github.com/sharkdp/bat/releases/latest | tr -d '"' | sed 's/^.*tag\///g' | sed 's/>.*$//g' | sed 's/^v//')
        wget https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat-v${BAT_VERSION}-x86_64-unknown-linux-gnu.tar.gz -q
        tar -zxf bat-v${BAT_VERSION}-x86_64-unknown-linux-gnu.tar.gz
        sudo cp bat-v${BAT_VERSION}-x86_64-unknown-linux-gnu/bat /usr/local/bin/
    }
    runner _install_bat
}


install_fzf () {
    _install_fzf () {
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
            ~/.fzf/install --all
    }
    runner _install_fzf
}

install_zoxide () {
    _install_zoxide () {
        curl --silent --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/ajeetdsouza/zoxide/master/install.sh | sh
    }
    runner _install_zoxide
}

install_starship () {
    _install_starship () {
        curl -fsSL https://starship.rs/install.sh | bash -s -- -y
        cat ~/.bashrc | grep -q 'eval "$(starship init bash)"' || echo 'eval "$(starship init bash)"' >> ~/.bashrc
        cat ~/.zshrc | grep -q 'eval "$(starship init zsh)"' || echo 'eval "$(starship init zsh)"' >> ~/.zshrc
    }
    runner _install_starship
}

install_forgit () {
    _install_forgit () {
        rm -rf ~/.forgit
        git clone https://github.com/wfxr/forgit ~/.forgit
        cat ~/.bashrc | grep -q 'source ~/.forgit/forgit.plugin.sh' || echo 'source ~/.forgit/forgit.plugin.zsh' >> ~/.bashrc
        cat ~/.zshrc | grep -q 'source ~/.forgit/forgit.plugin.zsh' || echo 'source ~/.forgit/forgit.plugin.zsh' >> ~/.zshrc
    }
    runner _install_forgit
}

install_glow () {
    _install_glow () {
        mkif ~/downloads
        cd ~/downloads
        rm -rf glow
        GLOW_VERSION=$(curl --silent https://github.com/charmbracelet/glow/releases/latest | tr -d '"' | sed 's/^.*tag\///g' | sed 's/>.*$//g' | sed 's/^v//')
        wget https://github.com/charmbracelet/glow/releases/download/v${GLOW_VERSION}/glow_${GLOW_VERSION}_linux_x86_64.tar.gz -q && \
            mkdir ~/downloads/glow && \
            tar -zxf glow_${GLOW_VERSION}_linux_x86_64.tar.gz --directory ~/downloads/glow && \
            sudo mv ~/downloads/glow/glow /usr/bin/
    }
    runner _install_glow
}

install_oh_my_zsh () {
    _install_oh_my_zsh () {
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended > /dev/null
    }
    runner _install_oh_my_zsh
}

install_gitui () {
    _install_gitui () {
        GITUI_VERSION=$(curl --silent https://github.com/extrawurst/gitui/releases/latest | tr -d '"' | sed 's/^.*tag\///g' | sed 's/>.*$//g' | sed 's/^v//')
        wget https://github.com/extrawurst/gitui/releases/download/v${GITUI_VERSION}/gitui-linux-musl.tar.gz -O- -q | sudo tar -zxf - -C /usr/bin/
        curl https://raw.githubusercontent.com/extrawurst/gitui/master/vim_style_key_config.ron > ~/.config/gitui/key_config.ron
    }
    runner _install_gitui
}

install_ripgrep () {
    _install_ripgrep () {
        RIPGREP_VERSION=$(curl --silent https://github.com/BurntSushi/ripgrep/releases/latest | tr -d '"' | sed 's/^.*tag\///g' | sed 's/>.*$//g' | sed 's/^v//')
        # https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
        wget https://github.com/BurntSushi/ripgrep/releases/download/${RIPGREP_VERSION}/ripgrep-${RIPGREP_VERSION}-x86_64-unknown-linux-musl.tar.gz -O- -q | sudo tar -zxf - -C /tmp && sudo cp /tmp/ripgrep-${RIPGREP_VERSION}-x86_64-unknown-linux-musl/rg /usr/bin/rg
    }
    runner _install_ripgrep
}

install_dust () {
    _install_dust () {
        DUST_VERSION=$(curl --silent https://github.com/bootandy/dust/releases/latest | tr -d '"' | sed 's/^.*tag\///g' | sed 's/>.*$//g' | sed 's/^v//')
        wget https://github.com/tmux/dust/releases/download/v${DUST_VERSION}/dust-v${DUST_VERSION}-x86_64-unknown-linux-musl.tar.gz -O- -q | sudo tar -zxf - -C /tmp && sudo cp /tmp/dust-v${DUST_VERSION}-x86_64-unknown-linux-musl/dust /usr/bin/dust
        # https://github.com/bootandy/dust/releases/download/v0.5.4/dust-v0.5.4-x86_64-unknown-linux-musl.tar.gz
    }
    # runner _install_dust
    _install_dust
}

install_tmux () {
    _install_tmux () {
        TMUX_VERSION=$(curl --silent https://github.com/tmux/tmux/releases/latest | tr -d '"' | sed 's/^.*tag\///g' | sed 's/>.*$//g' | sed 's/^v//')
        wget https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz -O- -q | tar -zxf - -C /tmp
        pushd /tmp/tmux-${TMUX_VERSION}
        sudo ./configure
        sudo make
        sudo make install
        # https://github.com/bootandy/tmux/releases/download/v0.5.4/dust-v0.5.4-x86_64-unknown-linux-musl.tar.gz
    }
    # runner _install_tmux
    _install_tmux
}


install_node () {
    _install_node () {
        if [ ! -d /usr/local/bin/nodejs ]; then
            sudo mkdir -p /usr/local/bin/nodejs;
        fi
        wget https://nodejs.org/dist/v14.17.0/node-v14.17.0-linux-x64.tar.xz -q -O- - | sudo tar xJv -C /usr/local/bin/nodejs
        sudo rm /usr/bin/node -f
        sudo ln -s /usr/local/bin/nodejs/node-v14.17.0-linux-x64/bin/node /usr/bin/node
        sudo rm /usr/bin/npm -f
        sudo ln -s /usr/local/bin/nodejs/node-v14.17.0-linux-x64/bin/npm /usr/bin/npm
        sudo rm /usr/bin/npx -f
        sudo ln -s /usr/local/bin/nodejs/node-v14.17.0-linux-x64/bin/npx /usr/bin/npx

        mkif ~/.npm
        npm config set prefix ~/.npm/node_modules
        npm config set cache ~/.npm/cache
        npm i -g diff-so-fancy
        npm i -g markserv
        npm i -g neovim
        npm i -g treesitter-cli
    }
    runner _install_node
}

install_lua_lsp() {
    _install_lua_lsp() {
        os=$(uname -s | tr "[:upper:]" "[:lower:]")
        case $os in
        linux)
        platform="Linux"
        ;;
        darwin)
        platform="macOS"
        ;;
        esac
        curl -L -o sumneko-lua.vsix $(curl -s https://api.github.com/repos/sumneko/vscode-lua/releases/latest | grep 'browser_' | cut -d\" -f4)
        rm -rf sumneko-lua
        unzip sumneko-lua.vsix -d sumneko-lua
        rm sumneko-lua.vsix
        chmod +x sumneko-lua/extension/server/bin/$platform/lua-language-server
        echo "#!/usr/bin/env bash" > sumneko-lua-language-server
        echo "\$(dirname \$0)/sumneko-lua/extension/server/bin/$platform/lua-language-server -E -e LANG=en \$(dirname \$0)/sumneko-lua/extension/server/main.lua \$*" >> sumneko-lua-language-server
        chmod +x sumneko-lua-language-server
    }
runner _install_lua_lsp
}

install_lsp() {
    _install_lsp() {
        npm install bash-language-server@latest
        npm install dockerfile-language-server-nodejs@latest
    }
runner _install_lsp
}

install_configure () {
    _install_configure () {
        sudo chsh -s /usr/bin/zsh
        git clone https://github.com/WaylonWalker/devtainer.git ~/downloads/devtainer
        cp -r ~/downloads/devtainer/dotfiles/*(D) ~/ # include dotfiles
        cp -r ~/downloads/devtainer/bin ~/.local.bin
    }
    runner _install_configure
}

install_nvim_config () {
    # include dotfiles
    cp -r ~/downloads/devtainer/dotfiles/.config/nvim*(D) ~/.config/ 
}

install_neovim () {
    _install_neovim () {
        mkif ~/downloads
        cd ~/downloads
        rm nvim.appimage
        curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
        chmod u+x nvim.appimage
        ./nvim.appimage --appimage-extract > nvim-extract.log 2>&1
        rm ~/.local/share/neovim -rf
        mkdir ~/.local/share/neovim -p
        mv ~/downloads/squashfs-root/* ~/.local/share/neovim
        # sudo rm /usr/bin/nvim
        # sudo ln -s ~/.local/share/neovim/AppRun /usr/bin/nvim
        # sudo ln -s ~/.local/share/neovim/AppRun /usr/bin/vim

        python3 -m venv ~/.local/share/nvim/black || \
            python -m venv ~/.local/share/nvim/black 
        ~/.local/share/nvim/black/bin/pip install -U -q --no-cache-dir --disable-pip-version-check black;

        # cp ~/downloads/devtainer/dotfiles/ $HOME

        # install vim in order to run PlugInstall, neovim cannot run PlugInstall unattended
        sudo apt-get install -y --no-install-recommends vim
        # cp ~/.config/nvim/init.vim ~/.vimrc
	echo 'source ~/.config/nvim/plugins.vim' > ~/.vimrc
        curl --silent -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        /usr/bin/vim --noplugin +PlugInstall +qall +enter +silent
        rm ~/.vimrc
        rm -rf ~/.vim
        sudo apt-get remove vim -y
        sudo apt-get autoremove -y

        chmod 0750 ~/.local/share/nvim/
        mkif ~/.local/share/nvim/backup/
        mkif ~/.local/share/nvim/swap/
        mkif ~/.local/share/nvim/undo/
    }
    runner _install_neovim
}

install_docker() {
    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    sudo apt update
    apt-cache policy docker-ce
    sudo apt install docker-ce -y
    sudo systemctl status docker
}

install_broot() {
    _install_broot() {
        wget https://dystroy.org/broot/download/x86_64-linux/broot -O ~/.local/bin/broot
    }
    runner _install_broot
}

install_direnv() {
    _install_direnv() {
        curl -sfL https://direnv.net/install.sh | bash
    }
    runner _install_direnv
}

install_obs() {
    _install_obs() {
        sudo apt install ffmpeg
        sudo apt install v4l2loopback-dkms
        sudo add-apt-repository ppa:obsproject/obs-studio
        sudo apt update
        sudo apt install obs-studio
    }
    runner _install_obs
}

install_brave() {
    _install_brave() {
        sudo apt install apt-transport-https curl
        sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
        sudo apt update
        sudo apt install brave-browser
    }
    runner _install_brave
}

install_oracle() {
    _install_oracle() {
        cd /opt/oracle
        sudo apt-get update \
            && sudo apt-get install -y libaio1 wget unzip \
            && wget -q https://download.oracle.com/otn_software/linux/instantclient/instantclient-basiclite-linuxx64.zip \
            && unzip -q instantclient-basiclite-linuxx64.zip \
            && rm -f instantclient-basiclite-linuxx64.zip \
            && cd /opt/oracle/instantclient* \
            && rm -f *jdbc* *occi* *mysql* *README *jar uidrvci genezi adrci \
            && echo /opt/oracle/instantclient* > /etc/ld.so.conf.d/oracle-instantclient.conf \
            && ldconfig
    }
    runner _install_oracle
}

install_polybar() {
sudo apt-get install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-composite0-dev libjsoncpp-dev libxcb-randr0-dev xcb-proto python3-sphinx
sudo ln -s /usr/include/jsoncpp/json/ /usr/include/json
pushd ~/git
git clone https://github.com/jaagr/polybar.git
pushd polybar
./build.sh
popd
popd
sudo apt purge python3-sphinx

}

install_main () {
    install_apt
    install_configure
    install_git

    install_python
    install_node

    install_bat
    install_gitui
    install_forgit
    install_fzf
    install_glow
    install_zoxide
    install_oh_my_zsh
    install_broot
    install_direnv
    install_neovim
}

setup_droplet () {
    install_docker
    install_main
}

stow_all () {
    stow zsh
    stow nvim
    stow bin
}


install_rust() {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs| sh
}

install_gnome_dracula() {
    sudo apt-get install dconf-cli
    pushd ~/downloads
    git clone https://github.com/dracula/gnome-terminal
    cd gnome-terminal
    ./install.sh
    popd
    rm -rf gnome-terminal
}
