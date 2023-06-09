# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit readme.gentoo-r1
inherit git-r3

PROPERTIES="live"
RESTRICT="mirror"
EGIT_REPO_URI="https://github.com/zdharma/${PN}.git"
DESCRIPTION="Optimized and extended zsh-syntax-highlighting"
HOMEPAGE="https://github.com/zdharma/fast-syntax-highlighting"
SRC_URI=""


LICENSE="HPND"
SLOT="0"
KEYWORDS=""

RDEPEND="app-shells/zsh"
DEPEND=""

src_prepare() {
	sed -i -e 's/^\([[:space:]]*\)\(curl\|wget\)/\1: \2/' -- "$S/F-Sy-H.plugin.zsh" || die
	eapply_user
}

src_install() {
	local DISABLE_AUTOFORMATTING DOC_CONTENTS dir
	dir="/usr/share/zsh/site-contrib/${PN}"
	DISABLE_AUTOFORMATTING="true"
	DOC_CONTENTS="In order to use ${CATEGORY}/${PN} add
	. ${EPREFIX}${dir}/fast-syntax-highlighting.plugin.zsh"'
	at the end of your ~/.zshrc
	For testing, you can also execute the above command in your zsh.'
	readme.gentoo_create_doc
	insinto "${dir}"
	doins -r *
}

pkg_postinst() {
	readme.gentoo_print_elog
}
