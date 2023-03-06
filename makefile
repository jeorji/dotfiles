.CONFIG_FOLDERS := $(shell find .config -mindepth 1 -maxdepth 1 -type d)
FOLDERS := $(patsubst .config/%, $(HOME)/.config/%, $(.CONFIG_FOLDERS))

.CONFIG_FILES := $(shell find . -maxdepth 1 -type f -name ".*")
FILES := $(patsubst ./%, $(HOME)/%, $(.CONFIG_FILES))

all: $(FOLDERS) $(FILES)

# Rule to create symbolic links for config folders
$(HOME)/.config/%: .config/%
	@echo "Creating symlink for $<"
	ln -sf $(abspath $<) $@

# Rule to create symbolic links for config files
$(HOME)/.%: ./%
	@echo "\n Creating symlink for $<"
	ln -f $(abspath $<) $@

# Rule to remove symbolic links
clean:
	@echo "Removing symbolic links"
	$(foreach folder, $(FOLDERS), unlink $(folder);)
	$(foreach file, $(FILES), unlink $(file);)

# Rule to remove directories
rm-clean:
	@echo "Removing directories"
	$(foreach folder, $(FOLDERS), rm -rf $(folder);)
	$(foreach file, $(FILES), rm -rf $(file);)
