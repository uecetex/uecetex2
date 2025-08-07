#!/bin/bash

echo -----------------------------------------------------
echo ueceTeX2 BUILDER SCRIPT
echo https://github.com/uecetex
echo -----------------------------------------------------

CURRENT_DATE=`date +'%Y-%m-%d'`

function compile_latex(){

    local file="$1"

    base=$(basename "$file" .tex)
    dir=$(dirname "$file")

    echo "Compiling $texFile"

    latexmk -pdf -halt-on-error -time -output-directory="$dir" $base || exit 1
}

function initialize(){

    echo -----------------------------------------------------
    echo Initializing
    echo -----------------------------------------------------

    # Remove 'dist' folder and all its content if it exists
    rm -rf dist

    # Create directories for CTAN zip
    mkdir -p dist/uecetex2/{tex,doc}

    # Copy all content from 'doc' folder
    cp -rf doc dist/uecetex2/

    # Copy all content from 'tex' folder
    cp -rf tex dist/uecetex2/

    # Copy the README.md file
    cp README.md dist/uecetex2
}

function is_macos() {
    [[ "$(uname)" == "Darwin" ]]
}

function install(){

    echo -----------------------------------------------------
    echo Installing locally
    echo -----------------------------------------------------

    if is_macos; then
        mkdir -p ~/Library/texmf/tex/latex/uecetex2
        cp dist/uecetex2/tex/latex/uecetex2/* ~/Library/texmf/tex/latex/uecetex2/
    else
        mkdir -p ~/texmf/tex/latex/uecetex2/
        cp dist/uecetex2/tex/latex/uecetex2/* ~/texmf/tex/latex/uecetex2/
    fi
}

function compiling_documentation(){

    echo -----------------------------------------------------
    echo Compiling documentation
    echo -----------------------------------------------------

    find dist \( -name "*.tex" \) | while read -r file; do
       compile_latex "$file"
    done
}

# Cross-platform sed in-place
function find_and_replace() {

    local pattern="$1"
    local file="$2"

    if is_macos; then
        sed -i '' "$pattern" "$file"
    else
        sed -i "$pattern" "$file"
    fi
}

function replace_variable(){

    local token="$1"
    local value="$2"

    find dist \( -name "*.cls" -o -name "*.md" -o -name "*.tex" \) | while read -r file; do
        find_and_replace "s|$token|$value|g" "$file"
    done
}

function remove_latex_temp_files(){

    echo -----------------------------------------------------
    echo Removing latex temporary files
    echo -----------------------------------------------------

    # Deletes all files in 'dist' except .tex and .pdf

    find dist/uecetex2/doc -type f ! \( -name '*.tex' -o -name '*.pdf' -o -name 'README' \) -delete

    # Removing files from _minted folder.

    find . -type d -name "_minted*" -exec rm -rf {} +
}

function zip_to_ctan(){

    local version="$1"

    echo -----------------------------------------------------
    echo Zipping to CTAN
    echo -----------------------------------------------------

    cd dist

    zip -vr "uecetex2-$version.zip" uecetex2 -x "*.DS_Store"
}

function main(){

    local version="$1"

    initialize

    replace_variable "<VERSION>" $version
    replace_variable "<CURRENT_DATE>" $CURRENT_DATE

    install

    compiling_documentation

    remove_latex_temp_files

    zip_to_ctan $version

    echo -----------------------------------------------------
    echo Done
    echo -----------------------------------------------------
}

# Set default value for $1 if not provided
if [ -z "$1" ]; then
    set -- "v1.0.0-snapshot"
fi

main $1
