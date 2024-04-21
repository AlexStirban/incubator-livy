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
mkdir -p dist/livy/repl_2.12-jars
mkdir -p dist/livy/rsc-jars
mkdir -p dist/livy/jars

# Copy 
cp -r bin dist/livy/bin
cp -r conf dist/livy/conf
cp server/target/jars/* dist/livy/jars
cp repl/scala-2.12/target/jars/* dist/livy/repl_2.12-jars/
cp rsc/target/jars/* dist/livy/rsc-jars/

cp LICENSE dist/livy/LICENSE
cp DISCLAIMER dist/livy/DISCLAIMER
cp NOTICE dist/livy/NOTICE

# Compress
cd dist
tar -czvf livy-0.8.0-spark3-jvm.tar.gz livy  