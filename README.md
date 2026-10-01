# paymastech/homebrew-tap

Homebrew casks for the macOS apps published by PayMaster Technologies and Tetatet.
Same signed and notarized `.dmg` files as on the product sites, no modifications.

```sh
brew install --cask paymastech/tap/secretkeeper   # Secret Keeper   https://secretkeeper.net
brew install --cask paymastech/tap/tetatet        # Tetatet Chat    https://tetatet.net
brew install --cask paymastech/tap/snipmarker     # Snip Marker     https://snipmarker.com
brew install --cask paymastech/tap/inputfixer     # Input Fixer     https://inputfixer.com
```

## Updates

Every app ships with its own in-app updater (Sparkle), so the casks are marked
`auto_updates`: a plain `brew upgrade` leaves them alone and the app updates
itself. To update through Homebrew instead:

```sh
brew upgrade --cask --greedy secretkeeper
```

Cask versions are `x.y.z,build`, matching the version and build number shown in
the app's About screen. Casks are bumped by the release pipeline right after a
stable release is published; beta builds are not published here.

## Uninstall

```sh
brew uninstall --cask secretkeeper        # removes the app
brew uninstall --cask --zap secretkeeper  # also removes its data in ~/Library
```

## Issues

Problems with an app itself: use the support page of that product's site.
Problems with a cask (wrong checksum, broken URL): open an issue in this repository.
