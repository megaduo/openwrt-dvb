# 
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# maz-1 <ohmygod19993 at gmail dot com>

include $(TOPDIR)/rules.mk

PKG_NAME:=oscam
PKG_REV:=r11693
PKG_VERSION:=1.20-$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=a84bc697b8fa4c486ddce983009af5015c7a556d
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/nx111/oscam.git
PKG_SOURCE:=$(PKG_SOURCE_SUBDIR).tar.bz2
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_MAINTAINER:=OSCam developers <unknown>
PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=COPYING


PKG_BUILD_PARALLEL:=1





include $(INCLUDE_DIR)/package.mk

define Package/oscam
  SECTION:=stream
  CATEGORY:=Multimedia
  DEPENDS:=+libopenssl +libusb-1.0 +kmod-usb-serial +kmod-usb-serial-ch341 +kmod-usb-serial-ftdi +kmod-usb-serial-pl2303 +libpcsclite +pcscd +ccid
  TITLE:=Open Source Conditional Access Module software
  URL:=http://streamboard.gmc.to/oscam/
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



define Package/oscam/conffiles
/etc/oscam/
endef

define Package/oscam/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/Distribution/oscam $(1)/usr/bin/oscam

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/oscam.init $(1)/etc/init.d/oscam

	$(INSTALL_DIR) $(1)/etc/oscam
	$(INSTALL_CONF) ./files/oscam.conf $(1)/etc/oscam/oscam.conf
	
	$(INSTALL_DIR) $(1)/etc/oscam
	$(INSTALL_CONF) ./files/oscam.server $(1)/etc/oscam/oscam.server
	
	$(INSTALL_DIR) $(1)/etc/oscam
	$(INSTALL_CONF) ./files/oscam.user $(1)/etc/oscam/oscam.user
	
endef

define Package/$(PKG_NAME)/prerm
	#!/bin/sh
	# if run within buildroot exit
	[ -n "$${IPKG_INSTROOT}" ] && exit 0

	# stop running scripts
	/etc/init.d/oscam disable
	/etc/init.d/oscam stop

	exit 0
endef

$(eval $(call BuildPackage,oscam)) 
