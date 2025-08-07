# ueceTeX2

Trabalhos Acadêmicos em Latex usando abnTeX2 para Universidade Estadual do Ceará - UECE

## For Developers

Please install the following packages before building

```sh
sudo tlmgr install latexmk abntex2 minted hypdoc
```

## Using Docker To Build

Just the following command to create the image:

```sh
docker build -t uecetex2 .
```

And then type the following command to run it:

```sh
docker run --rm -it -v "$(pwd)/dist:/app/dist" uecetex2
```
