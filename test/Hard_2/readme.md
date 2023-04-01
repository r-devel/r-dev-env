# Hard 2 Test
Hard: Once you are able to build R within the codespace or locally on your OS, modify or add a function in one of the base R packages and re-build R. Take a screenshot that shows your new/modified function working in the dev container and provide a brief description (< 100 words) of your modification.

### Steps :
1. Create file inside R-devel/src/library/stats/R/custom.R

![SS1](https://user-images.githubusercontent.com/72031540/229244004-66ec1235-a6ef-4da7-ab7d-d2bae6510454.png)
![SS2](https://user-images.githubusercontent.com/72031540/229243929-29ce4eb1-0745-4114-8f44-95f56e2efba8.png)

2. Written custom function and exported function inside Namespace

3. Rebuild R source
- make
- sudo make install

4. Now we can use our custom function. Output!!!
![SS3](https://user-images.githubusercontent.com/72031540/229243979-c4c04eec-c1fd-4c14-bad2-220734c025de.png)
