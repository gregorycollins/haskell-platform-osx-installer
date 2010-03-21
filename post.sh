PM=/Developer/usr/bin/packagemaker

NM=postflight
ORD=999
PKG=build/$ORD-$NM.pkg

mkdir -p tmp/$NM/payload
mkdir -p tmp/$NM/scripts
mkdir -p build

rm -f $PKG
cp $NM tmp/$NM/scripts

$PM --root tmp/$NM/payload \
    --scripts tmp/$NM/scripts \
    -i org.haskell.haskell-platform.$NM \
    -o $PKG \
    --target 10.5 --root-volume-only

rm -Rf tmp/$NM
