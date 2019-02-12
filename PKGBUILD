pkgname=st
pkgver=0.8.2
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft' 'libxext' 'xorg-fonts-misc')
makedepends=('ncurses')
url="http://st.suckless.org"

alphaver=20190116-3be4cf1
hidecursorver=0.8.1
scrollbackver=20190122-3be4cf1
scrollbackmousever=0.8

source=(http://dl.suckless.org/st/st-$pkgver.tar.gz
        https://st.suckless.org/patches/alpha/st-alpha-$alphaver.diff
        https://st.suckless.org/patches/scrollback/st-scrollback-$scrollbackver.diff
        https://st.suckless.org/patches/scrollback/st-scrollback-mouse-$scrollbackmousever.diff
        https://st.suckless.org/patches/hidecursor/st-hidecursor-$hidecursorver.diff)

sha256sums=('aeb74e10aa11ed364e1bcc635a81a523119093e63befd2f231f8b0705b15bf35'
            '539bb46e4bd1be02d37d0e83a5f31a45959a43a2a2dc99d04fb40a344a262f60'
            '30c9bcec5801614dd5cc8b96f470d7431e83d5d2af87bb2305df60082e5ab4ed'
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
