# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A script for running ephemeral incognito sessions of Chromium"
HOMEPAGE="https://github.com/creideiki/portage"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	www-client/chromium
"

inherit eutils

src_unpack() {
	# Portage gets upset if $S doesn't exist.
	mkdir "${S}"
}

src_install() {
	exeinto /usr/bin
	doexe "${FILESDIR}"/chromium-ephemeral

	newmenu "${FILESDIR}"/"${PN}.desktop" "${PN}.desktop"
}
