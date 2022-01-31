PKG_NAME := v4l-dvb-linuxtv

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := git://linuxtv.org/media_build.git
PKG_SOURCE_VERSION := 	963b156d2d8eb45d1eca8414ee637c45a5b9852f
PKG_SOURCE_DATE := 2022-01-31

V4L_SOURCE_URL := git://linuxtv.org/media_tree.git
V4L_SOURCE_VERSION := 	7dc5fc6d3bd6779c4859d888221f47e986cb45b5
V4L_REPO_NAME := linux-media-linuxtv
V4L_SOURCE_FILE := $(V4L_REPO_NAME)-$(PKG_SOURCE_DATE)-$(shell printf '%.8s' $(V4L_SOURCE_VERSION)).tar.bz2

PATCH_DIR := patches-linuxtv
