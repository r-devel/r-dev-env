FROM ghcr.io/startrooper08/r-dev-artifact:main
RUN apt install shellcheck
RUN apt install -y ccache
RUN /usr/sbin/update-ccache-symlinks
RUN echo 'export PATH="/usr/lib/ccache:$PATH"' | tee -a /home/vscode/.bashrc
ENV BUILDDIR='/workspaces/r-dev-env/bin/R'
ENV TOP_SRCDIR='/workspaces/r-dev-env/Downloads/R'

# install quarto
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.433/quarto-1.3.433-linux-amd64.deb
RUN apt install ./quarto-1.3.433-linux-amd64.deb
RUN rm quarto-1.3.433-linux-amd64.deb

# install rstudio server
RUN apt-get install gdebi-core
RUN wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2023.06.0-421-amd64.deb
RUN apt install ./rstudio-server-2023.06.0-421-amd64.deb
RUN rm rstudio-server-2023.06.0-421-amd64.deb

# configure rstudio server
# config take from https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/install_rstudio.sh
#RUN echo "auth-none=1" >>/etc/rstudio/auth_rserver.conf
#RUN rstudio-server start