PKG_NAME := v4l-dvb-linuxtv

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := git://linuxtv.org/media_build.git
PKG_SOURCE_VERSION := 	7253675c65ed84dc294ef25e2af873e8092be48b
PKG_SOURCE_DATE := 2021-08-17

V4L_SOURCE_URL := git://linuxtv.org/media_tree.git
V4L_SOURCE_VERSION := 	9c3a0f285248899dfa81585bc5d5bc9ebdb8fead
V4L_REPO_NAME := linux-media-linuxtv
V4L_SOURCE_FILE := $(V4L_REPO_NAME)-$(PKG_SOURCE_DATE)-$(shell printf '%.8s' $(V4L_SOURCE_VERSION)).tar.bz2

PATCH_DIR := patches-linuxtv
