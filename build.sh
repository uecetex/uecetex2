#!/bin/bash

VERSION=v1.0.1
CURRENT_DATE=`date +'%Y-%m-%d'`

function compileLaTeX(){

    local file="$1"

    base=$(basename "$file" .tex)
    dir=$(dirname "$file")

    echo "Compiling $texFile"

    latexmk -pdf -time -silent -output-directory="$dir" $base
}

function initialize(){

    # initializing: create empty directories
    rm -rf dist

    # creating directories for CTAN zip
    mkdir -p dist/uecetex2/{tex,doc}

    # copying all abntex2source files
    # mkdir -p target/abntex2source/
    cp -rf doc tex dist/uecetex2/


}

function install(){
    if [[ "$(uname)" == "Darwin" ]]; then
        mkdir -p ~/Library/texmf/tex/latex/uecetex2
        cp dist/uecetex2/tex/latex/uecetex2/* ~/Library/texmf/tex/latex/uecetex2/
    else
        mkdir -p ~/texmf/tex/latex/uecetex2/
        cp dist/uecetex2/tex/latex/uecetex2/* ~/texmf/tex/latex/uecetex2/
    fi
}

function buildExamples(){

    echo "Compiling examples"

    for file in dist/uecetex2/doc/latex/uecetex2/examples/*.tex; do
        compileLaTeX "$file"
    done
}

# Cross-platform sed in-place
function findAndReplace() {

    local pattern="$1"
    local file="$2"

    if [[ "$(uname)" == "Darwin" ]]; then
        sed -i '' "$pattern" "$file"
    else
        sed -i "$pattern" "$file"
    fi
}

function replaceVariable(){

    local token="$1"
    local value="$2"

    find dist \( -name "*.cls" -o -name "*.md" \) | while read -r file; do
        findAndReplace "s|$token|$value|g" "$file"
    done
}

function removeTempFiles(){
    # Delete everything except the following
    find dist/uecetex2/doc -type f ! \( -name '*.tex' -o -name '*.pdf' -o -name 'README' \) -delete
}

function main(){

    initialize

    replaceVariable "<VERSION>" $VERSION
    replaceVariable "<CURRENT_DATE>" $CURRENT_DATE

    install

    buildExamples

    removeTempFiles
}

main
