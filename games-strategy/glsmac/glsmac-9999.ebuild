# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Reimplementation of Sid Meier's Alpha Centauri"
HOMEPAGE="https://github.com/afwbkbc/glsmac"

EGIT_REPO_URI="https://github.com/afwbkbc/glsmac"

PATCHES=(
	"${FILESDIR}/${PN}-${PV}-get-font-from-source-directory.patch"
)

LICENSE="AGPL-3+ OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-cpp/yaml-cpp
	dev-libs/ossp-uuid
	media-libs/freetype
	media-libs/glew
	media-libs/glu
	media-libs/libsdl2
	media-libs/sdl2-image
"
DEPEND="${RDEPEND}"

CMAKE_BUILD_TYPE=Release

inherit cmake git-r3

src_prepare() {
	echo "#define GLSMAC_LAST_COMMIT \"${MY_COMMIT}\"" > "${S}"/src/tmp/last_commit.h

	cmake_src_prepare
}

src_install() {
	dodoc README.md

	exeinto /usr/bin
	newexe "${S}"_build/bin/GLSMAC glsmac

	insinto /usr/share/glsmac
	doins -r "${S}"/GLSMAC_data
}
