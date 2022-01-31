# 
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# maz-1 <ohmygod19993 at gmail dot com>

include $(TOPDIR)/rules.mk

PKG_BRANCH:=git
PKG_SOURCE_URL:=https://github.com/nx111/oscam.git
#PKG_REV:=$(shell LC_ALL=C git info ${PKG_SOURCE_URL} | sed -ne's/^Last Changed Rev: //p')
PKG_REV:=a454c6702436479f369a202c5b55bbcc452a4770

PKG_NAME:=oscam
PKG_VERSION:=git$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_SOURCE_SUBDIR).tar.gz
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DEPENDS:=

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)



include $(INCLUDE_DIR)/package.mk

define Package/oscam
  SECTION:=stream
  CATEGORY:=Multimedia
  DEPENDS:=+libopenssl +libusb-1.0 +kmod-usb-serial +kmod-usb-serial-ch341 +kmod-usb-serial-ftdi +kmod-usb-serial-pl2303 +libpcsclite +pcscd +ccid
  TITLE:=Open Source Conditional Access Module software
  URL:=http://streamboard.gmc.to/oscam/
  SUBMENU:=
endef

define Package/oscam/description
	An Open Source Conditional Access Module software,
based on the very good MpCS version 0.9d created by dukat.
endef

CONFIGURE_CMD = ./config.sh
CONFIGURE_ARGS = \
        --enable all

MAKE_FLAGS += \
        CONF_DIR=/etc/oscam \
        OSCAM_BIN=Distribution/oscam \
        USE_SSL=1 \
        USE_LIBUSB=1 \
        USE_PCSC=1 \
        USE_LIBCRYPTO=1 \
        LEDSUPPORT=1

define Build/Prepare
	$(call Build/Prepare/Default)
	mkdir -p $(PKG_BUILD_DIR)/build
	cd $(PKG_BUILD_DIR)/build;
endef

define Package/oscam/conffiles
endef

define Build/Compile
	echo 'set (OSCAM_SYSTEM_NAME x86)' > $(PKG_BUILD_DIR)/toolchain.cmake
	echo 'set (CMAKE_SYSTEM_NAME Linux)' >> $(PKG_BUILD_DIR)/toolchain.cmake
	echo 'set (CMAKE_C_COMPILER $(TARGET_CROSS)gcc)' >> $(PKG_BUILD_DIR)/toolchain.cmake
	echo 'set (CMAKE_SYSTEM_PROCESSOR $(ARCH))' >> $(PKG_BUILD_DIR)/toolchain.cmake
	cd $(PKG_BUILD_DIR)/build;cmake -DCMAKE_TOOLCHAIN_FILE=$(PKG_BUILD_DIR)/toolchain.cmake ..;make
endef


define Package/oscam/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/oscam $(1)/usr/bin/
endef

$(eval $(call BuildPackage,oscam)) 
