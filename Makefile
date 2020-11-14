all:
	bash ./backup.sh
backup: 
	bash ./backup.sh
clean:
	rm -rf etc home var
install:
	bash ./install.sh
