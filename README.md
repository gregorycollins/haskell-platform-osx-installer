This stuff is a mess but it's improving, despite my cosmic psychic
battle with Apple's demonic engineers.

Instructions:

* install cabal2macpkg: http://github.com/gregorycollins/cabal2macpkg/tree/master

* zap your GHC install: "sudo
  /Library/Frameworks/GHC.framework/Tools/Uninstaller"

* "rm -Rf ~/.ghc ~/.cabal" (just to make sure)

* install a fresh GHC binary package

* make sure cabal-install is installed, run "cabal update"

* run "sudo make" -- this will dump a bunch of .pkg files into a
  subdirectory of build/.

* Using Apple's GUI packagemaker tool, package those up along with the
  "pkg/hp-postflight.pkg" file (make sure that one goes last!) into a
  haskell-platform-xxxx.w.y.z.pkg installer package.

* build a .dmg file containing the GHC installer package and the
  platform installer package. If you can figure out how to bundle
  these together, PLEASE email me: greg@gregorycollins.net.

  There's an Illustrator file containing the background I've been
  using in the img/ directory (mostly cosmetic)

Good luck (you'll probably need it)!
