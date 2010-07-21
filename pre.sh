PM=/Developer/usr/bin/packagemaker

NM=preflight
ORD=000
PKG=build/$ORD-$NM.pkg

TMPDIR="tmp/$NM"

STAGINGDIR="$TMPDIR/stage"
SCRIPTSDIR="$TMPDIR/Scripts"
CONTENTSDIR="$STAGINGDIR/Contents"
PACKAGEINFO="$TMPDIR/PackageInfo"

mkdir -p $CONTENTSDIR
mkdir -p $SCRIPTSDIR

cat > $PACKAGEINFO <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<pkg-info format-version="2" identifier="haskell-platform.preflight" version="1" install-location="/" auth="root">
    <payload installKBytes="0" numberOfFiles="0"/>
    <scripts>
        <postinstall file="./postflight"/>
    </scripts>
</pkg-info>
EOF

rm -f $PKG

cp $NM $SCRIPTSDIR/postflight

$PM -o $PKG \
    --root $CONTENTSDIR \
    --id haskell-platform.preflight \
    --scripts $SCRIPTSDIR \
    --target 10.5 \
    --root-volume-only \
    --info $PACKAGEINFO

rm -Rf $TMPDIR
