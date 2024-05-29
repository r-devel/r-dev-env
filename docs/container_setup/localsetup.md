
We can also use this codespace locally. For that we need to have some prerequisites installed.

#### > Prerequisites :

1. Docker Engine or Docker Desktop. You can find the docker desktop install instructions on [Docker Desktop Docs](https://www.docker.com/products/docker-desktop/).
2. VSCode Editor. You can download and install from [VSCode website](https://code.visualstudio.com/download).
3. A local copy of the [R Dev Container Repo](https://github.com/r-devel/r-dev-env/).

#### > Steps to run R Development Container locally :

1. Clone the [R Dev Container repo](https://github.com/r-devel/r-dev-env/)
2. Change directory to r-dev-container
```
cd r-dev-container
```
3. Restart VSCode in the r-dev-env directory with the command:
```bash
code .
```
4. Checkout the main branch and pull the latest changes
```
git checkout main
git pull
```
The main branch provides the stable release. If you require an in-development feature, use the devel branch instead.


5. After this step please be sure that your docker engine is started. If you have installed Docker Desktop just open the Docker Desktop app the engine starts automatically and if you are using just docker engine make sure to start it with the following command
```bash
systemctl start docker
```

6. We can see pop-up at the bottom right of the VSCode editor which says reopen in Dev Container. 
Click on `Reopen in DevContainer` button.                                              
![image](https://github.com/r-devel/r-dev-env/assets/72031540/5c29b955-972f-4a7c-bad8-2d8050b13b9d)

7. After clicking on that button we will see our container is getting ready. It will take some time. So till that time you can have coffee :)
   ![image](https://github.com/r-devel/r-dev-env/assets/72031540/044d1e27-22a6-45df-82ec-8fb65abd75e8)
8. We can just print the environment variables mentioned in the welcome message on the terminal. And there we go!!! We have setup our R Dev Container locally.
   ![image](https://github.com/r-devel/r-dev-env/assets/72031540/026668de-a9bb-49bc-a515-c16a218b685d)

9.  The container will be closed when you close VSCode. To reopen the container, open the r-dev-env directory in VSCode.