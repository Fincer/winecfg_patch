# winecfg_patch
An unofficial patch for Wine configuration window (winecfg)

# About

This project adds the following features to the default Wine configuration dialog window (winecfg):

### Winecfg About tab

- Shows Wine prefix architecture (either 32-bit or 64-bit)

- Adds Wine prefix folder URL link: open the current prefix folder with your default file manager (Dolphin, Nautilus, Thunar etc.)

### Winecfg Staging tab

- Adds checkbox: Disable GLSL support

- Adds checkbox: Disable Multisampling Support

- Adds checkbox: Check Float Constants in D3D shaders

IMAGE_PLACEHOLDER

*Above features have already been implemented*

## System Requirements

- Wine or Wine Staging (Staging version is recommended for the provided patch file)

- The following Unix/Linux binaries must be found in the PATH: patch, diff, make, git, ping, nproc, wine

Tested on Arch Linux, 64-bit Wine Staging Git

----------------------------------

# Roadmap

There are several ideas how to improve usability of Wine configuration window. These ideas have not yet been implemented but are as follows.

## TODO list

- meet quality requirements - get rid of compiler warnings

- **Staging tab** - add the following sections:

    * **Combobox: DirectDrawRenderer (Direct3D)**
        * Values: [gdi, opengl]

    * **Combobox: MaxVersionGL (Direct3D)**
        * Values: [4.5, 3.2, 1.0]

    * **Combobox: OffscreenRenderingMode (Direct3D)**
        * Values: [fbo, backbuffer]

    * **Combobox: VideoMemorySize (Direct3D)**
        * Values: [8192, 4096, 3072, 2048, 1024, 768, 512, 384, 256, 128, 64, 32]

    * **Combobox: MouseWarpOverride (DirectInput)**
        * Values: [enable, disable, force]

    * **ShowCrashDialog (WineDbg)**
        * Checkbutton: [yes, no]
        * If set to yes, show default crash pop-up window when an application crashes

    * **Input value: ForceRefreshRate (DirectDraw)**
        * Value: User input (only integers allowed, max value is 120, min value is 1)

- **Libraries tab**:

    * Expanded list of available DLL overrides for easier management
        * In current Wine it is only a single-line list which is troublesome to use

    * DLL override multiselection
        * with possibility to set all selected overrides to use any mixture of Native, Builtin DLLs

IMAGE_PLACEHOLDER

*This manipulated image is for demonstration purposes*

- **Debug tab** - add new this new tab to winecfg with the following contents:

    * **Button: Generate bug report**
        * Wine version
        * CPU model
        * GPU model
        * GPU Drivers
        * OpenGL version
        * DLL overrides
        * Windows version
        * etc. (Other Wine prefix-specific configuration...)

- **Winetricks tab** - implement Winetricks management directly into winecfg

    * Improves usability of Winetricks on Wine

    * Features:

        * **1)** Find Winetricks script file

            * a) Find Winetricks script automatically

            * b) IF Winetricks script is not automatically found, THEN let user define its location in the system and print text "Winetricks not configured" to winecfg Winetricks tab

        * **2)** Available Winetricks packages

            * Parse all available packages listed in Winetricks script file

            * Create an item array list "Available runtime libraries" which consist of all these packages for winecfg

            * Make all items selectable in winecfg. Support for multiselection

        * **3)** Create back-end for installing and uninstalling Wineprefix runtime libraries

            * **Button: Install**
                * Available if single or multiple libraries with status "Not installed" is selected from the runtime library list in winecfg
                * If above conditions are not met, grey the button out

            * **Button: Uninstall**
                * Available if single or multiple libraries with status "Installed" is selected from runtime library list in winecfg
                * If above conditions are not met, grey the button out
                * Needs additional back-end support, reverting Winetricks changes not yet implemented in Wine

IMAGE_PLACEHOLDER

*This manipulated image is for demonstration purposes*

----------------------------------

# Purpose & Motivation

Purpose of this project is to improve usability of Wine Configuration dialog window for a casual Wine user

----------------------------------

# Usage

- **1) Set up the environment:** 1-preconf-winecfg.sh

    * Downloads Wine & Wine Staging sources, sets up development environment & applies the patched code provided by _wine-staging_winecfg.patch_
    * Run only once

- **2) Test winecfg changes:** 2-run-winecfg.sh

    * Creates a new Wine prefix for winecfg test runs and runs Wine configuration window
    * Run after every code change

- **3) Create a new patch file:** 3-create-patchfile.sh 

    * Run whenever you patch the code in 'winecfg_edits' subfolder and want to create a new patch file. NOTE: Replaces the patch file _wine-staging_winecfg.patch_

If you just want to apply the modifications for Wine configuration window but not to involve into development, grab _wine-staging_winecfg.patch_ and apply it to Wine source code after having applied Staging patchsets (Wine source <- Wine Staging patchsets <- wine-staging_winecfg.patch).

----------------------------------

# FAQ

- Q: Which users this project is targeted to?

    * A: Mainly to developers who want to improve Wine and to people who want to try new things.

- Q: Can I use this patch on my default Wine installation?

    * A: Yes, but you probably need to compile Wine from source first.

- Q: Which licence does this project use?

    * A: The code is licensed under the same license than the Wine main project. See 'License' section for details.

- Q: I have an idea and want to implement it? Can I contribute the project?

    * A: Absolutely! Feel free to fork and improve the code as you wish. Just follow the terms of the project license.

----------------------------------

# License

This project is licensed under [LGPLv2.1](https://github.com/Fincer/winecfg_patch/blob/master/LICENSE) to stay compatible with the Wine main project. For Wine licensing, see the following links: 

- [WineHQ - License](https://www.winehq.org/license)

- [Wine source - COPYING.LIB](https://source.winehq.org/source/COPYING.LIB)
