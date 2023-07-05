FROM ghcr.io/r-devel/r-dev-artifact:main
RUN apt install shellcheck
RUN apt install -y ccache
RUN /usr/sbin/update-ccache-symlinks
RUN echo 'export PATH="/usr/lib/ccache:$PATH"' | tee -a /home/vscode/.bashrc
ENV BUILDDIR='/workspaces/r-dev-env/bin/R'
ENV TOP_SRCDIR='/workspaces/r-dev-env/Downloads/R'

# install quarto
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.433/quarto-1.3.433-linux-amd64.deb
RUN dpkg --force-confold -i quarto-1.3.433-linux-amd64.deb
RUN rm quarto-1.3.433-linux-amd64.deb
