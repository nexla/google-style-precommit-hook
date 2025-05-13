A handy [pre-commit](http://pre-commit.com/) hook which will run Google's java code style formatter for you on your code!

## Usage

Here's how to set up this pre-commit hook:

1.  Install `pre-commit`:
    ```bash
    pip install pre-commit==4.2.0
    ```

2.  Create a file named `.pre-commit-config.yaml` at the top of your repository with the following content:
    ```yaml
    repos:
    - repo: [https://github.com/maltzj/google-style-precommit-hook](https://github.com/maltzj/google-style-precommit-hook)
      sha: 0f5e77a35ebf7b5a1ace7d15a7d1c21b14d6da81
      hooks:
        - id: google-style-java
          files: \.java$
    ```

3.  Add `.cache/` to your project's `.gitignore` file. This directory is used by the hook.

4.  Install the pre-commit hooks in your repository:
    ```bash
    pre-commit install
    ```

Now, every time you attempt to commit changes, the `google-style-java` hook will automatically format your Java files according to the Google Java Style Guide. If any changes are made by the formatter, the commit will fail. This ensures that developers review the formatted code and manually stage the changes using `git add` before attempting to commit again.

#### Optional: IntelliJ Setup

For IntelliJ users who want their IDE to format code consistently with the pre-commit hook, follow these steps to import the Google Java Style scheme:

1.  Navigate to the IntelliJ settings: `IntelliJ IDEA` -> `Settings`.
2.  Go to `Editor` -> `Code Style` -> `Java`.
3.  Click on the `Gear Icon` (Scheme actions) in the top right corner.
4.  Select `Import Scheme...`.
5.  Choose the [intellij-java-google-style.xml](./intellij-java-google-style.xml) file (make sure this file is present in your project or you have the correct path to it).
6.  Click `OK`.
7.  It is also recommended to do `Tools` -> `Actions on Save`. Select both `Reformat Code` and `Optimize Imports`

This will configure IntelliJ to use the same Google Java Style Guide for formatting your code.
