<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.8/clipboard.min.js"></script>
## Contribution Workflow

#### 1. Example Contribution Workflow using DevContainer:
-  To start working in R we will click on `R:(not attach)` option which is in the bottom right of our R-dev codespace. It will open R terminal for us.
     
    ![image](https://github.com/r-devel/r-dev-env/assets/72031540/4ad3ed18-108a-4f29-ab6c-7f32d81721a7)

    ![image](https://github.com/r-devel/r-dev-env/assets/72031540/b3bdd3da-903d-4330-81c3-e41147d5dcd4)

-  We can now run R commands. We will use the `utils::askYesNo()` function as an example
    
    ![image](https://github.com/r-devel/r-dev-env/assets/72031540/00ffb5cf-250b-49d9-ab37-4028ad708164)

```R
    > askYesNo("Is this a good example?")
    Is this a good example? (Yes/no/cancel) Yes
    [1] TRUE 
```

#### 2. Editing Source Code
- Edit the source code of `utils::askYesNo()` to change the default options. The source code can be found in `$TOP_SRCDIR/src/library/utils/R/askYesNo.R`.

###### > Before edit:
![image](https://github.com/r-devel/r-dev-env/assets/72031540/6e7f368a-7a71-457c-a08e-de0d1b3c476f)

    
```{.R .clipboard-target .code-block-1}
    prompts = getOption("askYesNo", gettext(c("Yes", "No", "Cancel"))),
```
<button class="btn custom-btn" data-clipboard-target=".code-block-1">
   Copy to Clipboard
</button>

###### > With edit (for example - change to whatever you like!):
![image](https://github.com/r-devel/r-dev-env/assets/72031540/b7476540-1030-4f88-ae3c-1c2f9dd90deb)

```{.R .clipboard-target .code-block-2}
    prompts = getOption("askYesNo", gettext(c("Oh yeah!", "Don't think so", "Cancel"))),
```
<button class="btn custom-btn" data-clipboard-target=".code-block-2">
   Copy to Clipboard
</button>

#### 3. Rebuilding Package
- Re-build the utils package (we only need to re-build the part we have modified). We can rebuild the package by following simple steps.
    - First we need to be inside $BUILDDIR, for that we can change directory to `cd $BUILDDIR`.
    - After that we can run cmd `make` and `sudo make install` in a series.
       ![image](https://github.com/r-devel/r-dev-env/assets/72031540/e32f8b8f-c573-41e6-b4cc-31fb3494891a)

       ![image](https://github.com/r-devel/r-dev-env/assets/72031540/709dd607-5d22-4b17-90ad-8f642ecad6b6)

    - This will re-build any parts of R that have changed, in this case only re-building the utils package, then re-install R. If we open a new R terminal we will see our changes getting reflected.

#### 4. Cross check and Re-running Code 
- Check the edit has worked as expected by re-running the example code:
    ![image](https://github.com/r-devel/r-dev-env/assets/72031540/97fcfee8-dae5-402c-8bf4-0df62a63c3b0)

```R
    > askYesNo("Is this a good example?")
    Is this a good example? (Oh yeah!/don't think so/cancel) Oh yeah!
    [1] TRUE
```
