## Workflow Actions

The R-Dev container repo has workflows that enable the container to be built for two architectures: AMD or ARM (like Mac with Apple Silicon or Raspberry Pis).

These are built each time the devel branch has a pull request.

There is a main file that is called, call_jobs.yml, that runs all the jobs. Tne file passes the following parameters to each build:

* The repository name
* The branch
* The current user
* The registry name
* The platform being built against

These parameters are passed to each workflow file to enable the containers to have the same information.

The containers are typically stored in the Github container repository, ghcr.io.
