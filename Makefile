CABAL2MACPKG=cabal2macpkg
GHC_PKG_URL="http://haskell.org/ghc/dist/6.10.3/GHC-6.10.4-i386.pkg"
GHC_PKG_FILE="GHC-6.10.4-i386.pkg"
EXEC_DEPS="cabal-install-0.6.2,alex-2.3.1,happy-1.18.4"


all:
	mkdir -p build
	$(CABAL2MACPKG) --meta --outdir=build \
			--prefix=/Library/Frameworks/HaskellPlatform.framework \
	                --executable-dependencies=$(EXEC_DEPS)




setup:
	mkdir -p tmp
	runhaskell util/Build.hs haskell-platform.cabal tmp
	for i in `cat tmp/platform.packages`; do
		sudo cabal install -O2 --reinstall --global $i
	done

clean:
	rm -Rf build
