## Using Locally
 We can also use this codespace locally. For that we need to have some prerequisites installed.


#### > Prerequisites :

1. Docker Engine or Docker Desktop. You can find the docker desktop install instructions [here](https://www.docker.com/products/docker-desktop/).
2. VSCode Editor. You can install VSCode from [here](https://code.visualstudio.com/download).


#### > Steps to run R Development Container locally :

1. Head to the GitHub page for the R dev Github project link for R Development Container [R-Dev-Env](https://github.com/r-devel/r-dev-env)
2. You can clone the repo or download the zip file. Downloading the zip file is recommeded since it has latest updates are pushed to it
   [r-dev-env zip](https://github.com/r-devel/r-dev-env/archive/refs/heads/devel.zip)
3. After downloading zip, unzip the file and change directory to `r-dev-env`.
4. After the changing directory to r-dev-env, we can open this code inside VSCode editor using cmd `code .`. This will redirect us to VSCode editor.
   ![image](https://github.com/r-devel/r-dev-env/assets/72031540/52095a96-4912-431e-9c28-ada143f7cab9)
5. After this step please be sure that your docker engine is started. If you have installed Docker Desktop just open the Docker Desktop app the engine starts automatically and if you are using just docker engine make sure to start it with `systemctl start docker` cmd)
6. We can see pop-up at the bottom right of the VSCode editor which says reopen in Dev Container. Click on 'Reopen in DevContainer' button.
   ![image](https://github.com/r-devel/r-dev-env/assets/72031540/5c29b955-972f-4a7c-bad8-2d8050b13b9d)
7. After clicking on that button we will see our container is getting ready. It will take some time. So till that time you can have coffee :)
   ![image](https://github.com/r-devel/r-dev-env/assets/72031540/044d1e27-22a6-45df-82ec-8fb65abd75e8)
8. We can also test the dev container is working or not by just printing the env variables we have mentioned inside container. And there we go!!! We have setup our R-dev-env locally.
   ![image](https://github.com/r-devel/r-dev-env/assets/72031540/026668de-a9bb-49bc-a515-c16a218b685d)

