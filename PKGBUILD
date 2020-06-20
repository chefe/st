pkgname=st
pkgver=0.8.4
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft' 'libxext' 'xorg-fonts-misc')
makedepends=('ncurses')
url="http://st.suckless.org"

hidecursorver=0.8.3
scrollbackver=20200419-72e3f6c
scrollbackmousever=20191024-a2c479c
spoilerver=20180309-c5ba9c0
draculaver=0.8.2
ligaturesbasever=0.8.3
ligaturesver="scrollback-20200430-$ligaturesbasever"
invertver=0.8.2

source=(http://dl.suckless.org/st/st-$pkgver.tar.gz
        https://st.suckless.org/patches/spoiler/st-spoiler-$spoilerver.diff
        https://st.suckless.org/patches/dracula/st-dracula-$draculaver.diff
        https://st.suckless.org/patches/ligatures/$ligaturesbasever/st-ligatures-$ligaturesver.diff
        https://st.suckless.org/patches/invert/st-invert-$invertver.diff
        https://st.suckless.org/patches/scrollback/st-scrollback-$scrollbackver.diff
        https://st.suckless.org/patches/scrollback/st-scrollback-mouse-$scrollbackmousever.diff
        https://st.suckless.org/patches/hidecursor/st-hidecursor-$hidecursorver.diff)

sha256sums=('d42d3ceceb4d6a65e32e90a5336e3d446db612c3fbd9ebc1780bc6c9a03346a6'
            'd947586a2059adbbcbd7c35733450530038aa5cf97c1e3e586728606ba6f8f4b'
            '5eb8e0375fda9373c3b16cabe2879027300e73e48dbd9782e54ffd859e84fb7e'
            'd8adb94a880e29c615bea67acda27c4f4f2e1e7eb90909f6d19976a6181fef30'
            '2107473b74fcea5bac93135c51b9cfe57060fcba9abd87dd303ad03cda1a6a65'
            '1e41fe17a5ef5a8194eea07422b49d815e2c2bb4d58d84771f793be423005310'
            '319458d980195d18fa0f81a6898d58f8d046c5ff982ab872d741f54bb60e267d'
            '31bb2d8f2a297ec8854d990cc923f813604e3cbc3265432e0078b73b2e5614dd')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  echo "  -> Fix issues with hidecursor ..."
  sed -i s/forceselmod/forcemousemod/ ../st-hidecursor-$hidecursorver.diff

  echo "  -> Patch hidecursor ..."
  patch -i ../st-hidecursor-$hidecursorver.diff

  echo "  -> Patch scrollback ..."
  patch -i ../st-scrollback-$scrollbackver.diff
  patch -i ../st-scrollback-mouse-$scrollbackmousever.diff

  echo "  -> Patch ligatures ..."
  patch -i ../st-ligatures-$ligaturesver.diff

  echo "  -> Patch spoiler ..."
  patch -i ../st-spoiler-$spoilerver.diff

  echo "  -> Patch dracula ..."
  patch -i ../st-dracula-$draculaver.diff

  echo "  -> Fix issue with invert ..."
  sed -i '30d' ../st-invert-$invertver.diff
  sed -i "32i\ static\ void\ ttysend(const\ Arg\ \*);" ../st-invert-$invertver.diff
  sed -i "22i\ \t{ ShiftMask,            XK_Page_Up,     kscrollup,      {.i = -1} }," ../st-invert-$invertver.diff
  sed -i "23i\ \t{ ShiftMask,            XK_Page_Down,   kscrolldown,    {.i = -1} }," ../st-invert-$invertver.diff
  sed -i "26d" ../st-invert-$invertver.diff
  sed -i "25d" ../st-invert-$invertver.diff

  echo "-> Patch invert ..."
  patch -i ../st-invert-$invertver.diff

  # skip terminfo which conflicts with ncurses
  sed -i '/tic /d' Makefile
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
