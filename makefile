.CONFIG_FOLDERS := $(shell find .config -mindepth 1 -maxdepth 1 -type d)
FOLDERS := $(patsubst .config/%, $(HOME)/.config/%, $(.CONFIG_FOLDERS))

all: $(FOLDERS)

# Rule to create symbolic links
$(HOME)/.config/%: .config/%
	@echo "Creating symlink for $<"
	ln -sf $(abspath $<) $@

# Rule to remove symbolic links
clean:
	@echo "Removing symbolic links"
	$(foreach folder, $(FOLDERS), unlink $(folder);)

# Rule to remove directories
rm-clean:
	@echo "Removing directories"
	$(foreach folder, $(FOLDERS), rm -rf $(folder);)
