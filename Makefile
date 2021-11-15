# Directories

SRC_DIR = src
IMG_DIR = img
RPT_DIR = report
ARCH_DIR = dist

# Utils

dist: clean
	@mkdir -p $(ARCH_DIR)
	@echo "> Archiving :"
	tar -czvf $(ARCH_DIR)/ProjetBDD2-matthieu_freitag.tar.gz Makefile README.md $(SRC_DIR) $(IMG_DIR) $(RPT_DIR)

clean:
	@echo "> Cleaning :"
	rm -rf $(ARCH_DIR)