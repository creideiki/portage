# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Metapackage for Creideiki's standard Gentoo install"
HOMEPAGE="https://github.com/creideiki/portage"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+X"

DEPEND="
    sys-apps/creideiki-base-meta

	X? ( sys-apps/creideiki-x-meta )
"
