# st
a custom build of the [st](http://st.suckless.org/) (the simple/suckless terminal) for [archlinux](https://archlinux.org/)

## Installed patches
* [scrollback](https://st.suckless.org/patches/scrollback/)
* [hidecursor](https://st.suckless.org/patches/hidecursor/)
* [spoiler](https://st.suckless.org/patches/spoiler/)
* [dracula](https://st.suckless.org/patches/dracula/)
* [invert](https://st.suckless.org/patches/invert/)
* [ligatures](https://st.suckless.org/patches/ligatures/)

## Usage

Build the package but do not install it.
```sh
make
```

Start the compiled binary.
```sh
make start
```

Build the package and install it.
```sh
make install
```

## Shortcuts
* `Shift+MouseWheel` -- Scroll through the buffer
* `Ctrl+Shift+X` -- Invert the color schema
