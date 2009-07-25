#!/bin/sh

N=0
NN="000"

function increment {
    let N++
    export NN=`printf "%03d" $N`
}

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

