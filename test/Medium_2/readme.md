# Medium 2:
Write a brief description (< 200 words) of how the proof-of-concept works. Describe how you think the proof-of-concept could be improved.​

### Working
- The proof of concept consist of docker image(dockerfile is present on r-dev-image repo) which let us create a dev container. The container creates a virtual environment which means we can install source code of any R version(devel, base) inside container and work on it without bothering other R installation. And the encapsulating property of the proof-of-work(r-dev-env container) let us install any R versions inside container, fix the bugs and make the changes without overwriting and mixing contributions made with other R versions.
- We can also create different dev container for different R versions(one container for one R version).
- And whatever changes we make inside dev container is stored inside docker volume so even if we shut down the container, after restarting the dev container we can get back our changes made in our R source code.
- It also creates a one click workspace using codespace.

### Improvement
- I think the first and foremost improvement can be done is Optimization of docker image. The large size of the image might create hurdle for new beginner contributors. I've been working around docker and other devops tools for a while and I think Slim.ai and Slimtoolkit(earlier known as Dockrslim) can help us here. It can help us in two ways 
1. Reducing Docker Image size
2. Finding Vulnerabilites


