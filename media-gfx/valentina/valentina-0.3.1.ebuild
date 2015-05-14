# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils qmake-utils

DESCRIPTION="Drawing application for sewing pattern design"
HOMEPAGE="http://valentinaproject.bitbucket.org/"
SRC_URI="https://bitbucket.org/dismine/valentina/get/v${PV}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	>=dev-qt/qtcore-5.2.0
	>=dev-qt/qtgui-5.2.0
	>=dev-qt/qtprintsupport-5.2.0
	>=dev-qt/qtsvg-5.2.0
	>=dev-qt/qtwidgets-5.2.0
	>=dev-qt/qtxml-5.2.0
	>=dev-qt/qtxmlpatterns-5.2.0
"

RDEPEND="
    ${DEPEND}
	app-text/poppler
"

S="${WORKDIR}/dismine-${PN}-d8d7cb2fad21/"

src_prepare() {
	epatch "${FILESDIR}/${PV}-disable-ccache.patch"
	epatch_user
}

src_configure() {
	eqmake5
}

src_install() {
	dolib.so src/libs/qmuparser/bin/libqmuparser.so{,.2,.2.2,.2.2.6}
	dolib.so src/libs/vpropertyexplorer/bin/libvpropertyexplorer.so{,.1,.1.0,.1.0.0}

	dobin src/app/bin/valentina

	insinto /usr/share/valentina/tables/standard
	doins src/app/bin/tables/standard/GOST_man_ru.vst

	insinto /usr/share/valentina/translations
	doins src/app/bin/translations/*

	domenu dist/${PN}.desktop
	doman dist/debian/${PN}.1

	einstalldocs
}
