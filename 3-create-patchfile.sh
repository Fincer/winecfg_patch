#!/bin/sh

# Create a patch file from winecfg code changes in the subdirectory b.

LC_ALL=C diff -Burp a/programs/winecfg/ b/programs/winecfg/ | grep -vi '^only in' > wine-staging_winecfg.patch
