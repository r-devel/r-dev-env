FROM mcr.microsoft.com/devcontainers/cpp:dev-ubuntu-22.04

ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="none"

# Optionally install the cmake for vcpkg
COPY ./reinstall-cmake.sh /tmp/

RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
    chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
    fi \
    && rm -f /tmp/reinstall-cmake.sh

RUN sed -i.bak "/^#.*deb-src.*universe$/s/^# //g" /etc/apt/sources.list \
    && apt update \
    && apt -y install subversion \
    && apt -y build-dep r-base-dev \
    && apt -y install r-base-dev \
    && Rscript -e "install.packages('languageserver', repos='https://cran.rstudio.com')"
