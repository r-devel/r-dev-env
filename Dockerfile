FROM mcr.microsoft.com/devcontainers/cpp:dev-ubuntu

ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="none"

# Optionally install the cmake for vcpkg
COPY ./reinstall-cmake.sh /tmp/

RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
    chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
    fi \
    && rm -f /tmp/reinstall-cmake.sh

# Update and install necessary dependencies
RUN sed -i.bak "/^#.*deb-src.*universe$/s/^# //g" /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
      software-properties-common \
      subversion \
    && add-apt-repository --enable-source --yes "ppa:marutter/rrutter4.0" \
    && wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc \
    && apt-get install -y r-base-dev \
    && rm -rf /var/lib/apt/lists/*

# Install R packages, with dynamic runiverse URL
RUN Rscript -e "runiverse <- sprintf('r-universe.dev/bin/linux/%s-%s/%s/', \
                                 system2('lsb_release', '-sc', stdout = TRUE), \
                                 R.version\$arch, \
                                 substr(getRversion(), 1, 3)); \
                print('Installing packages...'); \
                install.packages(c('languageserver', 'httpgd'), \
                 repos = c(runiverse = paste0('https://cran.', runiverse), \
                           nx10 = paste0('https://nx10.', runiverse))); \
                print('Packages installed.')"


# Install ShellCheck using apt-get from the PPA
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    shellcheck

# Install ccache
RUN apt-get install -y --no-install-recommends \
    ccache \
    && rm -rf /var/lib/apt/lists/*

ARG CONTAINER_VERSION
ENV CONTAINER_VERSION=${CONTAINER_VERSION}
