# Build for spark3
docker run --rm -it -v $(pwd):/workspace -v $HOME/.m2:/root/.m2 livy-ci mvn package \
        -Pspark3 \
        -Pscala-2.12 \
        -DskipTests \
        -DskipITs \
        -Dmaven.javadoc.skip=true

# Make dist
rm -rf dist

# Make dirs target files
mkdir -p dist/repl_2.12-jars
mkdir -p dist/rsc-jars
mkdir -p dist/jars

# Copy 
cp -r bin dist/bin
cp -r conf dist/conf
cp server/target/jars/* dist/jars
cp repl/scala-2.12/target/jars/* dist/repl_2.12-jars/
cp rsc/target/jars/* dist/rsc-jars/