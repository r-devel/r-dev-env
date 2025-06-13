FROM mcr.microsoft.com/devcontainers/cpp:dev-ubuntu-22.04


ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="none"

# Optionally install the cmake for vcpkg
COPY ./reinstall-cmake.sh /tmp/

RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
    chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
    fi \
    && rm -f /tmp/reinstall-cmake.sh

RUN sed -i.bak "/^#.*deb-src.*universe$/s/^# //g" /etc/apt/sources.list \
    && apt -y update \
    && apt install -y --no-install-recommends \
      software-properties-common \
      subversion \
    && add-apt-repository --enable-source --yes "ppa:marutter/rrutter4.0" \
    && wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc \
    && apt -y build-dep r-base-dev \
    && apt -y install r-base-dev \
    && rm -rf /var/lib/apt/lists/*

# Install R packages, with the dynamic runiverse URL
RUN Rscript -e "runiverse <- sprintf('r-universe.dev/bin/linux/%s-%s/%s/', \
                                 system2('lsb_release', '-sc', stdout = TRUE), \
                                 R.version\$arch, \
                                 substr(getRversion(), 1, 3)); \
            install.packages(c('languageserver', 'httpgd'), \
                 repos = c(runiverse = paste0('https://cran.', runiverse), \
                           nx10 = paste0('https://nx10.', runiverse)))" 

RUN apt install -y shellcheck
RUN apt install -y ccache
#RUN /usr/sbin/update-ccache-symlinks
#RUN echo 'export PATH="/usr/lib/ccache:$PATH"' | tee -a /home/vscode/.bashrc

ARG CONTAINER_VERSION
ENV CONTAINER_VERSION ${CONTAINER_VERSION}

