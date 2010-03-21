#!/bin/sh

N=1
NN="001"

function increment {
    let N++
    export NN=`printf "%03d" $N`
}


####### FIRST: make the pre/post-flight packages

HERE=`pwd`

# FIXME: probably should be the same script
sh pre.sh
sh post.sh

mkdir -p build

HERE=`pwd`
PREFIX="/Library/Frameworks/HaskellPlatform.framework"

for i in `cat tmp/platform.packages`; do
    cd $HERE/tmp/$i
    OUT=$HERE/build/${NN}-${i}.pkg
    cabal2macpkg --prefix=$PREFIX -o$OUT
    /usr/sbin/installer -package $OUT -target /
    increment
done

