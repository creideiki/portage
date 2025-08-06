# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Creideiki's local Gentoo utilities"
HOMEPAGE="https://github.com/creideiki/portage"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm"
IUSE="+cron"

DEPEND="
	app-portage/gentoolkit
	cron? ( virtual/cron net-misc/rsync )
"

src_unpack() {
	# Portage gets upset if $S doesn't exist.
	mkdir "${S}"
}

src_install() {
	exeinto /usr/bin
	doexe "${FILESDIR}"/eresumelist

	if use cron; then
		exeinto /etc/cron.daily/
		newexe "${FILESDIR}"/update-portage.cron update-portage
	fi
}
