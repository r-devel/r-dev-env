
# Contributing to r-dev-env

Thank you for your interest in contributing to the `r-dev-env` project! This document outlines the process and guidelines for contributing.

## Getting Started

1.  **Fork the Repository:**
    * Go to the [r-dev-env](https://github.com/r-devel/r-dev-env) repository.
    * Click the "Fork" button in the top-right corner.
    * This will create a copy of the repository in your GitHub account.

2.  **Clone Your Fork:**
    * Open your terminal or Git Bash.
    * Clone your forked repository to your local machine:
        ```
        git clone https://github.com/YOUR_USERNAME/r-dev-env.git
        cd r-dev-env
        ```
        (Replace `YOUR_USERNAME` with your GitHub username.)

3.  **Add the Upstream Repository:**
    * Add the original repository as an upstream remote:
        ```
        git remote add upstream https://github.com/r-devel/r-dev-env.git
        ```
    * This allows you to easily sync your fork with the latest changes.

4.  **Create a Branch:**
    * Before making any changes, create a new branch for your work:
        ```
        git checkout -b feature/your-feature-name
        ```
        (Replace `feature/your-feature-name` with a descriptive branch name.)

## Making Changes

1.  **Make Your Changes:**
    * Make your desired changes to the codebase.
    * Ensure your changes adhere to the project's coding style and best practices.
    * If you are adding new features, please add relevant tests.
    * If you are fixing a bug, please add a test that reproduces the bug.
    * If you are changing the documentation, make sure to test that the documentation renders correctly.

2.  **Commit Your Changes:**
    * Stage your changes:
        ```bash
        git add .
        ```
    * Commit your changes with a clear and concise message:
        ```bash
        git commit -m "Add feature: your feature description"
        ```
    * Follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification.

3.  **Sync Your Fork:**
    * Before pushing your changes, sync your fork with the upstream repository:
        ```bash
        git checkout main
        git pull upstream main
        git checkout feature/your-feature-name
        git rebase main
        ```
    * This ensures your changes are based on the latest version of the main branch.

4.  **Push Your Changes:**
    * Push your changes to your forked repository:
        ```bash
        git push origin feature/your-feature-name
        ```

## Submitting a Pull Request

1.  **Create a Pull Request:**
    * Go to your forked repository on GitHub.
    * Click the "Compare & pull request" button.
    * Provide a clear and descriptive title and description for your pull request.
    * Explain the purpose of your changes and any relevant context.
    * If your pull request addresses an existing issue, mention it in the description (e.g., "Fixes #123").

2.  **Review and Discussion:**
    * Your pull request will be reviewed by the project maintainers.
    * Be prepared to address any feedback or make necessary changes.
    * Participate in the discussion and respond to comments.

3.  **Merging:**
    * Once your pull request is approved, it will be merged into the main branch.


## Thank You!

Your contributions are greatly appreciated!

