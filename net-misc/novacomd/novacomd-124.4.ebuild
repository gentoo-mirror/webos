EAPI="5"
inherit webos-cmake webos-github

DESCRIPTION="Utility to communicate with a target device over USB or TCP/IP."
HOMEPAGE="https://github.com/openwebos/novacomd/"
SLOT="0"

KEYWORDS="amd64"
LICENSE="LGPL-2.1"
IUSE="upstart"

DEPEND="dev-libs/libusb"

src_prepare() {
	cmake-utils_src_prepare
	epatch "${FILESDIR}/0011-Fix-USB-read-write-operations.patch"
	epatch "${FILESDIR}/0011-Remove-verbose-output.patch"
}


src_configure() {
	local mycmakeargs+=(
	    -DWEBOS_TARGET_MACHINE_IMPL=host
	)

	webos-cmake_src_configure 
}

src_install() {
	cmake-utils_src_install

 	if ! use upstart; then
		rm "${D}"/etc/event.d/novacomd || die "This install doesn't provide upstart file Novacomd. Please, re-check ebuild"

		dobin "${FILESDIR}/novaterm"
		newinitd "${FILESDIR}/novacomd" novacomd
	fi
}

