!!! Note
    Local setup is not recommended on macOS or Windows as the Docker container will work via a Virtual Machine and building R will take far longer (e.g. a full build may take 1 hour vs 10 minutes!).
    
We can also use this codespace locally. For that we need to have some prerequisites installed.

## Prerequisites 

#### 1. Install Docker Engine or Docker Desktop
 You can find the docker desktop install instructions on [Docker Desktop Docs](https://www.docker.com/products/docker-desktop/).
#### 2. Install VSCode Editor
 You can download and install from [VSCode website](https://code.visualstudio.com/download).

## Run R Development Container locally 

#### 1. Clone the R Dev Container Repository
Clone the [R Dev Container Github repo](https://github.com/r-devel/r-dev-env/)
#### 2. Change Directory to r-dev-env
In a terminal, change directory to r-dev-env
```
cd r-dev-env
```
#### 3. Restart VSCode in r-dev-env Directory
Restart VSCode in the `r-dev-env` directory with the command:
```bash
code .
```
#### 4. Checkout Main Branch and Pull Latest Changes
Checkout the main branch and pull the latest changes
```
git checkout main
git pull
```
The main branch provides the stable release. If you require an in-development feature, use the devel branch instead.


#### 5. Start Docker Engine
After this step please be sure that your docker engine is started. If you have installed Docker Desktop just open the Docker Desktop app the engine starts automatically and if you are using just docker engine make sure to start it with the following command
```bash
systemctl start docker
```

#### 6. Reopen in Dev Container
We can see pop-up at the bottom right of the VSCode editor which says reopen in Dev Container. 
Click on `Reopen in DevContainer` button.                                              
![start localsetup](../../assets/rdev13.png)

#### 7. Wait for Container Setup
After clicking on that button we will see our container is getting ready. It will take some time. So till that time you can have coffee :)
![start localsetup](../../assets/rdev24.png)
#### 8. Verify Dev Container Setup
We can also test whether the dev container is working or not by just printing the environment variables mentioned in the welcome message on the terminal. And there we go!!! We have setup our R Dev Container locally.
![start localsetup](../../assets/rdev25.png)

#### 9. Reopen Container
The container will be closed when you close VSCode. To reopen the container, open the `r-dev-env` directory in VSCode.