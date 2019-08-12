################################################################################
#
# MEGATOOLS
#
################################################################################

MEGATOOLS_VERSION = 1.10.2
MEGATOOLS_SITE = https://megatools.megous.com/builds
MEGATOOLS_LICENCE = GPLv2

MEGATOOLS_CONF_OPTS = \
	--prefix=/usr

MEGATOOLS_DEPENDENCIES = host-pkgconf libglib2 libopenssl libcurl

$(eval $(autotools-package))
