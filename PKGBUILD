pkgname=st
pkgver=0.8.1
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft' 'libxext' 'xorg-fonts-misc')
makedepends=('ncurses')
url="http://st.suckless.org"

alphaver=0.8.1
hidecursorver=0.8.1
scrollbackver=0.8.1
scrollbackmousever=0.8

source=(http://dl.suckless.org/st/st-$pkgver.tar.gz
        https://st.suckless.org/patches/alpha/st-alpha-$alphaver.diff
        https://st.suckless.org/patches/scrollback/st-scrollback-$scrollbackver.diff
        https://st.suckless.org/patches/scrollback/st-scrollback-mouse-$scrollbackmousever.diff
        https://st.suckless.org/patches/hidecursor/st-hidecursor-$hidecursorver.diff)

sha256sums=('c4fb0fe2b8d2d3bd5e72763e80a8ae05b7d44dbac8f8e3bb18ef0161c7266926'
            '7bf61cb8a505891574f3ad0a5420334d3e965b9f7d0067df3819eeef72ce1358'
            'ddc26e8e6dcce1a51f8aa8ed33072afcf4ff2d20f64ea24d96409479e86e8750'
            '3fb38940cc3bad3f9cd1e2a0796ebd0e48950a07860ecf8523a5afd0cd1b5a44'
            'bf3fe4e855f67fc9ae69b7328399ce06567f6aae3c9fb7fc8e7ec26c89e41dfd')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  patch -i ../st-alpha-$alphaver.diff
  patch -i ../st-hidecursor-$hidecursorver.diff
  patch -i ../st-scrollback-$scrollbackver.diff
  patch -i ../st-scrollback-mouse-$scrollbackmousever.diff

  # skip terminfo which conflicts with ncurses
  sed -i '/tic /d' Makefile

  # customize: set alpha value and background color
  make config.h
  sed "s/alpha = .*;/alpha = 180;/" -i config.h
  sed "s/defaultbg = .*;/defaultbg = 258;/" -i config.h
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
