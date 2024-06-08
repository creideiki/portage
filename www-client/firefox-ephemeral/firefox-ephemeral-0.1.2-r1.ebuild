# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A script for running ephemeral private sessions of Firefox"
HOMEPAGE="https://github.com/creideiki/portage"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	sys-apps/firejail
	www-client/firefox
"

inherit desktop

src_unpack() {
	# Portage gets upset if $S doesn't exist.
	mkdir "${S}"
}

src_install() {
	exeinto /usr/bin
	doexe "${FILESDIR}"/firefox-ephemeral

	newmenu "${FILESDIR}"/"${PN}.desktop" "${PN}.desktop"
}
