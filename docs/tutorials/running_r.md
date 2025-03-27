1. Create a file in VS Code ending with a .R extension. You can create new files
   by clicking on the new file icon in VS Code Explorer, or use the `code` command
   in the terminal to create and open an R file:

```console
$ code R/test.R
```

2. You should see `R:(not attached)` in the Status Bar at the bottom of the
   VSCode window. Click on the `R:(not attached)` link to launch an R terminal.

3. You can then send code from the `.R` file to the R terminal. For example:

```R
# In test.R
print("Hello R Development!")
```

```Rconsole
> print("Hello R Development!")
[1] "Hello R Development!"
```

You can send code from the editor to the R terminal by pressing `cmd/ctrl + enter`.
