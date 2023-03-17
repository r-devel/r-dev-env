# Hard Task 1
Install docker and VSCode on your OS, download the proof-of-concept repository and start the dev container. Build R within the dev container and start R. Take a screenshot.


## Results

1. Docker version
![dockerversion](https://user-images.githubusercontent.com/72031540/226054054-76b593cd-588e-46e1-94fd-471c27eb95e4.png)
2. R-dev Container installation

- The VSCode automaticaly detects devcontainer.json file and suggest to open/reopen repo inside dev container.
![initiate dev conatiner setup ](https://user-images.githubusercontent.com/72031540/226054070-cafd8937-004f-477e-ae90-0112974ea470.png)
- After clicking on reopen button. Docker Image is being pulled from the registry mentioned inside dockerfile.
![dev container setup installation](https://user-images.githubusercontent.com/72031540/226054006-2683aec2-f37d-4948-9f13-56ffca000301.png)
3. R-Dev Container Env Running
- After pulling image from registry, the dev container get starts inside the VSCode and we can use it for our development purpose.
![dev container env ouput1](https://user-images.githubusercontent.com/72031540/226053942-ec72aabf-1934-4865-9667-d656e83e9909.png)
![dev container env ouput2](https://user-images.githubusercontent.com/72031540/226053967-0a3bfb07-1d51-40b4-8f44-f0539b4b43a4.png)
![dev container R-help page](https://user-images.githubusercontent.com/72031540/226053984-30831b9b-097e-4b8f-98c4-8e3269f5187c.png)
- It also let us access website on the port 17097.
![devenvport](https://user-images.githubusercontent.com/72031540/226056876-f5672e6e-4112-4304-b90b-7afbbd01f3d8.png)
4. Output for R program
![R-interactiveconsole](https://user-images.githubusercontent.com/72031540/226054119-f9961f98-39bf-46f2-89c5-c5a9d5bc0cd8.png)
![output for script run in R interactive console](https://user-images.githubusercontent.com/72031540/226056264-bde0e151-b01c-450c-b8d2-9131c0c61eb6.png)
5. Browser Output
![browser_op](https://user-images.githubusercontent.com/72031540/226053532-1739c479-7e09-4b1b-a07b-0ca82a0ec18d.png)
6. Docker container for R-dev-env
- R-dev env container running cross check using docker ps command
![docker container](https://user-images.githubusercontent.com/72031540/226056559-c4cfad80-f011-4492-b1c1-9cecccb5a09b.png)
- The plot png image which is output for previous R script(above SS) also gets stored inside the container. That means Dev env container is working properly.
![plot image getting saved in container](https://user-images.githubusercontent.com/72031540/226057851-fdd3a038-9755-429b-8ef5-f5a4339df709.png)


## R program used for this Test

**Mean Value**
```R
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)
result.mean <- mean(x)
print(result.mean)
```

**Scatterplot**
```R
x <- c(5,7,8,7,2,2,9,4,11,12,9,6)
y <- c(99,86,87,88,111,103,87,94,78,77,85,86)

plot(x, y)
```
