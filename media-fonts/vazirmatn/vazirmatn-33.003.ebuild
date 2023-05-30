EAPI=8

inherit font

DESCRIPTION="A beautiful Persian font based on DejaVu font."
HOMEPAGE="https://github.com/rastikerdar/vazirmatn"
SRC_URI="https://github.com/rastikerdar/vazirmatn/releases/download/v${PV}/vazirmatn-v${PV}.zip -> ${P}.zip"
LICENSE="OFL"
SLOT="0"
KEYWORDS="amd64"
FONT_SUFFIX="ttf"
BDEPEND="app-arch/unzip"
S="${WORKDIR}/fonts/ttf"

src_unpack() {
	unpack "${P}.zip"
}
