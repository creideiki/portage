# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Metapackage for Creideiki's standard Gentoo install (base packages)"
HOMEPAGE="https://github.com/creideiki/portage"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+alsa"

DEPEND="
	app-admin/logrotate
	app-admin/makepasswd
	app-admin/mcelog
	app-admin/metalog
	app-admin/sysstat
	app-arch/unrar
	app-cdr/cdrtools
	app-cdr/dvd+rw-tools
	app-crypt/gnupg
	app-crypt/rotix
	app-editors/emacs
	app-editors/nano
	app-editors/vim-core
	app-forensics/chkrootkit
	app-misc/colordiff
	app-misc/screen
	app-portage/creideiki-gentoo-utils
	app-portage/eix
	app-portage/elogv
	app-portage/genlop
	app-portage/gentoolkit
	app-portage/layman
	app-shells/bash-completion
	app-shells/gentoo-bashcomp
	app-text/texlive
	app-text/tree
	dev-util/cscope
	dev-util/ltrace
	dev-util/strace
	dev-vcs/cvs
	dev-vcs/git
	dev-vcs/rcs
	dev-vcs/subversion
	alsa? ( media-sound/alsa-utils )
	media-sound/vorbis-tools
	media-video/mediainfo
	media-video/mkvtoolnix
	net-analyzer/ettercap
	net-analyzer/nettop
	net-analyzer/nmap
	net-analyzer/tcpdump
	net-analyzer/traceroute
	net-dns/bind-tools
	net-fs/sshfs
	net-misc/curl
	net-misc/dhcpcd
	net-misc/keychain
	net-misc/netkit-telnetd
	net-misc/ntp
	net-misc/whois
	net-misc/youtube-dl
	sci-calculators/units
	sys-apps/dmidecode
	sys-apps/ethtool
	sys-apps/hdparm
	sys-apps/hwids
	sys-apps/iproute2
	sys-apps/lm_sensors
	sys-apps/lshw
	sys-apps/mlocate
	sys-apps/smartmontools
	sys-apps/usbutils
	sys-block/di
	sys-devel/bc
	sys-fs/cryptsetup
	sys-fs/ncdu
	sys-fs/ntfs3g
	sys-fs/simple-mtpfs
	sys-fs/squashfs-tools
	sys-fs/sysfsutils
	sys-libs/gpm
	sys-power/cpupower
	sys-power/powertop
	sys-process/fcron
	sys-process/htop
	sys-process/iotop
	sys-process/lsof
	www-client/links
"
