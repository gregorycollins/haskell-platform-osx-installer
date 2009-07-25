CABAL2MACPKG=cabal2macpkg
GHC_PKG_URL="http://haskell.org/ghc/dist/6.10.3/GHC-6.10.4-i386.pkg"
GHC_PKG_FILE="GHC-6.10.4-i386.pkg"
EXEC_DEPS="cabal-install-0.6.2,alex-2.3.1,happy-1.18.4"
PREFIX=/Library/Frameworks/HaskellPlatform.framework

PATH := ${PREFIX}/bin:${PATH}

all:
	mkdir -p tmp
	mkdir -p build
	runhaskell util/Build.hs haskell-platform.cabal tmp
	./make-packages.sh

clean:
	rm -Rf build tmp
