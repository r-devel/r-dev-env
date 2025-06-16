
1) Create a file in VS Code ending with a `.R` extension. You can create new files
by clicking on the new file icon in VS Code Explorer, or use the `code` command
in the terminal to create and open an R file

```bash
code R/test.R
```

![alt text](../assets/rdev4.png)

2) You should see `R:(not attached)` in the Status Bar at the bottom of the
VSCode window:

![alt text](../assets/rdev11.png)

Click on the `R:(not attached)` link to launch an R terminal.

![alt text](../assets/rdev12.png)

<!-- markdownlint-disable MD046 -->
!!! Note
    If you don't see the `R:(not attached)` link in the status
    bar, you can open an R terminal using the VS Code Command Palette. Click the
    cog icon ('Manage') in the bottom left of the VS Code window, then click
    `Command Palette` (note the keyboard shortcut displayed next to this menu
    item for future use). This starts a prompt at the top of the VS Code window.
    Type `R terminal` and select the command `R: Create R terminal`.
<!-- markdownlint-enable MD046 -->

3) You can then send code from the `.R` file to the R terminal by pressing
`cmd/ctrl + enter`.

![alt text](../assets/rdev5.png)
