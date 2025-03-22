
##### Installation Setup

1. Fork and Clone the repo -


```
git clone gh repo clone https://github.com/r-devel/r-dev-env.git
```


2. Change directory to r-dev-env

```
cd r-dev-env
```

3. Create virtual environment using python venv

```bash
python3 -m venv venv
```

4. Now activate the virtual environment

```bash
source ./venv/bin/activate
```

5. Now install libraries and dependencies for mkdocs

```bash
pip install mkdocs "mkdocs-material[imaging]"
```

6. After setting up the virtual environment and installing necessary libraries,
   navigate to the root directory of the project where the `mkdocs.yml` file is
   located.

7. To start the local development server and preview changes, run the following
   command:

```bash
mkdocs serve
```

This will compile the documentation and serve it locally. You can access the
documentation by opening a web browser and navigating to
<http://localhost:8000>.

8. Edit Documentation: Make changes to the documentation content files located

!!! Note

    There is a known issue with mkdocs not always finding Cairo. The issue and suggested fixes are on the [MkDocs Image Processing](https://squidfunk.github.io/mkdocs-material/plugins/requirements/image-processing/) page.
