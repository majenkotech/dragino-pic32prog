#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pic32prog
PKG_VERSION:=2.0.189
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
#PKG_SOURCE_URL:=https://github.com/sergev/pic32prog.git
PKG_SOURCE_URL:=https://github.com/majenkotech/pic32prog.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=f2988c6
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.bz2

PKG_MAINTAINER:=Serge Vakulenko <serge@vak.ru>
PKG_LICENSE:=BSD3

PKG_FIXUP:=autoreconf

#TARGET_CFLAGS=-I$(STAGING_DIR)/usr/lib/libiconv-full/include
#TARGET_LDFLAGS=-L$(STAGING_DIR)/usr/lib/libiconv-full/lib -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/root-ar71xx/lib/

include $(INCLUDE_DIR)/package.mk

define Package/pic32prog
	SECTION:=utils
	CATEGORY:=Development
	TITLE:=PIC32 Programming Tool
	DEPENDS:=
endef

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include

ifneq ($(CONFIG_USE_GLIBC),)
  TARGET_CFLAGS += -D_DEFAULT_SOURCE
endif

define Package/pic32prog/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/pic32prog $(1)/usr/bin
	$(INSTALL_BIN) ./files/run-pic32prog $(1)/usr/bin/run-pic32prog
endef

define Package/pic32prog/description
Pic32prog is a utility for loading data into a flash memory of Microchip PIC32
microcontrollers.  Supported adapters and bootloaders:
 * Microchip PICkit2
 * Microchip PICkit3 with scripting firmware
 * Olimex ARM-USB-Tiny (not finished yet)
 * Olimex ARM-USB-Tiny, ARM-USB-Tiny-H and ARM-USB-OCH-H JTAG adapters
 * Olimex MIPS-USB-OCH-H JTAG adapter
 * Bus Blaster v2 JTAG adapter from Dangerous Prototypes
 * Flyswatter JTAG adapter from TinCanTools
 * AN1388 HID bootloader
 * Legacy FS_USB HID bootloader
endef

CONFIGURE_ARGS += --enable-stk500v2

$(eval $(call BuildPackage,pic32prog))

