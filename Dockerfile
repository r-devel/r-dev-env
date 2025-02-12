# First Stage: Builder
FROM mcr.microsoft.com/devcontainers/cpp:dev-ubuntu-22.04 AS builder

ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="none"

# Optionally install CMake for vcpkg
COPY ./reinstall-cmake.sh /tmp/

RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
    chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
    fi \
    && rm -f /tmp/reinstall-cmake.sh

# Enable deb-src for dependencies
RUN sed -i.bak "/^#.*deb-src.*universe$/s/^# //g" /etc/apt/sources.list && apt update

# Install necessary build dependencies
RUN apt install -y --no-install-recommends \
      software-properties-common \
      subversion \
      wget \
      gpg \
      build-essential \
      gfortran \
      libxml2-dev \
      libcurl4-openssl-dev \
      libssl-dev \
      libblas-dev \
      liblapack-dev

# Add R repository and install R
RUN add-apt-repository --enable-source --yes "ppa:marutter/rrutter4.0" \
    && wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc \
    && apt update \
    && apt -y build-dep r-base-dev \
    && apt -y install r-base-dev 

# Install R packages
RUN Rscript -e "install.packages('languageserver', repos='https://cran.rstudio.com')" \
    && Rscript -e "install.packages('httpgd', repos='https://cran.rstudio.com')"

# Install shellcheck and ccache
RUN apt install -y shellcheck ccache

# Second Stage: Final Image
FROM mcr.microsoft.com/devcontainers/cpp:dev-ubuntu-22.04 AS final

ARG CONTAINER_VERSION
ENV CONTAINER_VERSION=${CONTAINER_VERSION}

# Install minimal runtime dependencies
RUN apt update && apt install -y --no-install-recommends \
    libxml2 \
    libcurl4-openssl-dev \
    libssl-dev \
    libblas-dev \
    liblapack-dev \
    gfortran

# Copy R installation from builder stage
COPY --from=builder /usr/lib/R /usr/lib/R
COPY --from=builder /usr/bin/R /usr/bin/R
COPY --from=builder /usr/local/lib/R /usr/local/lib/R
COPY --from=builder /usr/share/R /usr/share/R
COPY --from=builder /etc/R /etc/R

# Copy shared libraries
COPY --from=builder /usr/lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu

# Set environment variables
ENV PATH="/usr/lib/R/bin:$PATH"
ENV LD_LIBRARY_PATH="/usr/lib/R/lib:/usr/lib/x86_64-linux-gnu"

# Verify installation
RUN ldconfig && R --version
