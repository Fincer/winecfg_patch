#!/bin/bash

# Configure test environment for Wine Configuration dialog (winecfg) test runs
#
# Wine must be installed.
# Wine-Staging recommended (and required by the original patch file).

function do_winecfg_changes {

    echo -e "**This script is meant to be executed only once just for setting up initial winecfg development environment**\n**You need to run it only once**\n"

    WORKDIR=$(pwd)

    local URL="source.winehq.org"

    PROGRAMS=(git make ping wine patch nproc)
    
    i=0
    for program in ${PROGRAMS[@]}; do
        if [ $(echo $(which $program &>/dev/null)$?) -ne 0 ]; then
            ERRPROGRAMS[$i]=$program
            let i++
        fi
    done
    
    if [ -z ERRPROGRAMS ]; then
        echo "Please install the following programs: ${ERRPROGRAMS[*]}"
        exit 1
    fi
    
    if [[ ! $(ping -c 3 $URL 2>&1 | grep -c "unknown host") -eq 0 ]]; then
        echo -e "\nCan't connect to $URL. Please check your internet connection and try again.\n"
        exit 1
    fi

    if [ ! -d a ]; then
        echo "Cloning wine into folder 'a'. This step takes a while..."
        git clone https://source.winehq.org/git/wine.git a
    fi
    if [ ! -d wine-staging ]; then
        git clone https://github.com/wine-staging/wine-staging.git
    fi

    wine-staging/patches/patchinstall.sh DESTDIR=${WORKDIR}/a \
    -W winecfg-Libraries winecfg-Staging winecfg-Unmounted_Devices
    
    cd a
    ./configure
    make -j$(nproc --ignore 1)

    cd ${WORKDIR}
    
    echo "Cloning compiled wine into folder 'b'"
    cp -R a b

    cd b/programs/winecfg
    make clean
    
    cd ${WORKDIR}/b
    patch -Np1 -i ../wine-staging_winecfg.patch

    cd ${WORKDIR}
    ln -s b/programs/winecfg winecfg_edits

    echo -e "\nWine source files are ready. You can find winecfg C source files in 'winecfg_edits' directory.\nChange the source code as you like and then execute '2-run-winecfg.sh' shell script.\nYou don't need to run this script anymore unless main winecfg program is updated by Wine developers.\n"
    
}

do_winecfg_changes
