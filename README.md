# 3EnRaya

Proyecto cliente-servidor en C para Linux Mint. El servidor central acepta varios clientes TCP, registra jugadores, administra una cola de espera y controla una partida 1 vs 1 de tres en raya.

## Requisitos

```bash
sudo apt update
sudo apt install build-essential make
```

Para compilar el informe LaTeX:

```bash
sudo apt install texlive-latex-base texlive-latex-recommended texlive-lang-spanish texlive-pictures
```

## Estructura

```text
.
|-- Makefile
|-- README.md
|-- docs/
|   `-- informe_3enraya.tex
|-- src/
|   |-- client.c
|   `-- server.c
|-- tests/
|   `-- smoke_test.sh
`-- .vscode/
    |-- settings.json
    `-- tasks.json
```

## Compilar

```bash
make
```

El Makefile usa el estilo de clase con:

```text
EXT = .c
SRCDIR = src
OBJDIR = obj
BINDIR = bin
```

Genera:

```text
bin/3enraya_server
bin/3enraya_client
```

## Ejecutar

Terminal 1:

```bash
./bin/3enraya_server --host 127.0.0.1 --port 5000
```

Terminal 2:

```bash
./bin/3enraya_client --host 127.0.0.1 --port 5000 --name Ramiro
```

Terminal 3:

```bash
./bin/3enraya_client --host 127.0.0.1 --port 5000 --name Paulo
```

En ambos clientes:

```text
QUEUE
```

## Comandos

```text
HELP
QUEUE
PLAYERS
SCORE
BOARD
MOVE <1-9>
QUIT
```

## Pruebas

```bash
make test
```

## Abrir en Visual Studio Code

```bash
code .
```

Las extensiones de C/C++, Makefile Tools y Code Runner pueden trabajar con esta estructura. La compilacion recomendada sigue siendo `make`.

## Informe

El informe esta en:

```text
docs/informe_3enraya.tex
```

Compilar PDF:

```bash
pdflatex -output-directory docs docs/informe_3enraya.tex
```
