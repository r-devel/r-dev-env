FROM ghcr.io/startrooper08/r-dev-artifact:main
RUN apt install shellcheck
RUN apt install -y ccache
RUN /usr/sbin/update-ccache-symlinks
RUN echo 'export PATH="/usr/lib/ccache:$PATH"' | tee -a /home/vscode/.bashrc