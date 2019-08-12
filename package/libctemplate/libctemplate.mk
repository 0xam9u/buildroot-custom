################################################################################
#
# libctemplate
#
################################################################################

LIBCTEMPLATE_VERSION = 1.0
LIBCTEMPLATE_SITE = http://downloads.sourceforge.net/project/libctemplate/libctemplate/libctemplate%20$(LIBCTEMPLATE_VERSION)
LIBCTEMPLATE_SOURCE = ctemplate-$(LIBCTEMPLATE_VERSION).tgz
LIBCTEMPLATE_LICENSE = GPL
LIBCTEMPLATE_LICENSE_FILES = COPYING
LIBCTEMPLATE_INSTALL_STAGING = YES

define LIBCTEMPLATE_BUILD_CMDS
#  $(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" AR="$(TARGET_CROSS)ar" RANLIB="$(TARGET_CROSS)ranlib" -C $(@D)
  $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
    CC="$(TARGET_CC)" \
    AR="$(TARGET_CROSS)ar" \
    RANLIB="$(TARGET_CROSS)ranlib"
endef

define LIBCTEMPLATE_INSTALL_STAGING_CMDS
	mkdir -p $(TARGET_DIR)/usr/include/libctemplate
	cp $(@D)/*.h $(TARGET_DIR)/usr/include/libctemplate/
	mkdir -p $(TARGET_DIR)/usr/lib
	cp $(@D)/*.a $(TARGET_DIR)/usr/lib/
endef

$(eval $(generic-package))
