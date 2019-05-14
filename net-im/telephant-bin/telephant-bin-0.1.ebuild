# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop

MY_PN="${PN%%-bin}"
MY_P="${MY_PN}_${PV}pre_Linux_64bit"

DESCRIPTION="A lightweight but modern Mastodon client, written in Go & QML"
HOMEPAGE="https://github.com/muesli/telephant"
SRC_URI="https://github.com/muesli/telephant/releases/download/v${PV}/${MY_P}
	https://raw.githubusercontent.com/muesli/telephant/master/assets/${MY_PN}.png"
IUSE="pulseaudio"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-qt/qtgui
	pulseaudio? ( media-sound/pulseaudio )
	!pulseaudio? ( media-sound/apulse )"

QA_PREBUILT="usr/bin/telephant"

src_unpack() {
	mkdir -p "${S}"
	cd "${S}"
	cp "${DISTDIR}"/"${MY_P}" "${MY_PN}"
	cp "${DISTDIR}"/"${MY_PN}.png" "${MY_PN}.png"
}

src_install() {
	dobin "${MY_PN}"
	doicon "${MY_PN}.png"

	local cmdline
	if use pulseaudio
	then
		cmdline="${MY_PN}"
	else
		cmdline="apulse ${MY_PN}"
	fi
	make_desktop_entry "${cmdline}" Telephant "${MY_PN}" "Network;InstantMessaging"
}
