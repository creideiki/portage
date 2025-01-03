# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Unofficial open-source OpenGL/SDL2 reimplementation of Sid Meier's Alpha Centauri"
HOMEPAGE="https://github.com/afwbkbc/glsmac"

MY_PV="$(ver_cut 1-2)"
MY_COMMIT="75cd5ea"
SRC_URI="https://github.com/afwbkbc/glsmac/archive/v${MY_PV}-${MY_COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${MY_PV}-${MY_COMMIT}"

PATCHES=(
	"${FILESDIR}/${PN}-${MY_PV}-build-outside-git.patch"
)

LICENSE="AGPL-3+"
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

inherit cmake

src_prepare() {
	echo "#define GLSMAC_LAST_COMMIT \"${MY_COMMIT}\"" > "${S}"/src/tmp/last_commit.h

	cmake_src_prepare
}

src_install() {
	dodoc README.md
	exeinto /usr/bin
	newexe "${S}"_build/bin/GLSMAC glsmac
}
