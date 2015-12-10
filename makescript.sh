#!/usr/bin/env/ bash
platform='unknown'
unamestr=`uname`
if [[ "$(expr substr $(uname -s) 1 10)" == 'Linux' ]]; then
    platform='linux'
elif [[ "$(uname)" == 'Darwin' ]]; then
    platform='darwin'
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
    platform='mingw32_nt'
fi

if [[ $platform == 'linux' || $platform == 'mingw32_nt' ]]; then
    doc2dash -fv --name Editorial -d build -i icon.png --index-page index.html editorial-docs
    cd _build && tar --exclude='.DS_Store' -cvzf Editorial.tgz Editorial.docset
elif [[ $platform == 'darwin' ]]; then
    doc2dash -fv --name Editorial -i icon.png --index-page index.html -A editorial-docs
fi