FROM zshusers/zsh-master
# allow pkg installation via apt
RUN apt-get update
# install deps
RUN apt-get install wget -y
RUN apt-get install vim -y
RUN apt-get install git -y
# install ohMyZsh
RUN wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | zsh || true
# install plugin
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# install theme
RUN git clone https://github.com/denysdovhan/spaceship-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt
RUN ln -s ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme
# get conf repo
WORKDIR /root
RUN git clone https://github.com/hyphaene/Hexactitude.git
WORKDIR /root/Hexactitude
RUN git checkout 16.04
RUN rm /root/.zshrc
RUN cp ~/Hexactitude/kiabi/.zshrc /root/.zshrc
RUN mkdir /bekom
RUN git config --global core.autocrlf true
RUN git config --global core.filemode false
RUN git config --global user.email maximilien.garenne@gmail.com
RUN git config --global user.name 'Maximilien Garenne'
WORKDIR /bekom
# RUN SCRIPT QUI REMPLACE VIA SYMLINK LES FICHIERS DE CONF ( ZSHRC ) 
