# Hard 3 Test
Hard: Read through the dockerfile in the proof-of-concept repository and the R development image hosted in a different repository. Modify and improve the dockerfile in some way. Provide the modified dockerfile and a short rationale (< 200 words) for the changes you made.​

### Dockerfile Changes :
1. Gone through the Microsoft Container/Artifact Registry, found the dev ubuntu-20.04 LTS version image which was of size 584MB.

![SS1](https://user-images.githubusercontent.com/72031540/229248981-8b48e0c1-c440-4b6b-883f-b3ed31ef53a1.png)

2. Used it as base image in dockerfile mentioned in r-dev-image github repository.
3. RUN command :
 Used (&& , /) operators with RUN command instead of using RUN command everytime to install packages and tidied up the Dockerfile.

![SS2](https://user-images.githubusercontent.com/72031540/229274069-4e6274a6-7cdf-4ee3-85a1-e30abed76a03.png)

![SS3](https://user-images.githubusercontent.com/72031540/229274077-dfdd9072-c28f-4088-9761-23b14ec45851.png)

4. Build the image using the dev ubuntu-20.04 LTS version image locally and able to reduce size of the complete r-dev-image to some extent.

![SS4](https://user-images.githubusercontent.com/72031540/229275460-ecc48b8c-0d9e-4a38-afaa-60cc64f55c53.png)
![SS5](https://user-images.githubusercontent.com/72031540/229274096-2831360e-3e70-49a1-9b40-45a5a033c1a9.png)

### Observations
While we build Image, the size of the image gets increase even if we use small size base image. Here I used base image of dev ubuntu 20.04 LTS which is almost 600MB lesser than earlier base image(ubuntu 22.04).
And still its size is almost similar to image with ubuntu 22.04 as base image.


### Updated Dockerfile
```Dockerfile

FROM mcr.microsoft.com/devcontainers/cpp:dev-ubuntu-20.04

ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="none"

# Optionally install the cmake for vcpkg
COPY ./reinstall-cmake.sh /tmp/

RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
    chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
    fi \
    && rm -f /tmp/reinstall-cmake.sh

RUN sed -i.bak "/^#.*deb-src.*universe$/s/^# //g" /etc/apt/sources.list \
    && apt update \
    && apt -y build-dep r-base \
    && apt -y install r-base \
    && Rscript -e "install.packages('languageserver', repos='https://cran.rstudio.com')"
```

Link to the Github Repo :
https://github.com/StarTrooper08/r-dev-image
