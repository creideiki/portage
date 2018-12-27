# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN/-bin/}"
COMMIT_ID=01e9fa19eb
MY_PV="$(ver_cut 1-3)-$(ver_cut 4 ${PV/p//}).${COMMIT_ID}"

inherit unpacker

DESCRIPTION="Client for keybase.io (binary version with GUI)"
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
	!app-crypt/kbfs
	!app-crypt/keybase
"

QA_PREBUILT="
	opt/keybase/libffmpeg.so
	opt/keybase/libnode.so
	opt/keybase/Keybase
	usr/bin/git-remote-keybase
	usr/bin/kbfsfuse
	usr/bin/keybase
	usr/bin/keybase-redirector
"

S="${WORKDIR}"

src_prepare() {
	default
	rm usr/bin/kbnm
	rm -r etc/
	rm -r usr/lib/mozilla/
	rm opt/keybase/post_install.sh
	unpack usr/share/doc/keybase/changelog.Debian.gz
	rm -r usr/share/doc/keybase/
}

src_install() {
	insinto /
	dodoc changelog.Debian
	doins -r opt/
	doins -r usr/
	fperms +x /opt/keybase/Keybase
	fperms +x /usr/bin/git-remote-keybase
	fperms +x /usr/bin/kbfsfuse
	fperms +x /usr/bin/keybase
	fperms +x /usr/bin/keybase-redirector
	fperms +x /usr/bin/run_keybase
}

pkg_postinst() {
	elog "Start/Restart keybase: run_keybase"
	elog "Run the service:       keybase service"
	elog "Run the client:        keybase login"
	ewarn "Note that the user keybasehelper is obsolete and can be removed"
}
