TERMUX_PKG_HOMEPAGE=https://github.com/termux/libandroid-support
TERMUX_PKG_DESCRIPTION="Library extending the Android C library (Bionic) for additional multibyte, locale and math support"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_VERSION=25
TERMUX_PKG_SRCURL=https://github.com/termux/libandroid-support/archive/2b3ed873fc1fdb3772e72d8fbd8aa226ef684572.tar.gz
TERMUX_PKG_SHA256=3b45a68708c0f812f17a5b0c72d83c2bae7ca700770daf382d074481925fc0c3
TERMUX_PKG_BUILD_IN_SRC=yes
TERMUX_PKG_ESSENTIAL=yes

termux_step_make_install() {
	_C_FILES="src/musl-*/*.c"
	$CC $CFLAGS -std=c99 -DNULL=0 $CPPFLAGS $LDFLAGS \
		-Iinclude \
		$_C_FILES \
		-shared -fpic \
		-o $TERMUX_PREFIX/lib/libandroid-support.so
}
