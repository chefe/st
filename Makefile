rebuild: clean build

build:
	makepkg .

start:
	./src/st-*/st

clean:
	rm -rf pkg src st-*.pkg.tar st-*.tar.gz st-*.diff st-*pkg.tar.xz

install: rebuild
	sudo pacman -U st-*.pkg.tar.xz
