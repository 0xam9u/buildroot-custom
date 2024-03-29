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
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		CC="$(TARGET_CC)" \
		AR="$(TARGET_CROSS)ar" \
		RANLIB="$(TARGET_CROSS)ranlib"
endef

define LIBCTEMPLATE_INSTALL_STAGING_CMDS
	mkdir -p $(STAGING_DIR)/usr/include/libctemplate
	cp $(@D)/*.h $(STAGING_DIR)/usr/include/libctemplate/
	mkdir -p $(STAGING_DIR)/usr/lib
	cp $(@D)/*.a $(STAGING_DIR)/usr/lib/
	cp $(@D)/*.so.* $(STAGING_DIR)/usr/lib/
	ln -sf $(STAGING_DIR)/usr/lib/libctemplate.so.1.0 $(STAGING_DIR)/usr/lib/libctemplate.so.1
	ln -sf $(STAGING_DIR)/usr/lib/libctemplate.so.1   $(STAGING_DIR)/usr/lib/libctemplate.so
endef

define LIBCTEMPLATE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib
	cp $(@D)/*.so.* $(TARGET_DIR)/usr/lib/
	ln -sf $(TARGET_DIR)/usr/lib/libctemplate.so.1.0 $(TARGET_DIR)/usr/lib/libctemplate.so.1
	ln -sf $(TARGET_DIR)/usr/lib/libctemplate.so.1   $(TARGET_DIR)/usr/lib/libctemplate.so
endef

$(eval $(generic-package))
