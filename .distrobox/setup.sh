#!/usr/bin/env bash
# Provisions the distrobox container with the Ruby/Jekyll toolchain used to
# build this site. There's no CI workflow to match versions against (build.sh
# is run locally and pushed straight to gh-pages), so this just pins a known-
# good Jekyll release for reproducibility.
set -euo pipefail

JEKYLL_VERSION="4.3.4"

export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

if ! command -v jekyll >/dev/null || [ "$(jekyll -v 2>/dev/null | grep -oP '\K[0-9.]+')" != "$JEKYLL_VERSION" ]; then
  echo "Installing Jekyll ${JEKYLL_VERSION} and bundler..."
  gem install --no-document jekyll:"${JEKYLL_VERSION}" bundler
else
  echo "Jekyll ${JEKYLL_VERSION} already installed."
fi

if ! grep -qxF 'export GEM_HOME="$HOME/gems"' "$HOME/.bashrc"; then
  {
    echo 'export GEM_HOME="$HOME/gems"'
    echo 'export PATH="$HOME/gems/bin:$PATH"'
  } >> "$HOME/.bashrc"
fi

echo "Provisioning complete. Open a new shell (or 'source ~/.bashrc'), then run:"
echo "  cd \$HOME/Developer/planet.bluesabre.org && jekyll build --destination build/"
