################################################################################
#
# utelnetd
#
################################################################################

UTELNETD_VERSION = 0.1.11
UTELNETD_SOURCE = utelnetd-$(UTELNETD_VERSION).tar.gz
UTELNETD_SITE = https://public.pengutronix.de/software/utelnetd

define UTELNETD_BUILD_CMDS
  $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
    CROSS_COMPILE="$(TARGET_CROSS)"
endef

define UTELNETD_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	cp $(@D)/utelnetd $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
