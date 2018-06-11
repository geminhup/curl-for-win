#!/bin/sh

# Copyright 2017-2018 Viktor Szakats <https://vszakats.net/>
# See LICENSE.md

# Note: Travis-CI-specific

[ "${CC}" = 'mingw-clang' ] && _optpkg='llvm'

export HOMEBREW_NO_AUTO_UPDATE=1
time travis_retry brew update > /dev/null
time travis_retry brew upgrade python3
time travis_retry brew install xz gnu-tar mingw-w64 ${_optpkg} \
                               jq osslsigncode dos2unix gnu-sed
time travis_retry brew install --force-bottle --build-bottle wine
time wineboot --init

./_build.sh
