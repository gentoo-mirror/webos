EAPI=5

inherit webos-cmake webos-github

DESCRIPTION="The Open webOS logging library"
HOMEPAGE="https://github.com/openwebos/pmloglib"
SLOT="0"

KEYWORDS="x86 amd64 ~arm"
LICENSE="Apache-2.0"

DEPEND="dev-libs/libpbnjson"

PATCHES=( "${FILESDIR}/0001-Add-to-pkgconfig-file-pbnjson-library-dependency.patch" )
