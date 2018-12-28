# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN/-gui-bin/}"
COMMIT_ID=f11f4191e3
MY_PV="$(ver_cut 1-3)-$(ver_cut 4 ${PV/p//}).${COMMIT_ID}"

inherit unpacker

DESCRIPTION="Client for keybase.io (binary build of the GUI)"
HOMEPAGE="https://keybase.io/"
SRC_URI="
	amd64? ( https://s3.amazonaws.com/prerelease.keybase.io/linux_binaries/deb/${MY_PN}_${MY_PV}_amd64.deb )
	x86?   ( https://s3.amazonaws.com/prerelease.keybase.io/linux_binaries/deb/${MY_PN}_${MY_PV}_i386.deb )
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE=""

RDEPEND="
	app-crypt/gnupg
	~app-crypt/keybase-$(ver_cut 1-3)
"

QA_PREBUILT="
	opt/keybase/libffmpeg.so
	opt/keybase/libnode.so
	opt/keybase/Keybase
"

S="${WORKDIR}"

src_prepare() {
	default
	rm -r etc/
	rm -r usr/bin/
	rm -r usr/lib/
	rm opt/keybase/crypto_squirrel.txt
	rm opt/keybase/post_install.sh
}

src_install() {
	insinto /
	doins -r opt/
	doins -r usr/
	fperms +x /opt/keybase/Keybase
}
