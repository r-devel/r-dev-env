FROM ghcr.io/startrooper08/r-dev-artifact:main
RUN apt install shellcheck
RUN apt install -y ccache
RUN /usr/sbin/update-ccache-symlinks
RUN echo 'export PATH="/usr/lib/ccache:$PATH"' | tee -a /home/vscode/.bashrc

# build variables
RUN echo 'export BUILDDIR="/workspaces/r-dev-env/bin/R"' >> ~/.bashrc 
RUN echo 'export TOP_SRCDIR="/workspaces/r-dev-env/Downloads/R"' >> ~/.bashrc 
RUN echo 'Hello world' >> ~/.bashrc

# install quarto
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.433/quarto-1.3.433-linux-amd64.deb
RUN dpkg --force-confold -i quarto-1.3.433-linux-amd64.deb
RUN rm quarto-1.3.433-linux-amd64.deb