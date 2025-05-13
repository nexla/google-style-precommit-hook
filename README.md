A handy [pre-commit](http://pre-commit.com/) hook which will run Google's java
code style formatter for you on your code!

Usage:

```
pip install pre-commit==4.2.0
```

Create a file named `.pre-commit-config.yaml` at the top of the repo.

```
repos:
- repo: https://github.com/maltzj/google-style-precommit-hook
  sha: 0f5e77a35ebf7b5a1ace7d15a7d1c21b14d6da81
    hooks:
      - id: google-style-java
        files: \.java$
```

This file stores Google's code style formatter jar in a `.cache/`
directory so that it doesn't need to be re-downloaded each time.  So, add `.cache/` to the `.gitignore` file of the project which
uses this hook.

#### Optional instruction for Intellij User

Follow the below from Intellij top menu to import [intellij-java-google-style.xml](./intellij-java-google-style.xml) in Intellij so that Intellij can be used to format code as per the Google Java style guide.

`Intellij IDEAD` -> `Settings` -> `Editor` -> `CodeStyle` -> `Java` -> `Gear Icon` -> `Import Scheme`
