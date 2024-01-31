# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="A script for running ephemeral incognito sessions of Chrome"
HOMEPAGE="https://github.com/creideiki/portage"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	sys-apps/firejail
	www-client/google-chrome
"

inherit desktop

src_unpack() {
	# Portage gets upset if $S doesn't exist.
	mkdir "${S}"
}

src_install() {
	exeinto /usr/bin
	doexe "${FILESDIR}"/"${PN}"

	newmenu "${FILESDIR}"/"${PN}.desktop" "${PN}.desktop"
}
