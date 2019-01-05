rebuild: clean build

build:
	makepkg .

clean:
	rm -rf pkg src st-*.pkg.tar st-*.tar.gz st-*.diff

install:
	sudo pacman -U st-*.pkg.tar

