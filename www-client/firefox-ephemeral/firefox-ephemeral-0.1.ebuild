# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="A script for running ephemeral private sessions of Firefox"
HOMEPAGE="https://github.com/creideiki/portage"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	sys-apps/firejail
	www-client/firefox
"

inherit eutils

src_unpack() {
	# Portage gets upset if $S doesn't exist.
	mkdir "${S}"
}

src_install() {
	exeinto /usr/bin
	doexe "${FILESDIR}"/firefox-ephemeral

	newmenu "${FILESDIR}"/"${PN}.desktop" "${PN}.desktop"
}
