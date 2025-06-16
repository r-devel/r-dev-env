FROM mcr.microsoft.com/devcontainers/cpp:dev-ubuntu

# Update and install necessary dependencies
# (software-properties-common installed for apt-add-repository)
RUN sed -i.bak "/^#.*deb-src.*universe$/s/^# //g" /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
      software-properties-common \
      subversion \
    && add-apt-repository --enable-source --yes "ppa:marutter/rrutter4.0" \
    && wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc \
    && apt-get update \
    && apt-get build-dep -y r-base-dev \
    && apt-get install -y r-base-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install R packages, with dynamic r-universe URL
RUN Rscript -e "runiverse <- sprintf('r-universe.dev/bin/linux/%s-%s/%s/', \
                                 system2('lsb_release', '-sc', stdout = TRUE), \
                                 R.version\$arch, \
                                 substr(getRversion(), 1, 3)); \
                print('Installing packages...'); \
                install.packages(c('languageserver', 'httpgd'), \
                 repos = c(runiverse = paste0('https://cran.', runiverse), \
                           nx10 = paste0('https://nx10.', runiverse))); \
                print('Packages installed.')"

# Define env var used in GitHub Actions that build and deploy container
ARG CONTAINER_VERSION
ENV CONTAINER_VERSION=${CONTAINER_VERSION}
