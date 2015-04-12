FROM zchee/rubymine:2.2.1

WORKDIR /tmp
ENV ZSH_VERSION 5.0.7
RUN curl -SLO "http://jaist.dl.sourceforge.net/project/zsh/zsh/${ZSH_VERSION}/zsh-${ZSH_VERSION}.tar.bz2"
RUN tar -jxf "zsh-${ZSH_VERSION}.tar.bz2"
WORKDIR zsh-${ZSH_VERSION}
RUN ./configure --prefix=/usr/local --enable-multibyte --enable-locale --with-tcsetpgrp
RUN make && make install

RUN echo '/usr/local/bin/zsh' >> /etc/shells
RUN chsh -s /usr/local/bin/zsh root

RUN git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"

RUN mv /root/.zprezto/runcoms/zlogin /root/.zlogin &&\
    mv /root/.zprezto/runcoms/zlogout /root/.zlogout &&\
    mv /root/.zprezto/runcoms/zpreztorc /root/.zpreztorc &&\
    mv /root/.zprezto/runcoms/zprofile /root/.zprofile &&\
    mv /root/.zprezto/runcoms/zshenv /root/.zshenv &&\
    mv /root/.zprezto/runcoms/zshrc /root/.zshrc

RUN echo `cat /root/.bashrc` >> /root/.zshrc

WORKDIR /usr/src/app

CMD ["/usr/sbin/sshd", "-D"]
