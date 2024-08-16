FROM gitpod/workspace-full:latest

USER root

ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="none"

# Optionally install the cmake for vcpkg
COPY ./reinstall-cmake.sh /tmp/

RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
    chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
    fi \
    && rm -f /tmp/reinstall-cmake.sh

RUN sed -i.bak "/^#.*deb-src.*universe$/s/^# //g" /etc/apt/sources.list \
    && echo "deb https://cloud.r-project.org/bin/linux/ubuntu jammy-cran40/" >> /etc/apt/sources.list \
    && wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc \
    && apt update \
    && apt -y install subversion \
    && apt -y build-dep r-base-dev \
    && apt -y install r-base-dev \
    && Rscript -e "install.packages('languageserver', repos='https://cran.rstudio.com')" \
    && Rscript -e "install.packages('httpgd', repos='https://cran.rstudio.com')"

RUN apt install -y shellcheck
RUN apt install -y ccache
RUN apt install -y rsync
#RUN /usr/sbin/update-ccache-symlinks
#RUN echo 'export PATH="/usr/lib/ccache:$PATH"' | tee -a /home/vscode/.bashrc


ARG CONTAINER_VERSION
ENV CONTAINER_VERSION ${CONTAINER_VERSION}
