pkgname=st
pkgver=0.8.2
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft' 'libxext' 'xorg-fonts-misc')
makedepends=('ncurses')
url="http://st.suckless.org"

hidecursorver=0.8.1
scrollbackver=0.8.2
scrollbackmousever=0.8.2

source=(http://dl.suckless.org/st/st-$pkgver.tar.gz
        https://st.suckless.org/patches/scrollback/st-scrollback-$scrollbackver.diff
        https://st.suckless.org/patches/scrollback/st-scrollback-mouse-$scrollbackmousever.diff
        https://st.suckless.org/patches/hidecursor/st-hidecursor-$hidecursorver.diff)

sha256sums=('aeb74e10aa11ed364e1bcc635a81a523119093e63befd2f231f8b0705b15bf35'
            '9c5aedce2ff191437bdb78aa70894c3c91a47e1be48465286f42d046677fd166'
            '6103a650f62b5d07672eee9e01e3f4062525083da6ba063e139ca7d9fd58a1ba'
            'bf3fe4e855f67fc9ae69b7328399ce06567f6aae3c9fb7fc8e7ec26c89e41dfd')

prepare() {
  cd $srcdir/$pkgname-$pkgver

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
