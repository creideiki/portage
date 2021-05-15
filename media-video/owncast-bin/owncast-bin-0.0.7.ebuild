# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN%%-bin}"

DESCRIPTION="A self-hosted live video and web chat server"
HOMEPAGE="https://owncast.online/"
SRC_URI="https://github.com/owncast/owncast/releases/download/v${PV}/${MY_PN}-${PV}-linux-64bit.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	acct-user/owncast
	acct-group/owncast
	media-video/ffmpeg"

QA_PREBUILT="usr/bin/owncast"

src_unpack() {
	mkdir "${S}"
	cd "${S}"
	unpack "${A}"
}

src_install() {
	dobin "${MY_PN}"

	dodoc README.md

	newinitd "${FILESDIR}"/owncast.initd owncast

	diropts -m 0700 -o owncast -g owncast
	insopts -m 0600 -o owncast -g owncast
	dodir "/var/lib/${MY_PN}"
	insinto "/var/lib/${MY_PN}"
	doins -r data static webroot
}

pkg_preinst() {
	if has_version "${CATEGORY}/${PN}" ; then
		upgrading=1
	fi
}

pkg_postinst() {
	if [[ "${upgrading}" != "1" ]] ; then
		einfo "The admin interface at http://localhost:8080/admin/"
		einfo "has default username 'admin' and password 'abc123'."
		einfo "The default stream key is 'abc123'."
	fi

	einfo "Hardware accelerated transcoding requires support in media-video/ffmpeg, see https://owncast.online/docs/codecs/"
}
