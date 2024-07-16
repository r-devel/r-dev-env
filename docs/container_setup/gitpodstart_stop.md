
### Starting a Gitpod Workspace

1. **Sign Up / Log In:**
Visit [Gitpod](https://www.gitpod.io/) and sign up for an account if you don't have one, or log in if you do.

2. **Connect Your Git Provider:**
Connect Gitpod to your GitHub, GitLab, or Bitbucket account by authorizing access. This allows Gitpod to create workspaces from your repositories.

3. **Choose Your Repository:**
You can also use a Gitpod badge, which will redirect you to the Gitpod workspace creation dashboard page.

[![Open in Gitpod](https://img.shields.io/badge/Gitpod-Open%20in%20Gitpod-blue?logo=gitpod&style=for-the-badge)](https://gitpod.io/github.com/r-devel/r-dev-env/tree/devel)


![start gitpod workspace](../assets/gitpod1.png)     
4. **Create a New Workspace:**
In the Gitpod dashboard, click on the "Continue" button. You can change the resource option from standard to large. After clicking continue, it will take approximately 15-20 minutes to create the workspace for the first time. It will cache the environment for faster startup in the future.

!!!Note
     Changing the resource option will reduce the free monthly Gitpod usage, which is 50 hours per month.


### Stopping a Gitpod Workspace

1. **Locate the Gitpod Command Palette Button:**
To stop the current workspace, look for the orange Gitpod command palette button in the bottom left corner of the workspace.

![stop gitpod workspace](../assets/gitpod2.png)   
2. **Open the Command Palette and Stop the Workspace:**
After clicking on the Gitpod command palette button, a pop-up will appear from the top of the screen. Select the Gitpod: Stop Workspace option to stop the current workspace.

![stop gitpod workspace](../assets/gitpod3.png)


!!!Note
    Stopping a workspace will save its state, so you can resume later without losing your progress. However, keep in mind that stopped workspaces still count towards your monthly usage quota.


### Restarting a Gitpod Workspace

1. **Open Gitpod Dashboard:**
Once you're in the Gitpod dashboard, navigate to the "Workspaces" section. In the "Workspaces" section, you will see a list of your current and past workspaces. Locate the workspace you want to restart. Stopped workspaces will have an indicator showing they are not running.

![restart gitpod workspace](../assets/gitpod4.png)   
2. **Restart the Workspace:**
To restart a workspace, click on the workspace in the list you want to restart. This will launch the workspace, restoring it to the state it was in when it was last stopped.