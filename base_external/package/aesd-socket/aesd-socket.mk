
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_SOCKET_VERSION = 88bba30bf447168d7b65e366db2939f4c3438cf
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_SOCKET_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-Rajshekhar1208.git
AESD_SOCKET_SITE_METHOD = git
AESD_SOCKET_GIT_SUBMODULES = YES

define AESD_SOCKET_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_SOCKET_INSTALL_TARGET_CMDS
        chmod +x $(@D)/server/aesdsocket-start-stop
        $(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment5-buildroot/* $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))
