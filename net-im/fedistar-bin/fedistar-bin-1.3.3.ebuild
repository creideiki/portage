# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg-utils

MY_PN="${PN%%-bin}"
MY_P="${MY_PN}_${PV}_amd64.deb"

DESCRIPTION="Multi-column Mastodon and Pleroma client for desktop"
HOMEPAGE="https://github.com/h3poteto/fedistar"
SRC_URI="https://github.com/h3poteto/fedistar/releases/download/v${PV}/${MY_P}"
S="${WORKDIR}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-libs/libappindicator:3
	dev-libs/openssl
	gnome-base/librsvg
	media-libs/vips
	net-libs/webkit-gtk:4
	x11-libs/gtk+:3
	x11-misc/appmenu-gtk-module"

QA_PREBUILT="usr/bin/${MY_PN}"

src_install() {
	dobin usr/bin/${MY_PN}

	local x
	for x in 32 128 256; do
		doicon -s ${x} usr/share/icons/hicolor/${x}*/apps/${MY_PN}.png
	done

	make_desktop_entry ${MY_PN} ${MY_PN^} ${MY_PN} "Network;InstantMessaging"
}

pkg_postinst() {
		xdg_desktop_database_update
		xdg_icon_cache_update
}

pkg_postrm() {
		xdg_desktop_database_update
		xdg_icon_cache_update
}
