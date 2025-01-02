#!/bin/sh

# For incremental
export SCONS_CACHE="./scons_cache/godot_4_scons_cache_macos_arm64";
mkdir -p $SCONS_CACHE
mkdir -p "./logs"

# Reference buildroot and see if scons is used from there
BUILDROOT_PATH="~/Buildroot/aarch64-godot-macos-gnu_sdk-buildroot/bin"
PATH=$BUILDROOT_PATH:$PATH
WHICHSCONS=$(which scons)



# Editor (tools)
scons -j2 platform=macos precision=double arch=arm64 2>&1 | tee ./logs/godot_4_scons_macos_arm64_tools_build.txt;

# Template(s)
scons -j2 platform=macos precision=double target=template_debug arch=arm64 2>&1 | tee ./logs/godot_4_scons_macos_arm64_template_build.txt;
#scons -j2 platform=macos precision=double target=template_release arch=arm64 2>&1 | tee ./logs/godot_4_scons_macos_arm64_template_release_build.txt;


	echo
	echo "          ==============================================="
	echo "          |       DONE BUILDING MACOS ARM64 bit        |"
	echo "          ==============================================="
	echo
