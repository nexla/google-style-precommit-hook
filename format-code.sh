#!/usr/bin/env sh

VERSION="1.24.0"

mkdir -p .cache
cd .cache
if [ ! -f google-java-format-${VERSION}-all-deps.jar ]
then
    curl -LJO "https://github.com/google/google-java-format/releases/download/v${VERSION}/google-java-format-${VERSION}-all-deps.jar"
    chmod 755 google-java-format-${VERSION}-all-deps.jar
fi
cd ..

java \
--add-exports jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED \
--add-exports jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED \
--add-exports jdk.compiler/com.sun.tools.javac.main=ALL-UNNAMED \
--add-exports jdk.compiler/com.sun.tools.javac.model=ALL-UNNAMED \
--add-exports jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED \
--add-exports jdk.compiler/com.sun.tools.javac.processing=ALL-UNNAMED \
--add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED \
--add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED \
--add-opens jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED \
--add-opens jdk.compiler/com.sun.tools.javac.comp=ALL-UNNAMED \
-jar .cache/google-java-format-${VERSION}-all-deps.jar --replace $@
