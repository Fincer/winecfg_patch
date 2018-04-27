#!/bin/sh

# Make patched winecfg dialog and run it on Wine

WORKDIR=$(pwd)

cd ${WORKDIR}/winecfg_edits
make clean
make

WINEPREFIX=${WORKDIR}/winecfg_edits/.winecfg_testrun WINEARCH=win64 wine ${WORKDIR}/winecfg_edits/winecfg.exe.so
