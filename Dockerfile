FROM python:3.8-buster

ARG DEBIAN_FRONTEND=noninteractive
ARG USER_ID
ARG GROUP_ID

RUN apt-get update && apt-get upgrade && apt-get install sudo
RUN addgroup --gid $GROUP_ID dockeruser
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID dockeruser
RUN adduser dockeruser sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER dockeruser
COPY . /devtainer
# COPY . /home/dockeruser/dotfiles
 WORKDIR /devtainer

# make it as the dockeruser otherwise it becomes owned by root
RUN mkdir ~/.local/share/nvim/site/autoload/ -p

ENV PATH="${PATH}:/home/dockeruser/.local/bin"
RUN pip3 install pipx
RUN pipx run --spec ansible ansible-playbook /devtainer/ansible/local.yml -t core

# stow options, I can never remember these
# -d DIR, --dir=DIR     Set stow dir to DIR (default is current dir)
# -t DIR, --target=DIR  Set target to DIR (default is parent of stow dir)
# -S, --stow            Stow the package names that follow this option
RUN stow -d /devtainer -t /home/dockeruser --stow zsh tmux nvim bin ranger
RUN sudo chmod 777 /home/dockeruser/.local/bin/tat

RUN pipx run --spec ansible ansible-playbook /devtainer/ansible/local.yml -t node

RUN pipx run --spec ansible ansible-playbook /devtainer/ansible/local.yml -t zsh

RUN pipx run --spec ansible ansible-playbook /devtainer/ansible/local.yml -t nvim

RUN nvim -u ~/.config/nvim/plugins.vim +PlugInstall +UpdateRemotePlugins +qall
RUN nvim +CHADdeps +qall

RUN . ~/.zprofile && cd ~/.vim/plugged/vim-hexokinase && make

WORKDIR /home/dockeruser


CMD ["zsh"]
