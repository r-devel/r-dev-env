

#### How to Stop Codespaces?
- To stop codespaces we just need to navigate to the Codespaces option in the bottom left of the Codespace panel.

  ![stop codespace](../../assets/rdev14.png)

- After clicking on codespaces option we will get a drop down above something like this👇

  ![stop codespace](../../assets/rdev15.png)

- Click on "Stop Current Codespace". It will stop the codespaces you are currently using or running.

- You will be redirected to a Restart Codespaces page. The page shows a link to restart the codespace you just stopped.

  ![stop codespace](../../assets/rdev16.png)


#### Idle timeout:
If you do not interact with the codespace, it will close automatically when it reaches the idle timeout limit. By default, this is 30 minutes, but you can [set a personal timeout](https://docs.github.com/en/codespaces/setting-your-user-preferences/setting-your-timeout-period-for-github-codespaces#setting-your-default-timeout-period) limit in your GitHub settings.

The code changes and operations we have performed inside the codespace will still be inside the stopped codespace. If your codespace is stopped then you can restart it as shown below.

#### How to Restart Codespaces again?

- Go to [github.com/codespaces](https://github.com/codespaces)
- Here we can see a list of the codespaces we have created
  ![stop codespace](../../assets/rdev17.png)
- To restart it, we can just click on the codespaces we wanted to use and it will start the codespaces again for us.
- You can also see an active label added to the codespaces we just started
 ![stop codespace](../../assets/rdev18.png)


#### Managing and Sustaining Codespaces

##### Setting a Default Retention Period for Your Codespaces

**Access Settings:**

- Click your profile photo in the upper-right corner of any GitHub page.
- Click "Settings."

**Navigate to Codespaces Settings:**

- In the sidebar, under "Code, planning, and automation," click "Codespaces."

**Set Retention Period:**

- Under "Default retention period," enter the number of days (between 0 and 30) for which you want your codespaces to be retained after they have been stopped.
Example: Setting it to 30 days.
![retain codespace](../../assets/manage_codespace.png)

**Warning:**

- Setting the retention period to 0 days will result in immediate deletion of codespaces when stopped or when they timeout due to inactivity.
For more details, refer to "Setting your timeout period for GitHub Codespaces."

**Save Changes:**

- Click "Save" to apply the new retention period.


This allows you to customize how long your codespaces are kept before automatic deletion, balancing convenience and storage management.

**Auto Delete Codespace:**

- Go to the "Your codespaces" page at [github.com/codespaces](github.com/codespaces).
- Find the codespace you want to exempt from deletion.
- Click the options menu (three dots) to the right of the codespace.
- Select "Auto Delete Codespace" from the dropdown menu. The bookmarked codespaces will not be auto-deleted.