#!/bin/sh
#
# NOTE: Linux compilation script for ExampleMod
# TODO: Make it generic for any mods and then just execute it from the game?
# 

if [ $# -lt 1 ]; then
    printf "You must provide the path to SDK headers: ./Build.sh Path/To/Headers\n"
    exit 1
fi

if [ ! -d "$1" ]; then
    printf "Error: '$1' is not a valid directory.\n"
    exit 1
fi

SDK="$1"
Compiler="clang"

# NOTE: Dirs

BuildDir="Build"

mkdir -p ${BuildDir}

# NOTE: This is for printing.
Align="%-15s"

printf ${Align} "ExampleMod"
ExampleModSrc="Code/ExampleMod.c        \
               ../../Code/Public/Init.c
              "
ExampleModTarget="${BuildDir}/ExampleMod.wasm"
ExampleModFlags="-I${SDK} --target=wasm32 -nostdlib -Wl,--no-entry -Wl,--export-all -Wl,--allow-undefined"

${Compiler} ${ExampleModFlags} ${ExampleModSrc} -o ${ExampleModTarget}
printf "Done\n"
