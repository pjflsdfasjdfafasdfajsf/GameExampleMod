#!/bin/sh
#
# NOTE: Linux compilation script for ExampleMod
# 
set -e

# TODO: Distribute libSDK.so instead and link to it dynamically.
if [ $# -lt 2 ]; then
    printf "You must provide the path to SDK headers and libSDK_wasm.a:\n"
    printf "Usage: ./Build.sh Path/To/Headers Path/To/libSDK_wasm.a\n"
    exit 1
fi

Headers="$1"
Lib="$2"

if [ ! -d "${Headers}" ]; then
    printf "Error: '${Headers}' is not a valid directory.\n"
    exit 1
fi

if [ ! -f "${Lib}" ]; then
    printf "Error: '${Lib}' is not a valid file.\n"
    exit 1
fi

Compiler="clang"

# NOTE: Dirs
BuildDir="Build"
mkdir -p ${BuildDir}

# NOTE: This is for printing.
Align="%-15s"

printf ${Align} "ExampleMod"
ExampleModSrc="Code/ExampleMod.c"
ExampleModTarget="${BuildDir}/ExampleMod.wasm"
ExampleModFlags="-I${Headers} --target=wasm32 -nostdlib -Wl,--no-entry -Wl,--export-all -Wl,--allow-undefined"

${Compiler} ${ExampleModFlags} ${ExampleModSrc} -Wl,--whole-archive "${Lib}" -Wl,--no-whole-archive -o ${ExampleModTarget}

printf "Done\n"
