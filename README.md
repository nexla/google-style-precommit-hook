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
    - repo: https://github.com/nexla/google-style-precommit-hook
      rev: 0f5e77a35ebf7b5a1ace7d15a7d1c21b14d6da81
      hooks:
        - id: google-style-java
          files: \.java$
    ```

3.  Add `.cache/` to your project's `.gitignore` file.

4.  Install the pre-commit hooks in your repository:
    ```bash
    pre-commit install
    ```

Now, every time you attempt to commit changes, the `google-style-java` hook will automatically format your Java files according to the Google Java Style Guide. If any changes are made by the formatter, the commit will fail. This ensures that developers review the formatted code and manually stage the changes using `git add` before attempting to commit again.

#### Optional: IntelliJ Setup

For IntelliJ users who want their IDE to format code consistently with the pre-commit hook, follow these steps to import the Google Java Style scheme:

1.  Download Google Java Format plugin version 1.24.0 from [here](https://plugins.jetbrains.com/plugin/8527-google-java-format/versions/stable/614263).
2.  Navigate to the IntelliJ settings: `IntelliJ IDEA` -> `Settings` -> `Plugins`.
3.  Click on `Gear Icon`, Select `Install PLugin From Disk` and Select the downloaded Plugin in the previous step.
4.  Add the below JRE config under `Help` → `Edit Custom VM Options`  from Intellij Top Menu
    ```
    --add-exports=jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED
    --add-exports=jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED
    --add-exports=jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED
    --add-exports=jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED
    --add-exports=jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED
    --add-exports=jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED
    ```
6.  Restart Intellij.
7.  Under `IntelliJ IDEA` -> `Settings` -> `google-java-style-Settings` verify `google-java-format` is `Enabled` with `Default Google Java Style`.
8.  It is also recommended to do `Tools` -> `Actions on Save` & then select both `Reformat Code` and `Optimize Imports`

This will configure IntelliJ to use the same Google Java Style Guide for formatting your code.

NOTE- The upstream repo is not maintained and is not accepting [PR](https://github.com/maltzj/google-style-precommit-hook/pull/29) to move to the latest versions of Google Java format. So a fork is being done. 
