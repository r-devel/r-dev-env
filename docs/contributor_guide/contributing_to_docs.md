
##### Installation Setup

1. Fork and Clone the repo -

2. Change directory to r-dev-env

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
   in the `docs` directory. You can use Markdown syntax for formatting.

9. Preview Changes: As you make changes, the local development server will
   automatically detect them and update the preview in real-time. Refresh your
   browser to see the changes.

**N.B.** There is a known issue with mkdocs not alwayds finding Cairo. The issue
and suggested fixes are on the [MkDocs Image
Processing](https://squidfunk.github.io/mkdocs-material/plugins/requirements/image-processing/)
page.
