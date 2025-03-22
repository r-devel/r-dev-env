Contributing to documentation helps improve the project and
and makes it more accessible. Follow these steps to set
up your environment, edit content, and preview changes
locally.

#### 1. Fork and Clone the Repository
- Fork the [r-dev-env repository](https://github.com/r-devel/r-dev-env) on GitHub and clone
  it to your local machine.

#### 2. Change to the Project Directory
- Navigate to the r-dev-env directory where the project is located.

 
#### 3. Create a Virtual Environment
- Set up a Python virtual environment using the venv module.


```
python3 -m venv venv
```


#### 4. Activate the Virtual Environment


- Activate the virtual environment to isolate dependencies.

```
source ./venv/bin/activate

``` 


#### 5. Install MkDocs and Dependencies

- Install MkDocs and its required libraries, including mkdocs-material.


``` 
pip install mkdocs "mkdocs-material[imaging]"
```

#### 6. Navigate to the Project Root

 
- After setting up the virtual environment and installing necessary

    libraries, navigate to the root directory of the project where the
    `mkdocs.yml` file is located.

#### 7. Start the Local Development Server


- To start the local development server and preview changes, run the
  following command:

```
 
mkdocs serve
```


This will compile the documentation and serve it locally. You can access the
documentation by opening a web browser and navigating to
<http://localhost:8000>.


- Make changes to the documentation content files located in the
     `docs` directory. You can use Markdown syntax for formatting.

#### 9. Preview Changes

- As you make changes, the local development server will automatically
     detect them and update the preview in real-time. Refresh your browser
     to see the changes.

**N.B.** There is a known issue with mkdocs not alwayds finding Cairo. The issue
and suggested fixes are on the [MkDocs Image
Processing](https://squidfunk.github.io/mkdocs-material/plugins/requirements/image-processing/)
page.
